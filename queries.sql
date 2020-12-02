/* GROUP PARTICIPANTS
    Azim Islam - 190227344
    Rikhil Shah - 190182098
    Haroon Aftab - 190290452
    Sahir Ahmed - 
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
    trip_date date NOT NULL,
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

/* Crew */

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
