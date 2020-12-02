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
    gender CHAR(1) CHECK(gender == 'M' or gender == 'F'),
    occupation int NOT NULL FOREIGN KEY REFERENCES Occupation(OccupationID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Train(
    Model varchar(128) primary key,
    operation varchar(10) CHECK(operation == 'TRUE' or operation == 'FALSE'),
    ModelYear YEAR NOT NULL
);

CREATE TABLE Passenger(
    PassengerID int primary key,
    firstname varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    passengertype varchar(255) CHECK(passengertype == 'Student' or passengertype='Junior' or passengertype='Adult' or passengertype='Senior');
);

CREATE TABLE City(
    CityID int primary key,
    Country varchar(255) NOT NULL,
    CityName varchar(255) NOT NULL
);

CREATE TABLE Crew(
    EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employee(EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
    TripID int NOT NULL FOREIGN KEY REFERENCES Trip(TripID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Trip(
    TripID int primary key,
    starttime TIME NOT NULL,
    endtime TIME NOT NULL,
    trip_date date NOT NULL,
    train_model int NOT NULL FOREIGN KEY REFERENCES Train(Model) ON DELETE RESTRICT ON UPDATE CASCADE,
    routeID int NOT NULL FOREIGN KEY REFERENCES Routes(routeID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE Table PassengerTrips (
    PassengerID int NOT NULL FOREIGN KEY REFERENCES Passenger(PassengerID) ON DELETE CASCADE ON UPDATE CASCADE,
    TripID int NOT NULL FOREIGN KEY REFERENCES Trip(TripID) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE Table Routes (
    RouteID int primary key,
    StartStation int NOT NULL FOREIGN KEY REFERENCES Station(StationID) ON DELETE RESTRICT ON UPDATE CASCADE,
    EndStation int NOT NULL FOREIGN KEY REFERENCES Station(StationID) ON DELETE RESTRICT ON UPDATE CASCADE,
    Distance REAL NOT NULL
);

CREATE TABLE Station(
    StationID int primary key,
    StationName varchar(255) NOT NULL,
    CityID int NOT NULL FOREIGN KEY REFERENCES City(CityID) ON DELETE RESTRICT ON UPDATE CASCADE
);


/* INSERT VALUES*/

/* Occupations */
/* Boss, Driver, Conductor, Service Member, Administrator*/
