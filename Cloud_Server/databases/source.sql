/*FIRST TIME USE SQL SCRIPT*/

CREATE DATABASE BOAT_MONITOR;

USE BOAT_MONITOR;

CREATE TABLE JOURNEYS
{
    id INTEGER NOT NULL AUTO_INCREMENT,
    journey_start DATETIME NOT NULL,
    journey_end DATETIME NOT NULL,
    journey_text INT NOT NULL,
    journey_media INT NOT NULL,

    PRIMARY KEY(id)
}

CREATE TABLE HISTORICS
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    container_status TEXT NOT NULL, --'OPEN' OR 'CLOSED'
    container_weight FLOAT NOT NULL, --KG
    boat_location TEXT NOT NULL, --LAT, LONG? gOOGLE COMPATIBLE
    dt DATETIME NOT NULL,
    fl_name TEXT NOT NULL,
    reg DATETIME NOT NULL,
    journey_id INT NOT NULL,

    PRIMARY KEY(id),

    CONSTRAINT FK_JOURNEY
        FOREIGN KEY (journey_id) 
        REFERENCES JOURNEYS (id)
            ON DELETE CASCADE
);

CREATE TABLE FILES
{
    id INTEGER NOT NULL AUTO_INCREMENT,
    fl_name TEXT NOT NULL,
    fl_type TEXT NOT NULL,
    fl_path TEXT NOT NULL,
    fl_url TEXT NOT NULL,
    rl INT,
    dt DATETIME NOT NULL,
    reg DATETIME NOT NULL,
    journey_id INT NOT NULL,

    PRIMARY KEY(id),

    PRIMARY KEY(id),

    CONSTRAINT FK_JOURNEY
        FOREIGN KEY (journey_id) 
        REFERENCES JOURNEYS (id)
            ON DELETE CASCADE
}

CREATE USER 'orbittas'@'localhost' IDENTIFIED WITH mysql_native_password BY 'P4s5w0rd++';

GRANT ALL PRIVILEGES ON STREAMING_SERVER.* TO 'orbittas'@'localhost';

FLUSH PRIVILEGES;

SHOW VARIABLES LIKE 'validate_password%';
