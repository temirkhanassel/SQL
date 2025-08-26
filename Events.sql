CREATE TABLE Addresses ( 
	Address_ID int NOT NULL,
	City char(70),
	Street char(70),
	Email_Address char(70),
	Mobile_Cell_Number char(45),
	Home_Number char(45),
	Work_Number char(45)
)
;

ALTER TABLE Events ADD CONSTRAINT CK_Events_StarDate
DEFAULT GETDATE() FOR Event_Start_Date;
ALTER TABLE Events ADD CONSTRAINT CK_Events_EndDate
DEFAULT GETDATE() FOR Event_End_Date;

ALTER TABLE Contacts ADD CONSTRAINT UQ_Contacts_Contact_ID
UNIQUE(Contact_ID);

ALTER TABLE Addresses ADD CONSTRAINT CK_Email_Address
CHECK(Email_Address LIKE '%@%');

CREATE TABLE Booking_Status ( 
	booking_status_code int NOT NULL,
	booking_status_description char(140),
	CHECK (booking_status_description IN ('Conferences','Seminars','Internal Company Meetings','Trade Shows','Networking Events',
	'Ceremonies','Product Launches','VIP Events','Recruiting Events','Team Building','Field Marketing')))
;


CREATE TABLE Contacts ( 
	Address_ID int NOT NULL,
	Contact_ID int NOT NULL,
	Organizer_ID int NOT NULL,
	Contact_Name char(30),
	Telephone char(45),
	Web_Site_Address char(70)
)
;

CREATE TABLE Event_Status ( 
	Event_Status_Code int NOT NULL,
	Event_Status_Description char(140));

CREATE TABLE Event_Type ( 
	Event_Type_Code int NOT NULL,
	Event_Type_Description char(140)
)
;

CREATE TABLE Events ( 
	Event_ID int NOT NULL,
	Event_Status_Code int NOT NULL,
	Event_Type_Code int NOT NULL,
	Free_or_Commercial_Code int NOT NULL,
	Organizer_ID int NOT NULL,
	Venue_ID int NOT NULL,
	Event_Name char(30),
	Event_Start_Date datetime,
	Event_End_Date datetime,
	Number_of_Participants int,
	Derived_Days_Duration smallint,
	Discount int,
	Amount_Paid money,
	Potential_Cost money,
	Extra_Cost money,
	Comments char(140)
)
;

CREATE TABLE Free_or_Commercial ( 
	Free_or_Commercial_Code int NOT NULL,
	Description char(140)
)
;

CREATE TABLE Organizers ( 
	Organizer_ID int NOT NULL,
	Organizer_Name char(30),
	Email_Address char(70)
)
;

CREATE TABLE Rooms ( 
	Room_ID int NOT NULL,
	Room_Name char(30),
	Room_Capability int,
	Rate_for_Day char(70)
)
;

CREATE TABLE Space_Requests ( 
	booking_status_code int NOT NULL,
	Event_ID int NOT NULL,
	Room_ID int NOT NULL,
	Space_Request_ID int NOT NULL,
	Occupancy_YN int,
	Commercial_or_Free char(45),
	Occupancy_Date_From datetime,
	Occupancy_Date_To datetime
)
;

CREATE TABLE Venues ( 
	Venue_ID int NOT NULL,
	Venue_Name char(30)
)
;


ALTER TABLE Addresses ADD CONSTRAINT PK_Addresses 
	PRIMARY KEY (Address_ID)
;

ALTER TABLE Booking_Status ADD CONSTRAINT PK_Booking_Status 
	PRIMARY KEY (booking_status_code)
;

ALTER TABLE Contacts ADD CONSTRAINT PK_Contacts 
	PRIMARY KEY (Contact_ID)
;

ALTER TABLE Event_Status ADD CONSTRAINT PK_Event_Status 
	PRIMARY KEY (Event_Status_Code)
;

ALTER TABLE Event_Type ADD CONSTRAINT PK_Event_Type 
	PRIMARY KEY (Event_Type_Code)
;

ALTER TABLE Events ADD CONSTRAINT PK_Events 
	PRIMARY KEY (Event_ID);

ALTER TABLE Free_or_Commercial ADD CONSTRAINT PK_Free_or_Commercial 
	PRIMARY KEY (Free_or_Commercial_Code)
;

ALTER TABLE Organizers ADD CONSTRAINT PK_Organizers 
	PRIMARY KEY (Organizer_ID)
;

ALTER TABLE Rooms ADD CONSTRAINT PK_Rooms 
	PRIMARY KEY (Room_ID)
;

ALTER TABLE Space_Requests ADD CONSTRAINT PK_Space_Requests 
	PRIMARY KEY (Space_Request_ID)
;

ALTER TABLE Venues ADD CONSTRAINT PK_Venues 
	PRIMARY KEY (Venue_ID)
;




ALTER TABLE Contacts ADD CONSTRAINT FK_Contacts_Addresses 
	FOREIGN KEY (Address_ID) REFERENCES Addresses (Address_ID);

ALTER TABLE Contacts ADD CONSTRAINT FK_Contacts_Organizers 
	FOREIGN KEY (Organizer_ID) REFERENCES Organizers (Organizer_ID)
;

ALTER TABLE Events ADD CONSTRAINT FK_Events_Event_Status 
	FOREIGN KEY (Event_Status_Code) REFERENCES Event_Status (Event_Status_Code)
;

ALTER TABLE Events ADD CONSTRAINT FK_Events_Event_Type 
	FOREIGN KEY (Event_Type_Code) REFERENCES Event_Type (Event_Type_Code)
;

ALTER TABLE Events ADD CONSTRAINT FK_Events_Free_or_Commercial 
	FOREIGN KEY (Free_or_Commercial_Code) REFERENCES Free_or_Commercial (Free_or_Commercial_Code)
;

ALTER TABLE Events ADD CONSTRAINT FK_Events_Organizers 
	FOREIGN KEY (Organizer_ID) REFERENCES Organizers (Organizer_ID)
;

ALTER TABLE Events ADD CONSTRAINT FK_Events_Venues 
	FOREIGN KEY (Venue_ID) REFERENCES Venues (Venue_ID)
;

ALTER TABLE Space_Requests ADD CONSTRAINT FK_Space_Requests_Booking_Status 
	FOREIGN KEY (booking_status_code) REFERENCES Booking_Status (booking_status_code)
;

ALTER TABLE Space_Requests ADD CONSTRAINT FK_Space_Requests_Events 
	FOREIGN KEY (Event_ID) REFERENCES Events (Event_ID)
;

ALTER TABLE Space_Requests ADD CONSTRAINT FK_Space_Requests_Rooms 
	FOREIGN KEY (Room_ID) REFERENCES Rooms (Room_ID)
;

INSERT INTO Addresses VALUES(1, 'Almaty', 'Muratbaeva', 'homeS@gmail.com', '8 700 765 4334', '322-23', '564-87');
INSERT INTO Addresses VALUES(2, 'Almaty', 'Shevchenko', 'homeA@gmail.com', '8 771 734 4554', '452-13', '876-55');
INSERT INTO Addresses VALUES(3, 'Almaty', 'Kunaeva', 'homeak@gmail.com', '8 707 715 5634', '345-54', '436-57');
INSERT INTO Addresses VALUES(4, 'Almaty', 'Alfarabi', 'homeAfi@gmail.com', '8 366 676 6535', '364-35', '343-76');
INSERT INTO Addresses VALUES(5, 'Almaty', 'Gagarina', 'homeGGG@gmail.com', '8 433 436 3455', '452-52', '545-43');
INSERT INTO Addresses VALUES(6, 'Almaty', 'Rodostovca', 'homeR@gmail.com', '8 345 646 4565', '452-56', '563-65');
INSERT INTO Addresses VALUES(7, 'Astana', 'Pyshkina', 'homme@gmail.com', '8 535 563 563', '254-12', '476-67');
INSERT INTO Addresses VALUES(8, 'Astana', 'Imanova', 'hommI@gmail.com', '8 355 536 3653', '276-12', '467-36');
INSERT INTO Addresses VALUES(9, 'Astana', 'Zheltoksan', 'hommZH@gmail.com', '8 355 365 7676', '677-12', '467-467');
INSERT INTO Addresses VALUES(10, 'Astana', 'Respublica', 'hommeRe@gmail.com', '8 467 764 4677', '647-76', '764-52');
INSERT INTO Addresses VALUES(11, 'Astana', 'Mangilikel', 'hommeMe@gmail.com', '8 435 542 4654', '245-56', '544-24');
INSERT INTO Addresses VALUES(12, 'Kentay', 'Kalinina', 'hommeKa@gmail.com', '8 524 655 3563', '355-35', '356-56');
INSERT INTO Addresses VALUES(13, 'Kentay', 'Mametova', 'hommeMa@gmail.com', '8 355 353 6533', '565-35', '764-76');
INSERT INTO Addresses VALUES(14, 'Kentay', 'Momushuly', 'hommeMu@gmail.com', '8 433 434 5666', '565-76', '785-78');
INSERT INTO Addresses VALUES(15, 'Kentay', 'Temirkhan', 'hommeTA@gmail.com', '8 433 233 1244', '112-34', '54-63');
INSERT INTO Addresses VALUES(16, 'Kentay', 'Tolebi', 'hommetole@gmail.com', '8 246 266 6755', '343-34', '565-65');
INSERT INTO Addresses VALUES(17, 'Atyrau', 'Lenina', 'hommeL@gmail.com', '8 657 422 6533', '352-65', '765-87');
INSERT INTO Addresses VALUES(18, 'Atyrau', 'Dostyk', 'hommeD@gmail.com', '8 235 242 5463', '375-65', '657-36');
INSERT INTO Addresses VALUES(19, 'Atyrau', 'Raimbek', 'hommeRAIM@gmail.com', '8 465 644 3653', '673-76', '365-35');
INSERT INTO Addresses VALUES(20, 'Atyrau', 'Ryskulova', 'hommeRYS@gmail.com', '8 764 674 4673', '365-67', '335-67');
INSERT INTO Addresses VALUES(21, 'Atyrau', 'Tileusizdik', 'hommeTIL@gmail.com', '8 467 674 4673', '365-67', '764-64');

INSERT INTO Booking_Status VALUES(200, 'Access Required');
INSERT INTO Booking_Status VALUES(201, 'Approved');
INSERT INTO Booking_Status VALUES(202, 'Arrived');
INSERT INTO Booking_Status VALUES(203, 'Seated');
INSERT INTO Booking_Status VALUES(204, 'No-show');
INSERT INTO Booking_Status VALUES(205, 'Cancelled');
INSERT INTO Booking_Status VALUES(206, 'Declined');
INSERT INTO Booking_Status VALUES(207, 'Deleted');
INSERT INTO Booking_Status VALUES(208, 'Permit');


INSERT INTO Contacts VALUES(1, 31, 801, 'Assel', '8 700 765 4334', 'homeS@gmail.com');
INSERT INTO Contacts VALUES(2, 32, 802, 'Azhar', '8 771 734 4554', 'homeA@gmail.com');
INSERT INTO Contacts VALUES(3, 33, 803, 'Yenlik', '8 707 715 5634', 'homek@gmail.com');
INSERT INTO Contacts VALUES(4, 34, 804, 'Dastan', '8 366 676 6535', 'homeAfi@gmail.com');
INSERT INTO Contacts VALUES(5, 35, 805, 'Almatik', '8 433 436 3455', 'homeGGG@gmail.com');
INSERT INTO Contacts VALUES(6, 36, 806, 'Daniyar', '8 345 646 4565', 'homeR@gmail.com');
INSERT INTO Contacts VALUES(7, 37, 807, 'Ibragim', '8 535 563 563', 'homme@gmail.com');
INSERT INTO Contacts VALUES(8, 38, 808, 'Annel', '8 355 536 3653', 'hommI@gmail.com');
INSERT INTO Contacts VALUES(9, 39, 809, 'Emanuel', '8 355 365 7676', 'hommZH@gmail.com');
INSERT INTO Contacts VALUES(10, 40, 810, 'Madina', '8 467 764 4677', 'hommeRe@gmail.com');
INSERT INTO Contacts VALUES(11, 41, 811, 'Askar', '8 435 542 4654', 'hommeMe@gmail.com');
INSERT INTO Contacts VALUES(12, 42, 812, 'Denis', '8 524 655 3563', 'hommeKa@gmail.com');
INSERT INTO Contacts VALUES(13, 43, 813, 'Vlad', '8 355 353 6533', 'hommeMa@gmail.com');
INSERT INTO Contacts VALUES(14, 44, 814, 'Talgat', '8 433 434 5666', 'hommeMu@gmail.com');
INSERT INTO Contacts VALUES(15, 45, 815, 'Adel', '8 433 233 1244', 'hommeTA@gmail.com');
INSERT INTO Contacts VALUES(16, 46, 816, 'Aru', '8 246 266 6755', 'hommetole@gmail.com');
INSERT INTO Contacts VALUES(17, 47, 817, 'Edil', '8 657 422 6533', 'hommeL@gmail.com');
INSERT INTO Contacts VALUES(18, 48, 818, 'Zaur', '8 235 242 5463', 'hommeD@gmail.com');
INSERT INTO Contacts VALUES(19, 49, 819, 'Dauren', '8 465 644 3653', 'hommeRAIM@gmail.com');
INSERT INTO Contacts VALUES(20, 50, 820, 'Aset', '8 764 674 4673', 'hommeRYS@gmail.com');
INSERT INTO Contacts VALUES(21, 51, 802, 'Vanya', '8 467 674 4673', 'hommeTIL@gmail.com');

INSERT INTO Event_Status VALUES(301, 'Scheduled (The events Date Start is in the future');
INSERT INTO Event_Status VALUES(302, 'In Progress (The event has begun, but is not yet completed)');
INSERT INTO Event_Status VALUES(303, 'On-Hold (The event has been placed on hold before it began)');
INSERT INTO Event_Status VALUES(304, 'Stopped (The event began but was stopped before completion)');
INSERT INTO Event_Status VALUES(305, 'Canceled (The event has been cancelled)');
INSERT INTO Event_Status VALUES(306, 'Completed (The event has completed)');
INSERT INTO Event_Status VALUES(307, 'Completed and Verified (The event was completed and then its completion was verified)');
INSERT INTO Event_Status VALUES(308, 'Closed (The event has been closed)');

INSERT INTO Event_Type VALUES(401, 'Conferences');
INSERT INTO Event_Type VALUES(402, 'Seminars');
INSERT INTO Event_Type VALUES(403, 'Internal Company Meetings');
INSERT INTO Event_Type VALUES(404, 'Trade Shows');
INSERT INTO Event_Type VALUES(405, 'Networking Events');
INSERT INTO Event_Type VALUES(406, 'Ceremonies');
INSERT INTO Event_Type VALUES(407, 'Product Launches');
INSERT INTO Event_Type VALUES(408, 'VIP Events');
INSERT INTO Event_Type VALUES(409, 'Recruiting Events');
INSERT INTO Event_Type VALUES(410, 'Team Building');
INSERT INTO Event_Type VALUES(411, 'Field Marketing');

INSERT INTO Events VALUES(501, 301, 401, 708, 801, 1101, 'Anti- Pizza', '2022-01-10', '2022-01-12', 12, 2, 20, 1500.30, 1800.5, 300.80, 'NO');
INSERT INTO Events VALUES(502, 302, 402, 707, 802, 1102, 'United Marijuana', '2022-04-10', '2022-04-20', 10, 20, 10, 1500.2, 1650.5, 120.80, 'NO');
INSERT INTO Events VALUES(503, 303, 403, 706, 802, 1103, 'Libertarian Rage', '2022-03-21', '2022-05-12', 30, 21, 50, 780.5, 1760.5, 70.80, 'NO');
INSERT INTO Events VALUES(504, 303, 404, 718, 805, 1104, 'All Tomorrows', '2022-02-23', '2022-02-25', 3, 2, 20, 450.4, 600.9, 90.80, 'NO');
INSERT INTO Events VALUES(505, 303, 405, 705, 805, 1105, 'Put Families Last', '2022-01-15', '2022-01-18', 12, 3, 20, 4000.5, 4300.80, 520.0, 'NO');
INSERT INTO Events VALUES(506, 304, 406, 704, 803, 1107, 'Apathetic Libertarian','2022-05-14', '2022-05-16', 45, 2, 5, 300, 330.0, 0.00, 'NO');
INSERT INTO Events VALUES(507, 305, 407, 703, 801, 1106, 'Libertarian Loafer', '2022-05-09', '2022-05-09', 30, 1, 15, 450.12, 520.5, 0.00, 'NO');
INSERT INTO Events VALUES(508, 305, 408, 720, 801, 1109, 'Like its 1999', '2022-09-08', '2022-09-22', 6, 4, 0, 1500.30, 1500.30, 120.80, 'NO');
INSERT INTO Events VALUES(509, 305, 409, 702, 805, 1108, 'Manipulative Communist', '2022-08-15', '2022-08-17', 6, 2, 20, 1440.65, 1600.24, 89.00, 'NO');
INSERT INTO Events VALUES(510, 306, 410, 719, 808, 1110, 'National Equality', '2022-05-14', '2022-05-17', 12, 3, 20, 2300.78, 2500.5, 34.90, 'NO');
INSERT INTO Events VALUES(511, 307, 410, 720, 804, 1110, 'National Lunch Breaks', '2022-05-21', '2022-05-30', 55, 9, 30, 3500.35, 5000.5, 150.0, 'NO');
INSERT INTO Events VALUES(512, 307, 411, 709, 806, 1111, 'Modern Platinum', '2022-07-27', '2022-07-30', 32, 3, 25, 3375.42, 4500.56, 12.65, 'NO');
INSERT INTO Events VALUES(513, 307, 409, 701, 807, 1112, 'No Pizza', '2022-04-11', '2022-04-19', 11, 8, 15, 2225.445, 2500.5, 0.00, 'NO');
INSERT INTO Events VALUES(514, 307, 410, 702, 808, 1113, 'Modern Equality', '2022-06-03', '2022-06-17', 54, 14, 20, 5056.0, 6320.0, 15.56, 'NO');
INSERT INTO Events VALUES(515, 307, 410, 703, 809, 1114, 'Americans for Fun', '2022-03-22', '2022-03-26', 6, 4, 10, 1350.225, 1500.25, 87.5, 'NO');
INSERT INTO Events VALUES(516, 307, 410, 704, 810, 1115, 'Socialist Crusader', '2022-07-01', '2022-07-09', 50, 8, 35, 3607.5, 5550.0, 50.5, 'NO');
INSERT INTO Events VALUES(517, 307, 402, 705, 811, 1116, 'Apathetic Single Moms', '2022-05-15', '2022-05-19', 4, 4, 0, 250.0, 250.0, 15.25, 'NO');
INSERT INTO Events VALUES(518, 307, 403, 719, 812, 1117, 'Crazed Conservative', '2022-08-26', '2022-08-28', 23, 2, 10, 1404.0, 1560.0, 29.56, 'NO');
INSERT INTO Events VALUES(519, 307, 404, 706, 813, 1118, 'American Freedom', '2022-04-22', '2022-04-25', 3, 3, 0, 112.5, 112.5, 78.29, 'NO');
INSERT INTO Events VALUES(520, 307, 404, 707, 814, 1119, 'Surprise Party', '2022-05-29', '2022-05-29', 8, 1, 5, 570.475, 600.5, 12.45, 'NO');
INSERT INTO Events VALUES(521, 308, 403, 719, 815, 1120, 'Tax Grandma', '2022-09-06', '2022-09-17', 16, 9, 35, 3828.5, 5890.0, 256.23, 'NO');

INSERT INTO Venues VALUES (1101,'Alfred A.Ring Park');
INSERT INTO Venues VALUES (1102,'Bivens Arm Nature Park');
INSERT INTO Venues VALUES (1103,'Baughman Center');
INSERT INTO Venues VALUES (1104,'Clear Lake Nature Park');
INSERT INTO Venues VALUES (1105,'Cofrin Nature Park');
INSERT INTO Venues VALUES (1106,'The Fat Tuscan Cafe');
INSERT INTO Venues VALUES (1107,'Gainesville Garden Club');
INSERT INTO Venues VALUES (1108,'Gainesville Country Club');
INSERT INTO Venues VALUES (1109,'Heartwood Soundstage');
INSERT INTO Venues VALUES (1110,'Hippdrome State Theatre');
INSERT INTO Venues VALUES (1111,'Jolie Events');
INSERT INTO Venues VALUES (1112,'Kanapaha Botanical Garden');
INSERT INTO Venues VALUES (1113,'Ocala Jockey Club');
INSERT INTO Venues VALUES (1114,'Plantation Hall');
INSERT INTO Venues VALUES (1115,'Sweetwater Branch Inn');
INSERT INTO Venues VALUES (1116,'The Swamp Restaurant');
INSERT INTO Venues VALUES (1117,'Thomas Center');
INSERT INTO Venues VALUES (1118,'The Wooly');
INSERT INTO Venues VALUES (1119,'Heaven Hall');
INSERT INTO Venues VALUES (1120,'Blue Mark');

INSERT INTO Space_Requests VALUES(205,501,905,101,500,'Free','2021-10-14 08:00:00','2021-10-14 10:00:00');
INSERT INTO Space_Requests VALUES(205,519,912,102,40,'Commercial','2021-10-21 11:00:00','2021-10-21 13:00:00');
INSERT INTO Space_Requests VALUES(203,506,907,103,150,'Commercial','2021-10-28 16:00:00','2021-10-28 20:00:00');
INSERT INTO Space_Requests VALUES(207,514,901,104,500,'Free','2021-10-07 01:00:00','2021-10-07 06:00:00');
INSERT INTO Space_Requests VALUES(201,518,920,105,65,'Free','2021-11-11 09:00:00','2021-11-11 21:00:00');
INSERT INTO Space_Requests VALUES(202,512,918,106,50,'Commercial','2021-11-18 06:00:00','2021-11-18 08:00:00');
INSERT INTO Space_Requests VALUES(208,520,903,107,125,'Commercial','2021-12-14 10:00:00','2021-12-14 15:00:00');
INSERT INTO Space_Requests VALUES(204,511,917,108,200,'Commercial','2021-12-30 19:00:00','2021-12-30 22:00:00');
INSERT INTO Space_Requests VALUES(207,513,919,109,200,'Free','2022-01-17 04:00:00','2022-01-17 16:00:00');
INSERT INTO Space_Requests VALUES(202,517,908,110,115,'Commercial','2022-01-14 14:00:00','2022-01-14 16:00:00');
INSERT INTO Space_Requests VALUES(206,503,913,111,260,'Free','2022-01-20 12:00:00','2022-01-20 17:00:00');
INSERT INTO Space_Requests VALUES(203,509,909,112,300,'Commercial','2022-02-06 13:00:00','2022-02-06 15:00:00');
INSERT INTO Space_Requests VALUES(201,515,915,113,200,'Commercial','2022-02-11 08:00:00','2022-12-11 12:00:00');
INSERT INTO Space_Requests VALUES(208,510,911,114,35,'Free','2022-02-27 20:00:00','2022-02-28 00:00:00');
INSERT INTO Space_Requests VALUES(206,504,902,115,40,'Free','2022-03-08 19:00:00','2022-03-08 23:00:00');
INSERT INTO Space_Requests VALUES(204,516,906,116,70,'Free','2022-03-24 00:00:00','2022-03-24 10:00:00');
INSERT INTO Space_Requests VALUES(205,502,916,117,100,'Commercial','2022-03-26 11:00:00','2022-03-26 17:00:00');
INSERT INTO Space_Requests VALUES(203,505,910,118,55,'Free','2022-04-10 07:00:00','2022-04-10 18:00:00');
INSERT INTO Space_Requests VALUES(205,508,904,119,115,'Commercial','2022-04-13 09:00:00','2022-04-13 13:00:00');
INSERT INTO Space_Requests VALUES(207,507,914,120,50,'Free','2022-04-29 16:00:00','2022-04-29 20:00:00');

INSERT INTO Rooms VALUES(901,'Pop In',510,'Standard(hourly)');
INSERT INTO Rooms VALUES(902,'Cranium Focus',46,'VIP(sentry)');
INSERT INTO Rooms VALUES(903,'Creative Arena',130,'VIP(sentry)');
INSERT INTO Rooms VALUES(904,'Bromance Chamber',120,'Unlimited (from 6 hours)');
INSERT INTO Rooms VALUES(905,'Magma',500,'Unlimited (from 6 hours)');
INSERT INTO Rooms VALUES(906,'Bay Area',100,'Standard(hourly)');
INSERT INTO Rooms VALUES(907,'Colective IQ',150,'VIP(sentry)');
INSERT INTO Rooms VALUES(908,'Dakota Room',125,'Premium');
INSERT INTO Rooms VALUES(909,'Peach',300,'Unlimited (from 6 hours)');
INSERT INTO Rooms VALUES(910,'Kerouac',60,'Premium');
INSERT INTO Rooms VALUES(911,'The Meet&Greet',50,'Standard(hourly)');
INSERT INTO Rooms VALUES(912,'Link',40,'VIP(sentry)');
INSERT INTO Rooms VALUES(913,'Seekers',275,'Unlimited (from 6 hours)');
INSERT INTO Rooms VALUES(914,'Inovation',66,'Standard(hourly)');
INSERT INTO Rooms VALUES(915,'Vaudeville',210,'Premium');
INSERT INTO Rooms VALUES(916,'Jammin',100,'VIP(sentry)');
INSERT INTO Rooms VALUES(917,'Dream Makers',220,'Unlimited (from 6 hours)');
INSERT INTO Rooms VALUES(918,'Giant',90,'Standard(hourly)');
INSERT INTO Rooms VALUES(919,'Bluebird',250,'Unlimited (from 6 hours)');
INSERT INTO Rooms VALUES(920,'Ostrich',80,'Premium');

INSERT INTO Organizers VALUES(801,'David Hodgson','davhod@outlook.com');
INSERT INTO Organizers VALUES(802,'Jon Morris','jonmor@mail.com');
INSERT INTO Organizers VALUES(803,'Adams Jay','adamsjay@gmail.com');
INSERT INTO Organizers VALUES(804,'David Johnson','david@gmail.com');
INSERT INTO Organizers VALUES(805,'Mark Harui','mha@outlook.com');
INSERT INTO Organizers VALUES(806,'Derik Stenerson','derikst@yahoo.com');
INSERT INTO Organizers VALUES(807,'Sharon Hoepf','shahoe@mail.com');
INSERT INTO Organizers VALUES(808,'Garret Young','garryo@yahoo.com');
INSERT INTO Organizers VALUES(809,'Julie Bankert','jul@outlook.com');
INSERT INTO Organizers VALUES(810,'Nicole Smith','nicoles@mail.com');
INSERT INTO Organizers VALUES(811,'Willis Johnson','wjohn@yahoo.com');
INSERT INTO Organizers VALUES(812,'Annette Hill','anhill@gmail.com');
INSERT INTO Organizers VALUES(813,'Elsa Leavitt','eleavitt@outlook.com');
INSERT INTO Organizers VALUES(814,'Samanta Smith','sasmi@outlook.com');
INSERT INTO Organizers VALUES(815,'Spencer Low','spelo@gmail.com');
INSERT INTO Organizers VALUES(816,'Anthony Chor','anthoch@yahoo.com');
INSERT INTO Organizers VALUES(817,'Robert Zare','robezare@mail.com');
INSERT INTO Organizers VALUES(818,'Eric Parkison','erpar@outlook.com');
INSERT INTO Organizers VALUES(819,'Ryan Calafato','ryacalafat@yahoo.com');
INSERT INTO Organizers VALUES(820,'Margie Shoop','margshoop@gmail.com');

INSERT INTO Free_or_Commercial VALUES(701,'C,Field Marketung');
INSERT INTO Free_or_Commercial VALUES(702,'C,Recruting Events');
INSERT INTO Free_or_Commercial VALUES(703,'C,Product Launcher');
INSERT INTO Free_or_Commercial VALUES(704,'C,Cereminies');
INSERT INTO Free_or_Commercial VALUES(705,'C,Networking Events');
INSERT INTO Free_or_Commercial VALUES(706,'C,Internal Company Meeting');
INSERT INTO Free_or_Commercial VALUES(707,'C,Seminars');
INSERT INTO Free_or_Commercial VALUES(708,'C,Conferences');
INSERT INTO Free_or_Commercial VALUES(709,'C,Polished Events');
INSERT INTO Free_or_Commercial VALUES(710,'C,Mosaic Event');
INSERT INTO Free_or_Commercial VALUES(711,'F,Dance Party');
INSERT INTO Free_or_Commercial VALUES(712,'F,Cinephilies Movie Day');
INSERT INTO Free_or_Commercial VALUES(713,'F,Photographers Day');
INSERT INTO Free_or_Commercial VALUES(714,'F,8 March');
INSERT INTO Free_or_Commercial VALUES(715,'F,Game day');
INSERT INTO Free_or_Commercial VALUES(716,'F,Cat Lovers');
INSERT INTO Free_or_Commercial VALUES(717,'F,Birth day');
INSERT INTO Free_or_Commercial VALUES(718,'F,Trade Show');
INSERT INTO Free_or_Commercial VALUES(719,'F,Team Building');
INSERT INTO Free_or_Commercial VALUES(720,'F,VIP Events');

--SELECT
--1. Display the first and last date of the event for each tariff with their count and sum of amount  where the payment for the event exceeds 700 dollars
SELECT R.Rate_for_Day,
 count(*) as count,
 min(SR.Occupancy_Date_From) as first_date_from,
 max(SR.Occupancy_Date_To) as end_date_to,
 sum(E.Amount_Paid) as sum_amount
FROM Rooms R JOIN Space_Requests SR ON R.Room_ID=SR.Room_ID
JOIN Events E ON SR.Event_ID=E.Event_ID
where E.Amount_Paid>700.0
GROUP BY R.Rate_for_Day 
ORDER BY first_date_from


--2. Find past events in ascending order when the occupancy of a place request was less than 500 
SELECT DISTINCT SR.Event_ID,E.Event_Name,E.Event_Start_Date,E.Event_End_Date,E.Number_of_Participants,E.Derived_Days_Duration,E.Amount_Paid,SR.Commercial_or_Free FROM Events E,Space_Requests SR WHERE 
SR.Event_ID IN(SELECT Event_ID FROM Space_Requests
GROUP BY Event_ID HAVING COUNT(Space_Requests.Occupancy_YN)<500) AND
E.Event_End_Date<'2022-04-19 00:00:00' AND 
E.Event_ID=SR.Event_ID
ORDER BY Event_ID;


--3. Print the name of the client indicating his city and organizer, where the potential cost exceeds the extra costs, sorted in descending order of the potential cost
SELECT A.City,C.Contact_Name,O.Organizer_Name, E.Potential_Cost FROM Addresses A
 JOIN Contacts C ON A.Address_ID=C.Address_ID
 JOIN Organizers O ON C.Organizer_ID=O.Organizer_ID
 JOIN Events E ON O.Organizer_ID=E.Organizer_ID 
WHERE Potential_Cost>(SELECT SUM(Extra_Cost)FROM Events)
ORDER BY Potential_Cost DESC

--4. Display in one table the average amount paid by booking code and individual values of the amount paid of events grouped by booking code where booking status starts with d
SELECT Event_Name,BS.booking_status_code,Amount_Paid FROM Events E
 JOIN Space_Requests SR ON E.Event_ID=SR.Event_ID
 JOIN Booking_Status BS ON SR.booking_status_code=BS.booking_status_code
 WHERE booking_status_description LIKE 'D%'
  UNION
 (SELECT 'Z-AVG' AS Event_Name,BS.booking_status_code,AVG(Amount_Paid) AS Amount_Paid FROM Events E
 JOIN Space_Requests SR ON E.Event_ID=SR.Event_ID
 JOIN Booking_Status BS ON SR.booking_status_code=BS.booking_status_code
 WHERE booking_status_description LIKE 'D%'
 GROUP BY BS.booking_status_code)
  ORDER BY BS.booking_status_code,Event_Name

	
--UPDATE
--1. Increase by 30% the potential cost and amount paid for events where the name contains American
UPDATE Events
SET Potential_Cost=1.3*Potential_Cost,Amount_Paid=1.3*Amount_Paid
WHERE Event_Name LIKE '%American%'

--2. Change the occupancy  for an event with ID 520 or with a occupancy date from January 20 at 12 p.m.
UPDATE Space_Requests
SET Occupancy_YN=130
WHERE Event_ID=520
OR Occupancy_Date_From = '2022-01-20 12:00:00'

--3. Update the contact name from id 44 to Asset and number to 8 701 469 58 89
UPDATE Contacts
SET Contact_Name='Asset', Telephone='8 701 469 58 89'
WHERE Contact_ID=44

--4. Update from address mobile number to contact telephones for all addresses with an ID less than 7
UPDATE Addresses 
SET Mobile_Cell_Number = C.Telephone
FROM Addresses A
INNER JOIN Contacts C
ON (A.Email_Address = C.Web_Site_Address)
WHERE A.Address_ID <7 ;


--DELETE
--1. Remove a description from a free or commercial table that has a Day
DELETE FROM Free_or_Commercial
WHERE Description LIKE '%Day%'

--2. Delete customers whoms name's leght is 5 letters and starts from A
DELETE FROM Contacts
WHERE len(Contact_Name) = 5
AND Contact_Name LIKE 'A%'

--3. Remove from Venues where Venue name include word Park
DELETE FROM Venues
WHERE Venue_Name LIKE '%Park'

SELECT * FROM Venues

--4. Remove Events which price is low than average cost of full events
DELETE FROM Events
WHERE Amount_Paid < (SELECT AVG(Amount_Paid) FROM Events)


--VIEW
--1. Event, start and end date of the event, number of participants more than 20, event status, venue name, discount on the event
CREATE VIEW Eventdetails
AS
SELECT  dbo.Events.Event_Name,
		dbo.Events.Event_Start_Date,
		dbo.Events.Event_End_Date,
		dbo.Events.Number_of_Participants,
		dbo.Event_Status.Event_Status_Description,
		dbo.Venues.Venue_Name,
		((dbo.Events.Potential_Cost*dbo.Events.Discount)/100) as Discount_Cost
			
FROM    dbo.Event_Status INNER JOIN
	    dbo.Events ON dbo.Event_Status.Event_Status_Code = dbo.Events.Event_Status_Code INNER JOIN
		dbo.Venues ON dbo.Events.Venue_ID = dbo.Venues.Venue_ID 

WHERE dbo.Events.Number_of_Participants > 20

GROUP BY dbo.Events.Event_Name,
		dbo.Events.Event_Start_Date,
		dbo.Events.Event_End_Date,
		dbo.Events.Number_of_Participants,
		dbo.Event_Status.Event_Status_Description,
		dbo.Venues.Venue_Name,
		((dbo.Events.Potential_Cost*dbo.Events.Discount)/100) 
		
/*Execution*/
SELECT * FROM Eventdetails


--2. Booking status and its count, average occupancy and sum number of participants for each status, where the duration of the event days is more than a week
CREATE VIEW Booking
AS
SELECT BS.booking_status_description,count(*) AS count, AVG(SR.Occupancy_YN) AS avg_occupancy,SUM(E.Number_of_Participants) as sum_num_of_participant from Booking_Status BS 
INNER JOIN Space_Requests SR ON BS.booking_status_code = SR.booking_status_code
INNER JOIN Events E ON SR.Event_ID = E.Event_ID
WHERE E.Derived_Days_Duration >7
GROUP BY BS.booking_status_description

/*Execution*/
SELECT * FROM Booking


--3. Declined booking status where Organizer is Jon Morris
CREATE VIEW DeclinedStatus_details 
AS
SELECT Contact_Name, Telephone, City,booking_status_description, Organizers.Organizer_ID, Organizer_Name 
	
FROM Contacts
JOIN Addresses ON Contacts.Address_ID = Addresses.Address_ID
JOIN Booking_Status ON Booking_Status.booking_status_description = Booking_Status.booking_status_description
JOIN Organizers ON Contacts.Organizer_ID = Organizers.Organizer_ID
	
WHERE booking_status_description = 'Declined' AND Organizers.Organizer_ID = 802

/*Execution*/
SELECT * FROM DeclinedStatus_details


--4. Event's price is above the average price, and has status Complited
CREATE VIEW EventsAboveaveragePrice 
AS
SELECT Event_Name, Amount_Paid, Event_Status_Description,Event_Type_Description FROM Events
JOIN Event_Type ON Events.Event_Type_Code = Event_Type.Event_Type_Code
JOIN Event_Status ON Events.Event_Status_Code = Event_Status.Event_Status_Code
WHERE Amount_Paid > (SELECT AVG(Amount_Paid) FROM Events) AND Event_Status_Description LIKE '%Completed%'

/*Execution*/
SELECT * FROM EventsAboveaveragePrice

--5. Find amont of duration where cost is more than 1550
CREATE VIEW AmountOfDuration 
AS
SELECT Event_Name, Amount_Paid, DATEDIFF(DAY, Event_Start_Date, Event_End_Date) as kunder 
FROM Events
WHERE Amount_Paid > 1550

/*Execution*/
SELECT * FROM AmountOfDuration
