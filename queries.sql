/* CREATE Table and INSERT statements */
CREATE TABLE Employee(
    EmployeeID int primary key,
    firstname varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    dob DATE NOT NULL,
    gender CHAR(1) CHECK(gender == 'M' or gender == 'F')
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

CREATE Table City (
    CityID int primary key,
    Country varchar(255) NOT NULL,
    CityName varchar(255) NOT NULL,
);

CREATE TABLE Station(
    StationID int primary key,
    StationName varchar(255) NOT NULL,
    CityID int NOT NULL FOREIGN KEY REFERENCES City(CityID) ON DELETE RESTRICT ON UPDATE CASCADE
);