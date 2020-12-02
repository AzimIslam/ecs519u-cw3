/* GROUP PARTICIPANTS
    Azim Islam - 190227344
    Rikhil Shah - 190182098
    Haroon Aftab - 190290452
    Sahir Ahmed - 
*/

/* === DB Design Scenario: Eurostar 2030

You are a DB (and AI, and ML, and BI) consultant and
your customer is the Eurostar company.
The Eurostar company operates trains and services (repairs)
the railway lines between London, Paris, Brussels and Cologne.
There are numerous challenges for the decade 2020 - 2030, and Eurostar
has decided to invest into a new DB solution.

There are several old and new routes to be considered.
For example, London St Pancras to Paris, and,
in future, London Stratford to Paris, and London Stratford to Cologne.
Also, some trains will terminate in Brussels, whereas others stop
in Brussels, and then continue to Cologne in Germany.

The DB design has to be ready to model train routes
with different stations to start from, and different stations to terminate at.
The routes have one start station, several stations in the middle
(referred to as stops), and one terminal station.

For each route, distance and journey time are to be stored.
For example, the 306-mile route London-Paris takes 2hrs 50 mins.

The company operates 20 trains.  On average, 16 are in operation,
and the others are in service (regular service checks and repairs).
Trains can serve different routes.
There are different trains.
Only the modern trains (introduced in 2016)
will be suitable for the new Stratford-Cologne route (because of track issues).

The company employs around 400 people in many different roles.
There are the train crews operating the trains.
A crew consists of two drivers, two conductors
(one is the head of the crew),
five service team members
(responsible for drinks and food), and two security guards.
Other employees are responsible for management and sales.

You will need to demonstrate that your DB application can
keep track of each train trip and the employees involved in the trip.
The company wants to process queries such as
"Show all train journeys where Mary Poppins was part of the train team".

Also, information about number and type of passengers are to stored
for each trip.  Then, queries such as
"how many students travelled from St Pancras to Paris in Dec 2016"
can be processed. */

/* CREATE Table and INSERT statements */
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




/* INSERT VALUES*/

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

