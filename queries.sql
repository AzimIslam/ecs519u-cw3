/* GROUP PARTICIPANTS
    Azim Islam - 190227344
    Rikhil Shah - 190182098
    Haroon Aftab - 190290452
    Sahir Ahmed - 190191746
*/

/* CREATE Table statements */
CREATE TABLE Occupation(
    OccupationID int primary key,
    OccupationName varchar(255)
);

CREATE TABLE Employee(
    EmployeeID int primary key,
    firstname varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1),
    OccupationID int NOT NULL REFERENCES Occupation(OccupationID),
    CONSTRAINT chk_date CHECK (gender='M' or gender='F')
);

CREATE TABLE Train(
    TrainModel varchar(128) primary key,
    operation varchar(10),
    ModelYear INT NOT NULL,
    constraint chkOperation CHECK (operation='TRUE' or operation='FALSE')
);

CREATE TABLE Passenger(
    PassengerID int primary key,
    firstname varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    passengertype varchar(255), 
    constraint chkPassengerType CHECK(passengertype = 'Student' or passengertype='Junior' or passengertype='Adult' or passengertype='Senior')
);

CREATE TABLE City(
    CityID int primary key,
    Country varchar(255) NOT NULL,
    CityName varchar(255) NOT NULL
);

CREATE TABLE Station(
    StationID int primary key,
    StationName varchar(255) NOT NULL,
    CityID int NOT NULL REFERENCES City(CityID)
);

CREATE Table Routes (
    RouteID int primary key,
    StartStation int NOT NULL REFERENCES Station(StationID),
    EndStation int NOT NULL REFERENCES Station(StationID),
    Distance REAL NOT NULL
);

CREATE TABLE Trip(
    TripID int primary key,
    starttime TIMESTAMP NOT NULL,
    endtime TIMESTAMP NOT NULL,
    train_model varchar(128) NOT NULL REFERENCES Train(TrainModel),
    routeID int NOT NULL REFERENCES Routes(routeID)
);

CREATE TABLE Crew(
    EmployeeID int NOT NULL REFERENCES Employee(EmployeeID),
    TripID int NOT NULL REFERENCES Trip(TripID)
);

CREATE Table PassengerTrips (
    PassengerID int NOT NULL REFERENCES Passenger(PassengerID),
    TripID int NOT NULL REFERENCES Trip(TripID)
);




/* INSERT statements*/

/* Occupations */
INSERT INTO Occupation VALUES(1, 'Driver');
INSERT INTO Occupation VALUES(2, 'Conductor');
INSERT INTO Occupation VALUES(3, 'Service Member');
INSERT INTO Occupation VALUES(4, 'Security Guard');

/* Employee */
INSERT INTO Employee VALUES(1, 'Bob', 'Jones', TO_DATE('20-FEB-1981', 'DD-MON-YYYY'), 'M', 1);
INSERT INTO Employee VALUES(2, 'Farah', 'Walterson', TO_DATE('15-NOV-1984', 'DD-MON-YYYY'), 'F', 1);
INSERT INTO Employee VALUES(3, 'Yoann', 'Monday', TO_DATE('01-NOV-1997', 'DD-MON-YYYY'), 'M', 2);
INSERT INTO Employee VALUES(4, 'Emma', 'Csizamdia', TO_DATE('08-FEB-1997', 'DD-MON-YYYY'), 'F', 2);
INSERT INTO Employee VALUES(5, 'Diarmaid', 'Smets', TO_DATE('06-JUL-1983', 'DD-MON-YYYY'), 'F', 3);
INSERT INTO Employee VALUES(6, 'Atli', 'Torosyan', TO_DATE('18-SEP-1979', 'DD-MON-YYYY'), 'M', 3);
INSERT INTO Employee VALUES(7, 'Aoi', 'Etxeberria', TO_DATE('16-APR-1976', 'DD-MON-YYYY'), 'M', 3);
INSERT INTO Employee VALUES(8, 'Fedir', 'Andries', TO_DATE('28-APR-1989', 'DD-MON-YYYY'), 'F', 3);
INSERT INTO Employee VALUES(9, 'Lakshmi', 'Rimmer', TO_DATE('11-FEB-1983', 'DD-MON-YYYY'), 'F', 3);
INSERT INTO Employee VALUES(10, 'Eraldo', 'Chaudhuri', TO_DATE('06-APR-1997', 'DD-MON-YYYY'), 'M', 4);
INSERT INTO Employee VALUES(11, 'Helfried', 'Sgro', TO_DATE('28-OCT-1980', 'DD-MON-YYYY'), 'M', 4);

/* Train */
INSERT INTO Train VALUES('XD-500', 'TRUE', 2017);
INSERT INTO Train VALUES('CG-981', 'FALSE', 1996);
INSERT INTO Train VALUES('RPG-9100', 'TRUE', 2001);
INSERT INTO Train VALUES('ZPM-S1', 'TRUE', 2005);

/* Passenger */
INSERT INTO PASSENGER VALUES (1, 'WAFI', 'TAWFIQ', 'Student');
INSERT INTO PASSENGER VALUES (2, 'POPPY', 'SOAMES', 'Student');
INSERT INTO PASSENGER VALUES (3, 'TASSOS', 'TOMBROS', 'Adult');
INSERT INTO PASSENGER VALUES (4, 'ANNE', 'HSU', 'Adult');
INSERT INTO PASSENGER VALUES (5, 'ALLYSON', 'MENON', 'Adult');
INSERT INTO PASSENGER VALUES (6, 'AMY', 'MENON', 'Junior');
INSERT INTO PASSENGER VALUES (7, 'NIKOS', 'TOMBROS', 'Junior');
INSERT INTO PASSENGER VALUES (8, 'JACOB', 'MOGG', 'Senior');
INSERT INTO PASSENGER VALUES (9, 'LENA', 'STOLARZ', 'Senior');
INSERT INTO PASSENGER VALUES (10, 'BILLY', 'KEITH', 'Senior');

/* City */
INSERT INTO City VALUES(1, 'United Kingdom', 'London');
INSERT INTO City VALUES(2, 'France', 'Paris');
INSERT INTO City VALUES(3, 'Belgium', 'Brussels');
INSERT INTO City VALUES(4, 'Germany', 'Cologne');

/* Station */
INSERT INTO Station VALUES(1, 'London St Pancras', 1);
INSERT INTO Station VALUES(2, 'London Euston', 1);
INSERT INTO Station VALUES(3, 'Gare du Nord', 2);
INSERT INTO Station VALUES(4, 'Disneyland Paris', 2);
INSERT INTO Station VALUES(5, 'Brussels Midi', 3);
INSERT INTO Station VALUES(6, 'Hauptbahnhof', 4);

/* Routes */
INSERT INTO Routes VALUES(1, 1, 3, 291.5);
INSERT INTO Routes VALUES(2, 1, 5, 240.2);
INSERT INTO Routes VALUES(3, 6, 3, 1045.2);
INSERT INTO Routes VALUES(4, 3, 2, 461.8);
INSERT INTO Routes VALUES(5, 4, 3, 45.3);
INSERT INTO Routes VALUES(6, 6, 1, 341.5);
INSERT INTO Routes VALUES(7, 2, 4, 253.3);
INSERT INTO Routes VALUES(8, 5, 4, 263.3);
INSERT INTO Routes VALUES(9, 2, 6, 532.4);
INSERT INTO Routes VALUES(10, 5, 6, 423.2);

/* Trip */
INSERT INTO TRIP VALUES(1, TO_TIMESTAMP('2020-12-14 08:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-14 12:00', 'YYYY-MM-DD HH24:MI'), 'ZPM-S1', 1);
INSERT INTO TRIP VALUES(2, TO_TIMESTAMP('2020-12-16 09:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-16 13:00', 'YYYY-MM-DD HH24:MI'), 'XD-500', 2);
INSERT INTO TRIP VALUES(3, TO_TIMESTAMP('2020-12-17 14:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-17 19:00', 'YYYY-MM-DD HH24:MI'), 'CG-981', 3);
INSERT INTO TRIP VALUES(4, TO_TIMESTAMP('2020-12-19 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-19 22:00', 'YYYY-MM-DD HH24:MI'), 'RPG-9100', 4);
INSERT INTO TRIP VALUES(5, TO_TIMESTAMP('2020-12-20 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-20 23:00', 'YYYY-MM-DD HH24:MI'), 'XD-500', 5);
INSERT INTO TRIP VALUES(6, TO_TIMESTAMP('2020-12-22 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-22 20:00', 'YYYY-MM-DD HH24:MI'), 'RPG-9100', 6);
INSERT INTO Trip VALUES(7, TO_TIMESTAMP('2020-12-23 13:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-23 17:00', 'YYYY-MM-DD HH24:MI'), 'CG-981', 7);
INSERT INTO Trip VALUES(8, TO_TIMESTAMP('2020-12-24 11:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-24 14:00', 'YYYY-MM-DD HH24:MI'), 'CG-981', 3);
INSERT INTO Trip VALUES(9, TO_TIMESTAMP('2020-12-25 06:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-25 12:00', 'YYYY-MM-DD HH24:MI'), 'XD-500', 2);
INSERT INTO Trip VALUES(10, TO_TIMESTAMP('2020-12-26 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-27 05:00', 'YYYY-MM-DD HH24:MI'), 'XD-500', 5);
INSERT INTO Trip VALUES(11, TO_TIMESTAMP('2020-12-27 00:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-28 07:00', 'YYYY-MM-DD HH24:MI'), 'ZPM-S1', 4);
INSERT INTO Trip VALUES(12, TO_TIMESTAMP('2020-12-28 12:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2020-12-28 17:00', 'YYYY-MM-DD HH24:MI'), 'RPG-9100', 2);

/* Crew */
INSERT INTO Crew VALUES(1, 1);
INSERT INTO Crew VALUES(2, 1);
INSERT INTO Crew VALUES(3, 1);
INSERT INTO Crew VALUES(4, 1);
INSERT INTO Crew VALUES(5, 1);
INSERT INTO Crew VALUES(6, 1);
INSERT INTO Crew VALUES(7, 1);
INSERT INTO Crew VALUES(8, 1);
INSERT INTO Crew VALUES(9, 1);
INSERT INTO Crew VALUES(10, 1);
INSERT INTO Crew VALUES(11, 1);

INSERT INTO Crew VALUES(1, 2);
INSERT INTO Crew VALUES(2, 2);
INSERT INTO Crew VALUES(3, 2);
INSERT INTO Crew VALUES(4, 2);
INSERT INTO Crew VALUES(5, 2);
INSERT INTO Crew VALUES(6, 2);
INSERT INTO Crew VALUES(7, 2);
INSERT INTO Crew VALUES(8, 2);
INSERT INTO Crew VALUES(9, 2);
INSERT INTO Crew VALUES(10, 2);
INSERT INTO Crew VALUES(11, 2);

INSERT INTO Crew VALUES(1, 3);
INSERT INTO Crew VALUES(2, 3);
INSERT INTO Crew VALUES(3, 3);
INSERT INTO Crew VALUES(4, 3);
INSERT INTO Crew VALUES(5, 3);
INSERT INTO Crew VALUES(6, 3);
INSERT INTO Crew VALUES(7, 3);
INSERT INTO Crew VALUES(8, 3);
INSERT INTO Crew VALUES(9, 3);
INSERT INTO Crew VALUES(10,3);
INSERT INTO Crew VALUES(11, 3);

INSERT INTO Crew VALUES(1, 4);
INSERT INTO Crew VALUES(2, 4);
INSERT INTO Crew VALUES(3, 4);
INSERT INTO Crew VALUES(4, 4);
INSERT INTO Crew VALUES(5, 4);
INSERT INTO Crew VALUES(6,4);
INSERT INTO Crew VALUES(7, 4);
INSERT INTO Crew VALUES(8, 4);
INSERT INTO Crew VALUES(9, 4);
INSERT INTO Crew VALUES(10, 4);
INSERT INTO Crew VALUES(11, 4);

INSERT INTO Crew VALUES(1, 5);
INSERT INTO Crew VALUES(2, 5);
INSERT INTO Crew VALUES(3, 5);
INSERT INTO Crew VALUES(4, 5);
INSERT INTO Crew VALUES(5, 5);
INSERT INTO Crew VALUES(6, 5);
INSERT INTO Crew VALUES(7, 5);
INSERT INTO Crew VALUES(8, 5);
INSERT INTO Crew VALUES(9, 5);
INSERT INTO Crew VALUES(10, 5);
INSERT INTO Crew VALUES(11, 5);

INSERT INTO Crew VALUES(1, 6);
INSERT INTO Crew VALUES(2, 6);
INSERT INTO Crew VALUES(3, 6);
INSERT INTO Crew VALUES(4, 6);
INSERT INTO Crew VALUES(5, 6);
INSERT INTO Crew VALUES(6, 6);
INSERT INTO Crew VALUES(7, 6);
INSERT INTO Crew VALUES(8, 6);
INSERT INTO Crew VALUES(9, 6);
INSERT INTO Crew VALUES(10, 6);
INSERT INTO Crew VALUES(11, 6);

INSERT INTO Crew VALUES(1, 7);
INSERT INTO Crew VALUES(2, 7);
INSERT INTO Crew VALUES(3, 7);
INSERT INTO Crew VALUES(4, 7);
INSERT INTO Crew VALUES(5, 7);
INSERT INTO Crew VALUES(6, 7);
INSERT INTO Crew VALUES(7, 7);
INSERT INTO Crew VALUES(8, 7);
INSERT INTO Crew VALUES(9, 7);
INSERT INTO Crew VALUES(10, 7);
INSERT INTO Crew VALUES(11, 7);

INSERT INTO Crew VALUES(1, 8);
INSERT INTO Crew VALUES(2, 8);
INSERT INTO Crew VALUES(3, 8);
INSERT INTO Crew VALUES(4, 8);
INSERT INTO Crew VALUES(5, 8);
INSERT INTO Crew VALUES(6, 8);
INSERT INTO Crew VALUES(7, 8);
INSERT INTO Crew VALUES(8, 8);
INSERT INTO Crew VALUES(9, 8);
INSERT INTO Crew VALUES(10, 8);
INSERT INTO Crew VALUES(11, 8);

INSERT INTO Crew VALUES(1, 9);
INSERT INTO Crew VALUES(2, 9);
INSERT INTO Crew VALUES(3, 9);
INSERT INTO Crew VALUES(4, 9);
INSERT INTO Crew VALUES(5, 9);
INSERT INTO Crew VALUES(6, 9);
INSERT INTO Crew VALUES(7, 9);
INSERT INTO Crew VALUES(8, 9);
INSERT INTO Crew VALUES(9, 9);
INSERT INTO Crew VALUES(10, 9);
INSERT INTO Crew VALUES(11, 9);

INSERT INTO Crew VALUES(1, 10);
INSERT INTO Crew VALUES(2, 10);
INSERT INTO Crew VALUES(3, 10);
INSERT INTO Crew VALUES(4, 10);
INSERT INTO Crew VALUES(5, 10);
INSERT INTO Crew VALUES(6, 10);
INSERT INTO Crew VALUES(7, 10);
INSERT INTO Crew VALUES(8, 10);
INSERT INTO Crew VALUES(9, 10);
INSERT INTO Crew VALUES(10, 10);
INSERT INTO Crew VALUES(11, 10);

INSERT INTO Crew VALUES(1, 11);
INSERT INTO Crew VALUES(2, 11);
INSERT INTO Crew VALUES(3, 11);
INSERT INTO Crew VALUES(4, 11);
INSERT INTO Crew VALUES(5, 11);
INSERT INTO Crew VALUES(6, 11);
INSERT INTO Crew VALUES(7, 11);
INSERT INTO Crew VALUES(8, 11);
INSERT INTO Crew VALUES(9, 11);
INSERT INTO Crew VALUES(10, 11);
INSERT INTO Crew VALUES(11, 11);

INSERT INTO Crew VALUES(1, 12);
INSERT INTO Crew VALUES(2, 12);
INSERT INTO Crew VALUES(3, 12);
INSERT INTO Crew VALUES(4, 12);
INSERT INTO Crew VALUES(5, 12);
INSERT INTO Crew VALUES(6, 12);
INSERT INTO Crew VALUES(7, 12);
INSERT INTO Crew VALUES(8, 12);
INSERT INTO Crew VALUES(9, 12);
INSERT INTO Crew VALUES(10, 12);
INSERT INTO Crew VALUES(11, 12);

/* PassengerTrip */
INSERT INTO PassengerTrips VALUES (5, 7);
INSERT INTO PassengerTrips VALUES (6, 7);
INSERT INTO PassengerTrips VALUES (3, 5);
INSERT INTO PassengerTrips VALUES (7, 5);
INSERT INTO PassengerTrips VALUES (1, 4);
INSERT INTO PassengerTrips VALUES (2, 3);
INSERT INTO PassengerTrips VALUES (4, 2);
INSERT INTO PassengerTrips VALUES (8, 1);
INSERT INTO PassengerTrips VALUES (9, 5);
INSERT INTO PassengerTrips VALUES (10, 2);
INSERT INTO PassengerTrips VALUES (10, 4);
INSERT INTO PassengerTrips VALUES (10, 6);

/* BASIC QUERIES */

/* Show all employees who are male and whose surname begins with the letter ‘C’ */
/* Basic Query 1 - Conditions */
SELECT * From Employee Where gender = 'M' and surname like 'C%';

/* Show the number of females that the train company has employed */
/* Basic Query 2 - Conditions */
SELECT count(*) AS "Number of Females" FROM Employee WHERE gender = 'F';

/* MEDIUM Queries */

/* Show all trips where BILLY KEITH was a passenger order by journey time */
/* Medium Query 1 - Join, Order By */
SELECT t.*
FROM PassengerTrips pt
INNER JOIN Passenger p
ON p.PassengerID = pt.PassengerID
INNER JOIN Trip t
ON pt.TripID = t.TripID 
Where p.firstname = 'BILLY'
AND   p.surname = 'KEITH'
ORDER BY t.endtime - t.starttime

/* Show the number of employees for each occupation */
/* Medium Query 2 - Join, Group By */
SELECT o.OccupationName, count(*) AS "Number of Employees"
From Employee e
INNER JOIN Occupation o 
ON e.OccupationID = o.OccupationID 
GROUP BY o.OccupationName;

/* Show the average age of all employees for each occupation */
/* Medium Query 3 - Function, Group By, Join */
SELECT o.OccupationName, AVG(to_char(SYSDATE, 'YYYY') - to_char(e.dob, 'YYYY')) AS "Average Age"
FROM Employee e
INNER JOIN Occupation o
ON e.OccupationID = o.OccupationID
GROUP BY o.OccupationName;

