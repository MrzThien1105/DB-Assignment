-- Active: 1775061495821@@127.0.0.1@3306@grab
-- Function 1: GrabCoins bonus for passengers
-- A function that calculates a special end-of-month "GrabCoin" loyalty bonus for a passenger. 
-- Instead of a flat earn rate, the rewards are dynamic. 
-- The function evaluates each trip row-by-row, granting bonus multipliers 
-- based on the luxury level of the ride and 
-- the passenger's engagement (whether they left a rating).
USE GRAB;

-- DROP FUNCTION `GRAB_COIN_BONUS`;

DELIMITER //

CREATE FUNCTION GRAB_COIN_BONUS(
    P_PASSENGER_ID INT,
    P_TARGET_MONTH INT,
    P_TARGET_YEAR INT
)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE V_TOTAL_EXTRA_COINS INT DEFAULT 0;
    DECLARE V_TRIP_EXTRA_COINS DECIMAL(10, 2) DEFAULT 0;
    DECLARE V_BASE_COINS INT;
    DECLARE V_SERVICE_LEVEL ENUM(
        'Standard',
        'Saver',
        'Electric'
    );
    DECLARE V_RATING_STARS INT;
    DECLARE V_BOOKING_HOUR INT;
    DECLARE V_PAID_BY_CASH BOOLEAN;
    DECLARE V_TRIP_COUNTER INT DEFAULT 0;
    DECLARE V_PASSENGER_EXISTS INT;
    DECLARE DONE BOOLEAN DEFAULT FALSE;


    -- Declare cursor
    DECLARE TRIP_CURSOR CURSOR FOR
        SELECT T.OBTAINED_GRABCOIN, M.SERVICE_LEVEL, C.RATING_STARS,
                HOUR(T.BOOKING_TIME), TX.PAID_BY_CASH
        FROM TRIP T
        JOIN COMPLETED_TRIP C ON T.TRIP_ID = C.TRIP_ID
        JOIN TRANSPORT_MODE M ON T.MODE_ID = M.MODE_ID
        LEFT JOIN PAYMENT_TRANSACTION TX ON C.TRIP_ID = TX.TRIP_ID
        WHERE T.PASSENGER_ID = P_PASSENGER_ID
            AND MONTH(C.TO_TIME) = P_TARGET_MONTH
            AND YEAR(C.TO_TIME) = P_TARGET_YEAR
        ORDER BY C.TO_TIME ASC;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;

    -- Input validation
    IF P_TARGET_MONTH NOT BETWEEN 1 AND 12 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid month';
    END IF;

    SELECT COUNT(*) INTO V_PASSENGER_EXISTS
    FROM PASSENGER WHERE ACCOUNT_ID = P_PASSENGER_ID;

    IF V_PASSENGER_EXISTS = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Passenger does not exist';
    END IF;

    REWARD_LOOP: LOOP
        FETCH TRIP_CURSOR INTO V_BASE_COINS, V_SERVICE_LEVEL, V_RATING_STARS, V_BOOKING_HOUR, V_PAID_BY_CASH;

        IF DONE THEN
            LEAVE REWARD_LOOP;
        END IF;

        SET V_TRIP_COUNTER = V_TRIP_COUNTER + 1;
        SET V_TRIP_EXTRA_COINS = 0;

        -- Bonus for green energy
        IF V_SERVICE_LEVEL = 'Electric' THEN
            SET V_TRIP_EXTRA_COINS = V_TRIP_EXTRA_COINS + V_BASE_COINS;
        END IF;

        -- Rush hour bonus (7-8 AM and 5-6 PM)
        IF V_BOOKING_HOUR IN (7, 8, 17, 18) THEN
            SET V_TRIP_EXTRA_COINS = V_TRIP_EXTRA_COINS + (V_BASE_COINS * 0.5);
        END IF;

        -- Cashless bonus
        IF V_PAID_BY_CASH = FALSE THEN
            SET V_TRIP_EXTRA_COINS = V_TRIP_EXTRA_COINS + 5;
        END IF;

        -- Engagement bonus
        IF V_RATING_STARS = 5 THEN
            SET V_TRIP_EXTRA_COINS = V_TRIP_EXTRA_COINS + 10;
        END IF;

        -- Bonus for every 5th trip of the month
        IF V_TRIP_COUNTER % 5 = 0 THEN
            SET V_TRIP_EXTRA_COINS = V_TRIP_EXTRA_COINS + 100;
        END IF;

        SET V_TOTAL_EXTRA_COINS = V_TOTAL_EXTRA_COINS + ROUND(V_TRIP_EXTRA_COINS);
    
    END LOOP;

    
    CLOSE TRIP_CURSOR;
        
    RETURN V_TOTAL_EXTRA_COINS;

END//

DELIMITER ;