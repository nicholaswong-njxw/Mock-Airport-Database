CREATE TABLE Airline (
    airline_id VARCHAR(2) NOT NULL,
    airline_name VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (airline_id)
);

CREATE TABLE Flight (
    flight_id INTEGER NOT NULL,
    departure_airport VARCHAR(255) DEFAULT NULL,
    departure_gate VARCHAR(255) DEFAULT NULL,
    departure_time VARCHAR(255) DEFAULT NULL,
    arrival_airport VARCHAR(255) DEFAULT NULL,
    arrival_gate VARCHAR(255) DEFAULT NULL,
    arrival_time VARCHAR(255) DEFAULT NULL,
    airline_id VARCHAR(2) NOT NULL,
    aircraft VARCHAR(255) DEFAULT NULL,
    first_capacity INTEGER DEFAULT 10,
    business_capacity INTEGER DEFAULT 20,
    economy_capacity INTEGER DEFAULT 120,
    PRIMARY KEY (flight_id),
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Passenger (
    last_name VARCHAR(255) DEFAULT NULL,
    first_name VARCHAR(255) DEFAULT NULL,
    date_of_birth DATE DEFAULT NULL,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    boarding_pass_id INTEGER NOT NULL,
    num_luggage INTEGER DEFAULT 0,
    id_password VARCHAR(255) NOT NULL,
    PRIMARY KEY (passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Boarding_Pass (
	boarding_pass_id INTEGER NOT NULL,
    passenger_id INTEGER NOT NULL,
    class VARCHAR(8) DEFAULT 'Economy',
    board_group CHAR DEFAULT '3',
    PRIMARY KEY (boarding_pass_id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Luggage (
	luggage_id INTEGER NOT NULL,
    passenger_id INTEGER NOT NULL,
    weight FLOAT DEFAULT 50.0,
    PRIMARY KEY (luggage_id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
		ON DELETE CASCADE ON UPDATE CASCADE
);