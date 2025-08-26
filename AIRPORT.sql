
set DATEFORMAT ymd
--Table Create
--FLIGHT
CREATE TABLE FLIGHT(
flight_id SMALLINT NOT NULL,
flight_no CHAR(10) NOT NULL,
scheduled_departure DATETIME  NULL,
scheduled_arrival DATETIME NULL,
departure_airport CHAR(30) ,
arrival_airport CHAR(30) ,
statuss VARCHAR(30) NOT NULL,
aircraft_code CHAR(10),
actual_departure DATETIME,
actual_arrival DATETIME,
--Indexes:
PRIMARY KEY(flight_id),
CONSTRAINT flights UNIQUE (flight_no, scheduled_departure),
--Check constraints:
CHECK (scheduled_arrival > scheduled_departure),
CHECK ((actual_arrival IS NULL)
 OR ((actual_departure IS NOT NULL AND actual_arrival IS NOT NULL)
 AND (actual_arrival > actual_departure))),
CHECK (statuss IN ('On Time', 'Delayed', 'Departed','Arrived', 'Scheduled', 'Cancelled')),
);


--AIRCRAFT
CREATE TABLE AIRCRAFT(
aircraft_code CHAR(10) NOT NULL,
model VARCHAR(30) NOT NULL,
ranges NUMERIC(10,0) NOT NULL,
--Indexes:
PRIMARY KEY(aircraft_code),
--Check constraints:
CHECK (ranges>0));



--AIRPORT
CREATE TABLE AIRPORT(
airport_code CHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
airport_name VARCHAR(100) NOT NULL,
--Indexes:
PRIMARY KEY(airport_code));



--SEATS
CREATE TABLE SEATS(
aircraft_code CHAR(10) NOT NULL,
seat_no VARCHAR(4) NOT NULL,
fare_conditions VARCHAR(10) NOT NULL,
--Indexes:
PRIMARY KEY(seat_no,aircraft_code),
--Check constraints:
CHECK (fare_conditions IN ('Economy', 'Comfort', 'Business')));



--BOOKINGS
CREATE TABLE BOOKINGS(
book_ref CHAR(10) NOT NULL,
book_date DATETIME NULL,
total_amount NUMERIC(10,2) NOT NULL,
--Indexes:
PRIMARY KEY(book_ref));



--TICKETS
CREATE TABLE TICKETS(
ticket_no CHAR(13) NOT NULL,
book_ref CHAR(10) NOT NULL,
passenger_name VARCHAR(200) NOT NULL,
email VARCHAR(50) NOT NULL,
phone VARCHAR(15) NOT NULL,
--Indexes:
PRIMARY KEY (ticket_no));



--TICKET_FLIGHTS
CREATE TABLE TICKET_FLIGHTS(
ticket_no CHAR(13) NOT NULL,
flight_id SMALLINT NOT NULL,
fare_conditions VARCHAR(10) NOT NULL,
amount NUMERIC(10,2) NOT NULL,
--Indexes:
PRIMARY KEY(ticket_no,flight_id),
--Check constraints:
CHECK (amount >= 0),
CHECK (fare_conditions IN ('Economy', 'Comfort', 'Business')));



--BOARDING_PASSES
CREATE TABLE BOARDING_PASSES(
ticket_no CHAR(13) NOT NULL,
flight_id SMALLINT NOT NULL,
boarding_no NUMERIC(10,0) NOT NULL,
seat_no VARCHAR(4) NOT NULL,
--Indexes:
PRIMARY KEY(ticket_no, flight_id),
CONSTRAINT boarding_passes1 UNIQUE (flight_id,boarding_no),
CONSTRAINT boarding_passes2 UNIQUE (flight_id, seat_no));



--FOREIGN KEY
ALTER TABLE FLIGHT ADD 
	FOREIGN KEY (aircraft_code) 
	REFERENCES AIRCRAFT (aircraft_code),
	FOREIGN KEY (departure_airport) 
	REFERENCES AIRPORT (airport_code),
	FOREIGN KEY (arrival_airport) 
	REFERENCES AIRPORT (airport_code)

ALTER TABLE SEATS ADD 
	FOREIGN KEY (aircraft_code) 
	REFERENCES AIRCRAFT (aircraft_code)

ALTER TABLE BOARDING_PASSES ADD 
	FOREIGN KEY (ticket_no,flight_id) 
    REFERENCES TICKET_FLIGHTS(ticket_no,flight_id)


ALTER TABLE TICKETS ADD 
	FOREIGN KEY (book_ref) 
	REFERENCES BOOKINGS (book_ref)

ALTER TABLE TICKET_FLIGHTS ADD 
	FOREIGN KEY (flight_id) 
	REFERENCES FLIGHT (flight_id),
	FOREIGN KEY (ticket_no) 
	REFERENCES TICKETS (ticket_no)



--INSERT
INSERT INTO AIRCRAFT VALUES('773','Boeing 777-300',11100);
INSERT INTO AIRCRAFT VALUES('763','Boeing 767-300',7900);
INSERT INTO AIRCRAFT VALUES('SU9','Sukhoi SuperJet-100',3000);
INSERT INTO AIRCRAFT VALUES('320','Airbus A320-200',5700);
INSERT INTO AIRCRAFT VALUES('321','Airbus A321-200',5600);
INSERT INTO AIRCRAFT VALUES('319','Airbus A319-100',6700);
INSERT INTO AIRCRAFT VALUES('733','Boeing 737-300',4200);
INSERT INTO AIRCRAFT VALUES('CN1','Cessna 208 Caravan',1200);
INSERT INTO AIRCRAFT VALUES('CR2','Bombardier CRJ-200',2700);
INSERT INTO AIRCRAFT VALUES('DC9','McDonnel Douglas Jet',8800);



INSERT INTO AIRPORT VALUES('AMS','Amsterdam','Schiphol Airport'); 
INSERT INTO AIRPORT VALUES('BFS','Belfast','Belfast International Airport'); 
INSERT INTO AIRPORT VALUES('BHX','Birmingham','Birmingham Airport'); 
INSERT INTO AIRPORT VALUES('BRU','Brussels','Brussels Airports');
INSERT INTO AIRPORT VALUES('EMA','East Midlands','East Midlands Airport');
INSERT INTO AIRPORT VALUES('DUB','Dublin','Dublin Airport');
INSERT INTO AIRPORT VALUES('EDI','Edinburgh','Edinburgh Airport'); 
INSERT INTO AIRPORT VALUES('GLA','Glasgow','Glasgow International Airport');
INSERT INTO AIRPORT VALUES('LHR','Heathrow Island','London Heathrow Airport');
INSERT INTO AIRPORT VALUES('LBA','Yeadon','Leeds Bradford Airport');
INSERT INTO AIRPORT VALUES('LPL','Liverpool','Liverpool John Lennon Airport');
INSERT INTO AIRPORT VALUES('CDG','Paris','Paris Charles de Gaulle Airport');
INSERT INTO AIRPORT VALUES('MME','Teeside','Teesside International Airport');
INSERT INTO AIRPORT VALUES('SVO','Moscow','Sheremetyevo International Airport');
INSERT INTO AIRPORT VALUES('NUX','Novy Urengoy','Novy Urengoy Airport');
INSERT INTO AIRPORT VALUES('NFG','Nefteyugansk','Nefteyugansk Airport');
INSERT INTO AIRPORT VALUES('DME','Moscow','Domodedovo Airport');
INSERT INTO AIRPORT VALUES('VKO','Moscow','Vnokovo Airport');
INSERT INTO AIRPORT VALUES('EGPH','Edinburgh','Edinburghs Airport');


INSERT INTO TICKET_FLIGHTS VALUES('0005435212351',30625,'Business',37900.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005435212393',30625,'Comfort',26570.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005435212389',30625,'Economy',18100.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433367228',24836,'Business',131800.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433367234',24836,'Economy',23600.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005434979277',2055,'Comfort',101500.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005434979258',2055,'Economy',89600.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005434952464',2575,'Economy',65000.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433256381',28205,'Comfort',73300.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433111467',19732,'Comfort',109500.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433111469',19732,'Business',136200.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005434190368',19092,'Business',140100.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433538719',6786,'Economy',6000.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433538724',6786,'Comfort',12000.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005435259678',25029,'Business',139600.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005433511802',823,'Economy',26700.00);
INSERT INTO TICKET_FLIGHTS VALUES('0005432922454',16157,'Economy',8500.00);



INSERT INTO BOARDING_PASSES VALUES('0005435212351',30625,1,'2D');
INSERT INTO BOARDING_PASSES VALUES('0005435212393',30625,12,'11H');
INSERT INTO BOARDING_PASSES VALUES('0005435212389',30625,31,'40J');
INSERT INTO BOARDING_PASSES VALUES('0005433367228',24836,6,'3F');
INSERT INTO BOARDING_PASSES VALUES('0005433367234',24836,40,'19D');
INSERT INTO BOARDING_PASSES VALUES('0005434979277',2055,3,'2B');
INSERT INTO BOARDING_PASSES VALUES('0005434979258',2055,19,'18C');
INSERT INTO BOARDING_PASSES VALUES('0005434952464',2575,2,'4A');
INSERT INTO BOARDING_PASSES VALUES('0005433256381',28205,26,'5F');
INSERT INTO BOARDING_PASSES VALUES('0005433111467',19732,34,'23B');
INSERT INTO BOARDING_PASSES VALUES('0005433111469',19732,15,'10J');
INSERT INTO BOARDING_PASSES VALUES('0005434190368',19092,7,'19E');
INSERT INTO BOARDING_PASSES VALUES('0005433538719',6786,38,'6A');
INSERT INTO BOARDING_PASSES VALUES('0005433538724',6786,12,'23D');
INSERT INTO BOARDING_PASSES VALUES('0005435259678',25029,3,'4C');
INSERT INTO BOARDING_PASSES VALUES('0005433511802',823,9,'21J');
INSERT INTO BOARDING_PASSES VALUES('0005432922454',16157,1,'1C');



INSERT INTO BOOKINGS VALUES('000012','2021-06-14 09:02:00',37900.00);
INSERT INTO BOOKINGS VALUES('00000F','2021-07-05 03:12:00',26570.00);
INSERT INTO BOOKINGS VALUES('000068','2021-06-15 14:27:00',18100.00);
INSERT INTO BOOKINGS VALUES('000181','2021-08-10 13:28:00',131800.00);
INSERT INTO BOOKINGS VALUES('0002D8','2021-08-07 21:40:00',23600.00);
INSERT INTO BOOKINGS VALUES('0002DB','2021-06-29 06:30:00',101500.00);
INSERT INTO BOOKINGS VALUES('0002E0','2021-07-11 16:09:00',89600.00);
INSERT INTO BOOKINGS VALUES('0002F3','2021-07-10 05:31:00',65000.00);
INSERT INTO BOOKINGS VALUES('00034E','2021-08-04 16:52:00',73300.00);
INSERT INTO BOOKINGS VALUES('000352','2021-07-06 02:02:00',109500.00);
INSERT INTO BOOKINGS VALUES('000374','2021-08-12 10:13:00',136200.00);
INSERT INTO BOOKINGS VALUES('00044E','2021-06-17 05:39:00',140100.00);
INSERT INTO BOOKINGS VALUES('00044D','2021-05-30 00:24:00',6000.00);
INSERT INTO BOOKINGS VALUES('0004B0','2021-04-28 09:00:00',12000.00);
INSERT INTO BOOKINGS VALUES('0004E1','2021-05-31 17:34:00',139600.00);
INSERT INTO BOOKINGS VALUES('000511','2021-07-01 03:40:00',26700.00);
INSERT INTO BOOKINGS VALUES('00053F','2021-08-06 03:15:00',8500.00);



INSERT INTO FLIGHT VALUES(30625,'PG0134','2021-09-10 09:50:00','2021-09-10 14:55:00','AMS','NFG','On Time','DC9','2021-09-10 09:50:00','2021-09-10 14:55:00');
INSERT INTO FLIGHT VALUES(24836,'PG0052','2021-08-25 14:50:00','2021-08-25 17:35:00','BFS','NUX','Arrived','773','2021-08-25 16:50:00','2021-08-25 19:35:00');
INSERT INTO FLIGHT VALUES(2055,'PG0561','2021-09-05 12:30:00','2021-09-05 14:15:00','BHX','SVO','Delayed','CR2','2021-09-05 12:30:00','2021-09-05 14:15:00');
INSERT INTO FLIGHT VALUES(2575,'PG0529','2021-09-12 09:50:00','2021-09-12 11:20:00','BRU','MME','Cancelled','763','2021-09-12 09:50:00','2021-09-12 11:20:00');
INSERT INTO FLIGHT VALUES(28205,'PG0461','2021-09-04 12:25:00','2021-09-04 13:20:00','EMA','CDG','Departed','CN1','2021-09-04 12:25:00','2021-09-04 13:20:00');
INSERT INTO FLIGHT VALUES(19732,'PG0667','2021-09-10 15:00:00','2021-09-10 17:30:00','DUB','LPL','Departed','SU9','2021-09-10 15:00:00','2021-09-10 17:30:00');
INSERT INTO FLIGHT VALUES(19092,'PG0360','2021-08-28 09:00:00','2021-08-28 11:35:00','EDI','LBA','Scheduled','733','2021-08-28 09:00:00','2021-08-28 11:35:00');
INSERT INTO FLIGHT VALUES(6786,'PG0569','2021-08-24 15:05:00','2021-08-24 16:10:00','GLA','LHR','Arrived','320','2021-08-24 18:05:00','2021-08-24 19:10:00');
INSERT INTO FLIGHT VALUES(25029,'PG0498','2021-09-12 10:15:00','2021-09-12 14:55:00','EDI','BHX','On Time','319','2021-09-12 10:15:00','2021-09-12 14:55:00');
INSERT INTO FLIGHT VALUES(823,'PG0621','2021-08-26 16:05:00','2021-08-26 17:00:00','SVO','BFS','Cancelled','321','2021-08-26 16:05:00','2021-08-26 17:00:00');
INSERT INTO FLIGHT VALUES(16157,'PG0612','2021-08-18 16:25:00','2021-08-18 20:05:00','LPL','AMS','Delayed','CR2','2021-08-18 16:25:00','2021-08-18 20:05:00');



INSERT INTO SEATS VALUES('DC9','2D','Business');
INSERT INTO SEATS VALUES('DC9','11H','Comfort');
INSERT INTO SEATS VALUES('DC9','40J','Economy');
INSERT INTO SEATS VALUES('773','3F','Business');
INSERT INTO SEATS VALUES('773','19D','Economy');
INSERT INTO SEATS VALUES('CR2','2B','Comfort');
INSERT INTO SEATS VALUES('CR2','18C','Economy');
INSERT INTO SEATS VALUES('763','4A','Economy');
INSERT INTO SEATS VALUES('CN1','5F','Comfort');
INSERT INTO SEATS VALUES('SU9','23B','Comfort');
INSERT INTO SEATS VALUES('SU9','10J','Business');
INSERT INTO SEATS VALUES('733','19E','Business');
INSERT INTO SEATS VALUES('320','6A','Economy');
INSERT INTO SEATS VALUES('320','23D','Comfort');
INSERT INTO SEATS VALUES('319','4C','Business');
INSERT INTO SEATS VALUES('321','21J','Economy');
INSERT INTO SEATS VALUES('CR2','1C','Economy');



INSERT INTO TICKETS VALUES('0005435212351','000012','IVANOV DMITRIY','dmitriy.ivanov@gmail.com',70127117011);
INSERT INTO TICKETS VALUES('0005435212393','00000F','SMIRNOVA ELENA','elena.smirnova@outlook.com',70378089255);
INSERT INTO TICKETS VALUES('0005435212389','000068','PETROVA ANASTASIA','anastasia.petrova@mail.ru',70760429203);
INSERT INTO TICKETS VALUES('0005433367228','000181','KOLESNIKOV ARTEM','artem.kolesnikov@gmail.com',70791452932);
INSERT INTO TICKETS VALUES('0005433367234','0002D8','NIKITINA OLGA','olga.nikitina@outlook.com',70639918455);
INSERT INTO TICKETS VALUES('0005434979277','0002DB','SOKOLOVA VIKTORIYA','viktoriya.sokolova@mail.ru',70568350272);
INSERT INTO TICKETS VALUES('0005434979258','0002E0','FEDOROV PAVEL','pavel.fedorov@gmail.com',70322899756);
INSERT INTO TICKETS VALUES('0005434952464','0002F3','KUZNETSOV MAKSIM','maksim.kuznetsov@outlook.com',70212106431);
INSERT INTO TICKETS VALUES('0005433256381','00034E','MOROZOV KIRILL','kirill.morozov@mail.ru',70806484401);
INSERT INTO TICKETS VALUES('0005433111467','000352','EFIMOVA KSENIYA','kseniya.efimova@gmail.com',70038510644);
INSERT INTO TICKETS VALUES('0005433111469','000374','GRIGORIEV VLADISLAV','vladislav.grigoriev@outlook.com',70620336121);
INSERT INTO TICKETS VALUES('0005434190368','00044E','SAVCHENKO SERGEY','sergey.savchenko@mail.ru',70518693810);
INSERT INTO TICKETS VALUES('0005433538719','00044D','POPOV ANDREY','andrey.popov@gmail.com',70450902749);
INSERT INTO TICKETS VALUES('0005433538724','0004B0','IVANOVA MARINA','marina.ivanova@outlook.com',70235326894);
INSERT INTO TICKETS VALUES('0005435259678','0004E1','ZHUKOVA NATALYA','natalya.zhukova@gmail.com',70834193348);
INSERT INTO TICKETS VALUES('0005433511802','000511','ORLOVA YULIYA','yuliya.orlova@mail.ru',70030408217);
INSERT INTO TICKETS VALUES('0005432922454','00053F','ALEKSEEV ROMAN','roman.alekseev@outlook.com',70386792287);



--SELECT
--вывести места и тарифы для моделей самолетов Boeing
SELECT A.aircraft_code,
 a.model,
 S.seat_no,
 S.fare_conditions FROM AIRCRAFT A JOIN SEATS S ON A.aircraft_code = S.aircraft_code
WHERE A.model LIKE 'Boeing%'
ORDER BY S.seat_no

--вывести мин мах даты полета и сумму билетов для каждого статуса с их количесвом где билет должен быть больше 50 000
SELECT F.statuss,
 count(*) as count,
 min(F.scheduled_departure) as min_scheduled_departure,
 max(F.scheduled_departure) as max_scheduled_departure,
 sum(TF.amount) as sum_amount
FROM FLIGHT F JOIN TICKET_FLIGHTS TF ON F.flight_id=TF.flight_id
where TF.amount>=50000.00
GROUP BY F.statuss 
ORDER BY min_scheduled_departure

--вывести все данные аэропорта где есть несколько аэропортов в одном городе
SELECT   a.airport_code as code,
         a.airport_name,
         a.city FROM AIRPORT a
WHERE    a.city IN (
            SELECT   aa.city
            FROM     AIRPORT aa
            GROUP BY aa.city
            HAVING   COUNT(*) > 1)
ORDER BY a.city, a.airport_code;

--получить  список перелетов которые дороже всех перелетов по билету 0005435212351
SELECT TF.ticket_no, TF.flight_id, TF.amount FROM TICKET_FLIGHTS TF
JOIN FLIGHT F ON TF.flight_id=F.flight_id
WHERE  TF.ticket_no <> '0005435212351'
AND TF.amount > ALL(SELECT TTF.amount FROM TICKET_FLIGHTS TTF
WHERE TTF.ticket_no='0005435212351')



--UPDATE
--увеличить на 20% дальность полета самолетов Boeing
UPDATE AIRCRAFT
SET ranges=1.2*ranges
WHERE model like 'Boeing%'

--изменить место на 1F бизнес класса самолетам 733 и 321
UPDATE SEATS
SET seat_no='1F'
WHERE aircraft_code IN('733','321')
AND fare_conditions='Business'

--изменить модели самолета где дальнесть полета между 5000 и 7000
UPDATE AIRCRAFT
SET model='Boeing 767-300'
WHERE ranges BETWEEN 5000 AND 7000

--уменьшить на 50% стоимость бронирования на 50% для тех что содержит F в бронировании
UPDATE BOOKINGS
SET total_amount=0.5*total_amount
WHERE book_ref LIKE '%F%'



--DELETE
--удалить все модели содержащие Jet у которых дальность полета варьируется между 2000 и 5000 
DELETE FROM AIRCRAFT
WHERE model LIKE '%Jet%' AND ranges BETWEEN 2000 AND 5000

--удалить всю информацию о перелетных билетак где сумма больше или равна 130 000 или номер рейса равен 19732
DELETE FROM TICKET_FLIGHTS
WHERE amount>=130000.00 OR flight_id = 19732

--удалить все аэропорты москвы
DELETE FROM AIRPORT
WHERE city='Moscow'

--удалить место 23В из комфорт класса
DELETE FROM SEATS
WHERE seat_no='23B' AND fare_conditions='Comfort'



--VIEW
--view1
CREATE OR ALTER VIEW Ticketbookingdetails
AS

	SELECT  dbo.FLIGHT.flight_id,
            dbo.FLIGHT.flight_no,
		    dbo.AIRCRAFT.model,
			dbo.FLIGHT.scheduled_departure,
			dbo.TICKET_FLIGHTS.fare_conditions AS [Class Type],
			COUNT(dbo.BOARDING_PASSES.seat_no) AS [Booked Seat Amount]

	FROM     dbo.AIRCRAFT INNER JOIN
	         dbo.FLIGHT ON dbo.AIRCRAFT.aircraft_code = dbo.FLIGHT.aircraft_code INNER JOIN
			 dbo.TICKET_FLIGHTS ON dbo.FLIGHT.flight_id = dbo.TICKET_FLIGHTS.flight_id INNER JOIN
			 dbo.BOARDING_PASSES ON dbo.TICKET_FLIGHTS.ticket_no = dbo.BOARDING_PASSES.ticket_no

	GROUP BY  dbo.FLIGHT.flight_id,
	          dbo.AIRCRAFT.model,
			  dbo.BOARDING_PASSES.seat_no,
			  dbo.FLIGHT.flight_no,
			  dbo.FLIGHT.scheduled_departure,
			  dbo.TICKET_FLIGHTS.ticket_no,
			  dbo.TICKET_FLIGHTS.fare_conditions

/* Execution*/
	SELECT * FROM Ticketbookingdetails


--view2
CREATE VIEW upcoming_Arrival
AS

	SELECT dbo.FLIGHT.flight_id AS [Flight Number],
                         dbo.AIRCRAFT.model AS [Aircraft Name],
						 dbo.AIRCRAFT.ranges AS [Aircraft Ranges],
						 dbo.FLIGHT.statuss AS [Flight Type],
						 dbo.FLIGHT.scheduled_arrival AS [Date of Arrival],
						 dbo.FLIGHT.arrival_airport AS [Arrival Airport],
						 dbo.FLIGHT.actual_arrival AS [Arrival Actual]

	FROM  dbo.AIRCRAFT 
	Inner JOIN dbo.FLIGHT ON dbo.AIRCRAFT.aircraft_code = dbo.FLIGHT.aircraft_code 


	WHERE FLIGHT.statuss='Arrived'  



       select * from upcoming_Arrival                 
	   select * from Flight
 
 update FLIGHT set scheduled_arrival='2022-04-21' where flight_id=30625

/* Execution*/
 select * from upcoming_Arrival


 --view3
 CREATE FUNCTION Function_find_Pasenger (@startDate date, @endDate date)
RETURNS @customer_details TABLE 
	(
		aircraft_code char(10),
		model varchar(30),
		flight_id smallint,
		ticket_no char(13),
		passenger_name varchar (200),
		email varchar(50),
		phone varchar(15)
	)
	AS 
		BEGIN

			INSERT INTO  @customer_details (aircraft_code,model,flight_id,ticket_no,passenger_name,email,phone)
			
			Select AIRCRAFT.aircraft_code , AIRCRAFT.model ,FLIGHT.flight_id,TICKET_FLIGHTS.ticket_no,passenger_name,email,phone

			FROM TICKETS
			JOIN TICKET_FLIGHTS on (TICKET_FLIGHTS.ticket_no=TICKETS.ticket_no)
			JOIN FLIGHT on (TICKET_FLIGHTS.flight_id=FLIGHT.flight_id)
			JOIN AIRCRAFT on (FLIGHT.aircraft_code=AIRCRAFT.aircraft_code)
			WHERE
			 
				TICKETS.ticket_no=TICKET_FLIGHTS.ticket_no and FLIGHT.scheduled_arrival < @endDate and FLIGHT.scheduled_arrival > @startDate

				ORDER BY AIRCRAFT.aircraft_code

			Return
		END


CREATE VIEW find_passenger
AS
SELECT * FROM Function_find_Pasenger('2021-06-01 00:00:00' , '2021-09-05 00:00:00') as find

/* Execution*/
select * from find_passenger


--view4
CREATE FUNCTION statusInfo (@status varchar(30),@startDate date, @endDate date)

RETURNS @delay_info TABLE 
	(
		statuss varchar (30),
		flight_id smallint,
		flight_no char (10),
		departure_airport char (30),
		scheduled_departure DATETIME,
		ticket_no char(13),
		passenger_name varchar (200)
	)

AS
	BEGIN

		INSERT INTO @delay_info (statuss,flight_id,flight_no,departure_airport,scheduled_departure,ticket_no,passenger_name)
		
		SELECT FLIGHT.statuss,FLIGHT.flight_id,FLIGHT.flight_no,FLIGHT.departure_airport,FLIGHT.scheduled_departure,TICKET_FLIGHTS.ticket_no,passenger_name
		from TICKETS 
		JOIN TICKET_FLIGHTS on (TICKET_FLIGHTS.ticket_no=TICKETS.ticket_no)
	    JOIN FLIGHT on (TICKET_FLIGHTS.flight_id=FLIGHT.flight_id)


		Where FLIGHT.statuss=@status and FLIGHT.scheduled_departure < @endDate and FLIGHT.scheduled_departure > @startDate

	
		RETURN
		END


		create view statuss
	as
		SELECT * FROM statusInfo('Cancelled','2021-06-01 00:00:00' , '2021-09-05 00:00:00') 

		/* Execution*/
		select * from statuss


--PROCEDURE
create procedure show @airport varchar(20)
as
begin
select * from AIRPORT
where airport_code like @airport+'%'+@airport+'%'
end

/* Execution*/
exec show 'L'


create procedure show1 @seat varchar(20)='Business'
as
begin
select * from SEATS
where fare_conditions like '%'+@seat+'%'
end

/* Execution*/
exec show1

create procedure show2 @email varchar(20)=null
as
begin
if @email is null
begin 
print 'There is not enough parametrs to procedure show'
end

else
begin
if exists(select * from TICKETS where email like '%'+@email+'%')
begin 
print 'Email list'
select * from TICKETS where email like '%'+@email+'%'
end
else
begin
print 'There is no data found for your query'
end
end
end

/* Execution*/
exec show2 '@gmail.com'

create procedure show3 @flight VARCHAR(20)=null
AS
BEGIN
EXEC show @flight
IF EXISTS(SELECT * FROM FLIGHT)
BEGIN
PRINT 'Flight of all aircrafts'
SELECT flight_no,statuss,arrival_airport  FROM FLIGHT
END
ELSE
BEGIN
PRINT 'No aircrafts found'
END
END

/* Execution*/
exec show3 'L'


--TRIGGERS
--INSERT
CREATE TRIGGER tr_insert ON AIRCRAFT
FOR INSERT 
AS BEGIN DECLARE @Ranges int
SELECT @Ranges=ranges FROM inserted
IF(@Ranges<1000)
	BEGIN
	PRINT 'THE RANGE OF AIRCRAFT MUST BE MORE'
	ROLLBACK TRANSACTION
	END
	RETURN
END

sp_help tr_insert

INSERT INTO AIRCRAFT VALUES('CN0','Cessna 288 Caravan',900);
INSERT INTO AIRCRAFT VALUES('753','Boeing 757-500',3600);


--DELETE
CREATE TRIGGER tr_delete ON SEATS
FOR DELETE
AS
PRINT 'YOU CAN NOT DELETE INFO ABOUT SEAT'
ROLLBACK TRANSACTION RETURN

sp_help tr_delete

DELETE FROM SEATS
WHERE seat_no LIKE 'A%'


--UPDATE
CREATE TRIGGER tr_update ON BOOKINGS
FOR UPDATE 
AS
BEGIN
DECLARE @Total_amount int
SELECT @Total_amount=total_amount+1000.0 FROM inserted
IF (@Total_amount>140000.0)
	BEGIN
	PRINT 'The specified amount must be less than 140 000'
	ROLLBACK TRANSACTION
	END
RETURN 
END

sp_help tr_update

UPDATE BOOKINGS
SET total_amount=total_amount+1000.0
WHERE book_ref='0004E1'


--TRIGGER MODIFICATION
ALTER TRIGGER tr_update ON BOOKINGS
FOR INSERT
AS
BEGIN
DECLARE @Total_amount int
SELECT @Total_amount=avg(total_amount) FROM inserted
IF (@Total_amount>140000.0)
	BEGIN
	RAISERROR ('The specified amount must be less than 140 000',10,1)
	ROLLBACK TRANSACTION
	END
RETURN 
END

sp_helptext tr_update

INSERT INTO BOOKINGS VALUES('000411','2021-07-01 03:40:00',25600.00);
INSERT INTO BOOKINGS VALUES('00058F','2021-08-06 03:15:00',150000.00);


--TRIGGER REMOVAL
DROP TRIGGER tr_delete


--CHANGE THE SEQUENCE OF TRIGGERS EXECUTION
CREATE TRIGGER tr_insert2 ON AIRCRAFT
FOR INSERT 
AS
BEGIN 
DECLARE @Model char(10)
SELECT @Model=model FROM inserted
IF(@Model LIKE '%Boeing%')
BEGIN
PRINT ('THE MODEL OF AIRCRAFT MUST NOT BE Boeing')
END
RETURN
END

EXEC sp_settriggerorder 'tr_insert2','first','insert'
EXEC sp_settriggerorder 'tr_insert', 'last','insert'


INSERT INTO AIRCRAFT VALUES('757','Boeing 757-500',1800);
INSERT INTO AIRCRAFT VALUES('CN0','Cessna 288 Caravan',900);


--AFTER TRIGGER
CREATE TRIGGER tr_update1 ON AIRPORT AFTER UPDATE 
AS 
DECLARE @tr int 
SET @tr=@@ROWCOUNT 
IF @tr=0 RETURN 
IF @tr > 1 BEGIN 
RAISERROR('Only one lines can be changed',16,10) 
ROLLBACK 
RETURN 
END 
IF ((COLUMNS_UPDATED() & 4)<>0) BEGIN 
IF EXISTS (SELECT * FROM FLIGHT F JOIN inserted I ON F.departure_airport=I.airport_code 
WHERE F.arrival_airport=I.airport_code ) 
BEGIN 
RAISERROR('The Airport_name column should be the same',16,10) 
ROLLBACK 
RETURN 
END 
END 

UPDATE AIRPORT
SET airport_name='Moscow'
WHERE airport_name like 'B%'


--INSTEAD OF TRIGGER
CREATE TABLE TICK2(num int identity,operation varchar(20),id int,ticket_no char(13),passenger_name varchar(20))
CREATE TABLE TICK(id int identity,ticket_no char(13), passenger_name varchar(20))

CREATE VIEW vticket 
AS
SELECT ticket_no,passenger_name FROM TICK

CREATE TRIGGER tr_vticket ON vticket INSTEAD OF INSERT
AS 
INSERT TICK(ticket_no,passenger_name)
SELECT UPPER(ticket_no),UPPER(passenger_name)
FROM inserted

INSERT INTO vticket VALUES('0005435292851','TEMIRKHAN ANEL')
INSERT INTO vticket VALUES('0005435298955','KURMANGALIEVA AZHAR')
INSERT INTO vticket VALUES('0005435292325','ZHUBANOVA YENGLIK')
INSERT INTO vticket VALUES('0005435292889','AKHMETOVA MADINA')

SELECT * FROM vticket


--TRIGGER CREATION
CREATE TRIGGER TICK_UPDATE ON TICK AFTER UPDATE
AS
IF @@ROWCOUNT=0 RETURN
INSERT TICK2(operation,id,ticket_no,passenger_name)
SELECT 'UPDATE--BEFORE',* FROM deleted
INSERT TICK2(operation,id,ticket_no,passenger_name)
SELECT 'UPDATE--AFTER',* FROM inserted

UPDATE TICK SET ticket_no='0000000000000'

SELECT * FROM TICK2 ORDER BY id,operation,num




CREATE OR ALTER TRIGGER Operationfailure ON FLIGHT
AFTER INSERT 
AS
    DECLARE @Fligt_id int
	DECLARE @Fligt_no CHAR(10)
	DECLARE @Status VARCHAR(30)
	DECLARE @Arrival_airport CHAR(30)

	SET @Arrival_airport = (SELECT arrival_airport from inserted)
	SET @Status  = (SELECT statuss FROM inserted)
    SET @Fligt_no = (SELECT flight_no FROM inserted)
	SET @Fligt_id = (SELECT flight_id FROM inserted)

	IF (@Fligt_no != '') 
		BEGIN 
			SELECT  dbo.AIRPORT.airport_name AS [Airport Name], 
			    dbo.FLIGHT.flight_no AS [Flight Number],
				dbo.FLIGHT.statuss, 
				dbo.TICKET_FLIGHTS.ticket_no AS [Ticket Number], 
				dbo.TICKET_FLIGHTS.fare_conditions AS [Fare Conditions], 
				dbo.TICKETS.passenger_name AS [Passenger Name]
				

			FROM     dbo.AIRPORT
			JOIN dbo.FLIGHT ON (dbo.AIRPORT.airport_code = dbo.FLIGHT.departure_airport)
			JOIN dbo.TICKET_FLIGHTS ON (dbo.FLIGHT.flight_id=dbo.TICKET_FLIGHTS.flight_id)
			JOIN dbo.TICKETS ON (dbo.TICKET_FLIGHTS.ticket_no=dbo.TICKETS.ticket_no)
			WHERE flight_no= @Fligt_no
			ORDER BY [Airport Name], 
					 [Flight Number], 
					 dbo.FLIGHT.statuss,
					 [Ticket Number], 
					 [Fare Conditions],
					 [Passenger Name]
		END

	ElSE 
	   BEGIN 
	     PRINT 'Successfully Inserted'+
		 CHAR(10)+'No any special Flight No to report' 
		 ROLLBACK
		 insert into FLIGHT(flight_id,flight_no,arrival_airport,statuss) values (@Fligt_id,@Fligt_no,@Arrival_airport,@Status)
       END


	   /* Execution*/
	   
	   insert into FLIGHT(flight_id,flight_no,arrival_airport,statuss) values (6776,'PG0569','BFS','On Time')

	   insert into FLIGHT(flight_id,flight_no,arrival_airport,statuss) values (825,'PG0269','SVO','Cancelled')





CREATE LOGIN Assel WITH PASSWORD = 'Asselchik'

CREATE USER Assel FOR LOGIN Assel

SELECT * FROM sys.database_principals


GRANT SELECT,UPDATE,DELETE ON dbo.FLIGHT TO Assel

DENY DELETE ON dbo.BOOKINGS TO Assel

GRANT SELECT ON dbo.Airport TO Assel


CREATE ROLE Admins

EXECUTE sp_addrolemember "Admins","Assel"


GRANT  ON dbo.SEATS TO Admins

