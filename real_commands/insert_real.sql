INSERT INTO user_account
(NAME, PHONE_NUMBER, EMAIL, ACCOUNT_PASSWORD, GENDER, AVATAR) VALUES
('Đặng Quí', '0474213546', 'dangqui@example.com', 'dangqui', 'Male', NULL),
('Vương Anh Tuấn', '036988860', 'vuonganhtuan@example.com', 'vuonganhtuan', 'Male', NULL),
('Lạc Toàn Quân', '0119094843', 'lactoanquan@example.com', 'lactoanquan', 'Male', NULL),
('Chu Minh Thức', '0276301993', 'chuminhthuc@example.com', 'chuminhthuc', 'Male', NULL),
('Phan Ngọc Giác', '0257991897', 'phanngocgiac@example.com', 'phanngocgiac', 'Male', NULL),
('Vương Kim', '0880550902', 'vuongkim@example.com', 'vuongkim', 'Female', NULL),
('Trương Thị Vy', '0393012273', 'truongthivy@example.com', 'truongthivy', 'Female', NULL),
('Ngô Tham', '0438911414', 'ngotham@example.com', 'ngotham', 'Male', NULL),
('Đào Bình Viện', '0478471276', 'daobinhvien@example.com', 'daobinhvien', 'Male', NULL),
('Trương Trúc Nam', '0772619483', 'truongtrucnam@example.com', 'truongtrucnam', 'Female', NULL);

INSERT INTO user_notification
(TITLE, CONTENT,TIME) VALUES
('Deal sốc năm mới','Từ 1/1/2026 đến ngày 3/1/2026, giảm 30% cho cuốc đi xe ôtô.','2026-01-01 09:30:00'),
('Khao trọn ngày cá tháng tư','Trong ngày 1/4/2026, giảm 15% nếu thanh toán bằng thẻ tín dụng OCB','2026-04-01 09:00:00'),
('Ưu đãi từ BIDV','Từ hôm nay đến ngày 31/12/2026, BIDV có ưu đãi dành cho chủ thẻ BIDV, giảm 10.000 cho các cuốc >= 30.000, giảm 30.000 cho cuốc từ 90.000','2026-02-02 09:30:00'),
('Liên kết ví Momo, trao deal liền tay!','Đến 1/6/2026, liên kết ví Momo để nhận ngay ưu đãi giảm 20% cho cuốc đi xe ôtô.','2026-02-13 09:30:00'),
('Ưu đãi đặc biệt từ Vietcombank','Từ hôm nay đến ngày 1/5/2026, Vietcombank có ưu đãi dành cho chủ thẻ Vietcombank, giảm 15.000 cho các cuốc >= 45.000, giảm 50.000 cho cuốc từ 150.000','2026-02-14 09:30:00');

INSERT INTO TRANSPORT_MODE
(TYPE, SEAT_CAPACITY, SERVICE_LEVEL) VALUES
('Bike', 1, 'Standard'),
('Bike', 1, 'Saver'),
('Car', 4, 'Standard'),
('Car', 4, 'Saver'),
('Car', 4, 'Electric'),
('Car', 6, 'Standard');

INSERT INTO DISCOUNT
(MAX_USAGE,VALID_UNTIL_DATE,DISCOUNT_TYPE,PERCENTAGE_DISCOUNT,AMOUNT_DISCOUNT) VALUES
(5, '2026-01-01 23:59:59', 'Percentage', 0.30, NULL),
(5, '2026-04-01 23:59:59', 'Percentage', 0.15, NULL),
(5, '2026-12-31 23:59:59', 'Amount', NULL, 10000),
(5, '2026-12-31 23:59:59', 'Amount', NULL, 30000),
(5, '2026-06-01 23:59:59', 'Percentage', 0.20, NULL),
(5, '2026-05-01 23:59:59', 'Amount', NULL, 15000),
(5, '2026-05-01 23:59:59', 'Amount', NULL, 50000);

INSERT INTO ACCOUNT_COMMUNICATION
(ACCOUNT_ID, COMMUNICATION_TYPE) VALUES
(1, 'Email'),(1, 'SMS'),(1, 'Push Notification'),
(2, 'Email'),(2, 'SMS'),(2, 'Push Notification'),
(3, 'Email'),(3, 'SMS'),(3, 'Push Notification'),
(4, 'Email'),(4, 'SMS'),(4, 'Push Notification'),
(5, 'Email'),(5, 'SMS'),(5, 'Push Notification'),
(6, 'Email'),(6, 'SMS'),(6, 'Push Notification'),
(7, 'Email'),(7, 'SMS'),(7, 'Push Notification'),
(8, 'Email'),(8, 'SMS'),(8, 'Push Notification'),
(9, 'Email'),(9, 'SMS'),(9, 'Push Notification'),
(10, 'Email'),(10, 'SMS'),(10, 'Push Notification');

INSERT INTO PASSENGER
(ACCOUNT_ID, GRABCOINS) VALUES
(1,2002),
(2,1975),
(3,100),
(4,91),
(5,7);

INSERT INTO DRIVER
(ACCOUNT_ID, DRIVER_LICENSE_GRADE, CURRENT_BALANCE) VALUES
(6,'A1',1000000),
(7,'A1',1500000),
(8,'B2',750000),
(9,'A1',600000),
(10,'A2',2000000);

INSERT INTO REFERRAL
(DRIVER_ID, REFERRER_ID) VALUES
(6,10),
(7,6),
(8,6),
(9,6),
(10,6);

INSERT INTO bank_account
(BANK_NAME,ACCOUNT_NUMBER,DRIVER_ID) VALUES
('BIDV','179784021',6),
('BIDV','513661723',7),
('BIDV','551768767',8),
('Vietcombank','802767',9),
('Vietcombank','370610',10);

INSERT INTO SAVED_LOCATION
(PASSENGER_ID, SUGGESTIVE_NAME, ADDRESS, COORDINATE_Y, COORDINATE_X) VALUES
(1,'BK cs1','268 Đ. Lý Thường Kiệt, Phường Diên Hồng, Hồ Chí Minh',10.772011, 106.657882),
(2,'Cổng BK cs2','Khu phố Tân Lập, Phường Đông Hòa, TP.HCM',10.880458, 106.805564),
(3,'VP tuyển sinh quốc tế','Kiosk 98, 142A Tô Hiến Thành, Phường Diên Hồng, TP.HCM',10.773533, 106.661055),
(3,'Khoa CSE','268 Đ. Lý Thường Kiệt, Phường Diên Hồng, Hồ Chí Minh',10.773500, 106.660683),
(4,'Circle K cs1','268 Đ. Lý Thường Kiệt, Phường Diên Hồng, Hồ Chí Minh',10.772807, 106.658603),
(5,'Sân tập đá banh Phú thọ','1 Đ. Lữ Gia, Phường 15, Phú Thọ, Hồ Chí Minh',10.769086, 106.658159);

INSERT INTO VEHICLE
(PLATE_NUMBER,MAKE,MODEL,COLOR,CAPACITY,REGISTRANT_ID,USING_DRIVER_ID) VALUES
('50B-292.20','Honda','Lead 125','Vàng',1,6,6),            #driver số 6 loại 1 (xe máy standard)
('59CHX-228.03','Honda','SH Mode 125','Xanh dương',1,7,7), #driver số 7 loại 2 (xe máy saver)
('56CNN-856.86','Honda','Civic','Trắng',6,8,8),            #driver số 8 loại 6 (xe oto 6 chỗ standard)
('54AWJ-295.1','Honda','Wave RSX','Đen',1,9,9),            #driver số 9 loại 1 (xe máy standard)
('53MGC-597.04','Honda','CBR300R','Đỏ',1,10,10);           #driver số 10 loại 1 (xe máy standard)

INSERT INTO VEHICLE_CATEGORIZATION
(VEHICLE_ID, MODE_ID) VALUES
(1,1),
(2,2),
(3,6),
(4,1),
(5,1);