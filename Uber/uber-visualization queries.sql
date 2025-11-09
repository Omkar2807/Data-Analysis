CREATE DATABASE Uber_ride_analysis;
USE Uber_ride_analysis;

-- Create table matching your dataset
CREATE TABLE rides (
    Request_id INT PRIMARY KEY,
    Pickup_point VARCHAR(50),
    Driver_id INT,
    Status VARCHAR(50),
    Request_timestamp DATETIME,
    Drop_timestamp DATETIME,
    Request_Date DATE,
    Request_Time TIME,
    Trip_Duration_mins INT
);

desc rides;

LOAD DATA INFILE 'C:/xampp/tmp/rides.csv'
INTO TABLE rides
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Request_id, Pickup_point, Driver_id, Status, Request_timestamp, Drop_timestamp, Request_Date, Request_Time, Trip_Duration_mins);


select * from rides;


#Total Number of Rides
SELECT COUNT(*) AS Total_Rides
FROM rides;


#Top 5 Pickup Points by Number of Requests
SELECT Pickup_Point, COUNT(*) AS Total_Trips
FROM rides
GROUP BY Pickup_Point
ORDER BY Total_Trips DESC
LIMIT 5;


#Trip Status Distribution (Completed vs Cancelled)
SELECT 
    Status, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM rides), 2) AS Percentage
FROM rides
GROUP BY Status;


#Average Trip Duration per Pickup Point
SELECT Pickup_Point, ROUND(AVG(Trip_Duration_mins), 2) AS Avg_Duration
FROM rides
GROUP BY Pickup_Point
ORDER BY Avg_Duration DESC;


#Daily Request Volume
SELECT DATE(Request_Timestamp) AS Ride_Date, COUNT(*) AS Daily_Requests
FROM rides
GROUP BY DATE(Request_Timestamp)
ORDER BY Ride_Date;