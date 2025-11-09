Create database stock_price;

use stock_price;


-- 1. -- BAJAJ AUTO
CREATE TABLE bajaj_auto (
    Date DATE,
    Open_Price DECIMAL(10,2),
    High_Price DECIMAL(10,2),
    Low_Price DECIMAL(10,2),
    Close_Price DECIMAL(10,2),
    WAP DECIMAL(15,8),
    No_of_Shares INT,
    No_of_Trades INT,
    Total_Turnover_Rs BIGINT,
    Deliverable_Quantity INT,
    Percent_Deli_Qty_to_Traded_Qty DECIMAL(5,2),
    Spread_High_Low DECIMAL(10,2),
    Spread_Close_Open DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE 'C:/xampp/tmp/Bajaj_Auto.csv'
INTO TABLE bajaj_auto
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- EICHER MOTORS
CREATE TABLE eicher_motors (
    Date DATE,
    Open_Price DECIMAL(10,2),
    High_Price DECIMAL(10,2),
    Low_Price DECIMAL(10,2),
    Close_Price DECIMAL(10,2),
    WAP DECIMAL(15,8),
    No_of_Shares INT,
    No_of_Trades INT,
    Total_Turnover_Rs BIGINT,
    Deliverable_Quantity INT,
    Percent_Deli_Qty_to_Traded_Qty DECIMAL(5,2),
    Spread_High_Low DECIMAL(10,2),
    Spread_Close_Open DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/xampp/tmp/Eicher_Motors.csv'
INTO TABLE eicher_motors
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- HERO MOTOCORP
CREATE TABLE hero_motocorp (
    Date DATE,
    Open_Price DECIMAL(10,2),
    High_Price DECIMAL(10,2),
    Low_Price DECIMAL(10,2),
    Close_Price DECIMAL(10,2),
    WAP DECIMAL(15,8),
    No_of_Shares INT,
    No_of_Trades INT,
    Total_Turnover_Rs BIGINT,
    Deliverable_Quantity INT,
    Percent_Deli_Qty_to_Traded_Qty DECIMAL(5,2),
    Spread_High_Low DECIMAL(10,2),
    Spread_Close_Open DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/xampp/tmp/Hero_Motocorp.csv'
INTO TABLE hero_motocorp
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- INFOSYS
CREATE TABLE infosys (
    Date DATE,
    Open_Price DECIMAL(10,2),
    High_Price DECIMAL(10,2),
    Low_Price DECIMAL(10,2),
    Close_Price DECIMAL(10,2),
    WAP DECIMAL(15,8),
    No_of_Shares BIGINT,
    No_of_Trades INT,
    Total_Turnover_Rs BIGINT,
    Deliverable_Quantity BIGINT,
    Percent_Deli_Qty_to_Traded_Qty DECIMAL(5,2),
    Spread_High_Low DECIMAL(10,2),
    Spread_Close_Open DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/xampp/tmp/Infosys.csv'
INTO TABLE infosys
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- TCS
CREATE TABLE tcs (
    Date DATE,
    Open_Price DECIMAL(10,2),
    High_Price DECIMAL(10,2),
    Low_Price DECIMAL(10,2),
    Close_Price DECIMAL(10,2),
    WAP DECIMAL(15,8),
    No_of_Shares INT,
    No_of_Trades INT,
    Total_Turnover_Rs BIGINT,
    Deliverable_Quantity INT,
    Percent_Deli_Qty_to_Traded_Qty DECIMAL(5,2),
    Spread_High_Low DECIMAL(10,2),
    Spread_Close_Open DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/xampp/tmp/TCS.csv'
INTO TABLE tcs
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- TVS MOTORS
CREATE TABLE tvs_motors (
    Date DATE,
    Open_Price DECIMAL(10,2),
    High_Price DECIMAL(10,2),
    Low_Price DECIMAL(10,2),
    Close_Price DECIMAL(10,2),
    WAP DECIMAL(15,8),
    No_of_Shares INT,
    No_of_Trades INT,
    Total_Turnover_Rs BIGINT,
    Deliverable_Quantity INT,
    Percent_Deli_Qty_to_Traded_Qty DECIMAL(5,2),
    Spread_High_Low DECIMAL(10,2),
    Spread_Close_Open DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/xampp/tmp/TVS_Motors.csv'
INTO TABLE tvs_motors
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



/*-- CHECK MISSING VALUES----------------------------------------------------------------------
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Open_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Open_Price,
    SUM(CASE WHEN High_Price IS NULL THEN 1 ELSE 0 END) AS Missing_High_Price,
    SUM(CASE WHEN Low_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Low_Price,
    SUM(CASE WHEN Close_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Close_Price,
    SUM(CASE WHEN WAP IS NULL THEN 1 ELSE 0 END) AS Missing_WAP,
    SUM(CASE WHEN No_of_Shares IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Shares,
    SUM(CASE WHEN No_of_Trades IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Trades,
    SUM(CASE WHEN Total_Turnover_Rs IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Turnover,
    SUM(CASE WHEN Deliverable_Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Deliverable_Quantity,
    SUM(CASE WHEN Percent_Deli_Qty_to_Traded_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Percent_Delivery,
    SUM(CASE WHEN Spread_High_Low IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_High_Low,
    SUM(CASE WHEN Spread_Close_Open IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_Close_Open
FROM bajaj_auto;

-- EICHER MOTORS
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Open_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Open_Price,
    SUM(CASE WHEN High_Price IS NULL THEN 1 ELSE 0 END) AS Missing_High_Price,
    SUM(CASE WHEN Low_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Low_Price,
    SUM(CASE WHEN Close_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Close_Price,
    SUM(CASE WHEN WAP IS NULL THEN 1 ELSE 0 END) AS Missing_WAP,
    SUM(CASE WHEN No_of_Shares IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Shares,
    SUM(CASE WHEN No_of_Trades IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Trades,
    SUM(CASE WHEN Total_Turnover_Rs IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Turnover,
    SUM(CASE WHEN Deliverable_Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Deliverable_Quantity,
    SUM(CASE WHEN Percent_Deli_Qty_to_Traded_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Percent_Delivery,
    SUM(CASE WHEN Spread_High_Low IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_High_Low,
    SUM(CASE WHEN Spread_Close_Open IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_Close_Open
FROM eicher_motors;


-- HERO MOTOCORP
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Open_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Open_Price,
    SUM(CASE WHEN High_Price IS NULL THEN 1 ELSE 0 END) AS Missing_High_Price,
    SUM(CASE WHEN Low_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Low_Price,
    SUM(CASE WHEN Close_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Close_Price,
    SUM(CASE WHEN WAP IS NULL THEN 1 ELSE 0 END) AS Missing_WAP,
    SUM(CASE WHEN No_of_Shares IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Shares,
    SUM(CASE WHEN No_of_Trades IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Trades,
    SUM(CASE WHEN Total_Turnover_Rs IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Turnover,
    SUM(CASE WHEN Deliverable_Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Deliverable_Quantity,
    SUM(CASE WHEN Percent_Deli_Qty_to_Traded_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Percent_Delivery,
    SUM(CASE WHEN Spread_High_Low IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_High_Low,
    SUM(CASE WHEN Spread_Close_Open IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_Close_Open
FROM hero_motocorp;

-- INFOSYS
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Open_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Open_Price,
    SUM(CASE WHEN High_Price IS NULL THEN 1 ELSE 0 END) AS Missing_High_Price,
    SUM(CASE WHEN Low_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Low_Price,
    SUM(CASE WHEN Close_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Close_Price,
    SUM(CASE WHEN WAP IS NULL THEN 1 ELSE 0 END) AS Missing_WAP,
    SUM(CASE WHEN No_of_Shares IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Shares,
    SUM(CASE WHEN No_of_Trades IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Trades,
    SUM(CASE WHEN Total_Turnover_Rs IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Turnover,
    SUM(CASE WHEN Deliverable_Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Deliverable_Quantity,
    SUM(CASE WHEN Percent_Deli_Qty_to_Traded_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Percent_Delivery,
    SUM(CASE WHEN Spread_High_Low IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_High_Low,
    SUM(CASE WHEN Spread_Close_Open IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_Close_Open
FROM infosys;

-- TCS
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Open_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Open_Price,
    SUM(CASE WHEN High_Price IS NULL THEN 1 ELSE 0 END) AS Missing_High_Price,
    SUM(CASE WHEN Low_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Low_Price,
    SUM(CASE WHEN Close_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Close_Price,
    SUM(CASE WHEN WAP IS NULL THEN 1 ELSE 0 END) AS Missing_WAP,
    SUM(CASE WHEN No_of_Shares IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Shares,
    SUM(CASE WHEN No_of_Trades IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Trades,
    SUM(CASE WHEN Total_Turnover_Rs IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Turnover,
    SUM(CASE WHEN Deliverable_Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Deliverable_Quantity,
    SUM(CASE WHEN Percent_Deli_Qty_to_Traded_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Percent_Delivery,
    SUM(CASE WHEN Spread_High_Low IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_High_Low,
    SUM(CASE WHEN Spread_Close_Open IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_Close_Open
FROM tcs;

-- TVS MOTORS
SELECT 
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Open_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Open_Price,
    SUM(CASE WHEN High_Price IS NULL THEN 1 ELSE 0 END) AS Missing_High_Price,
    SUM(CASE WHEN Low_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Low_Price,
    SUM(CASE WHEN Close_Price IS NULL THEN 1 ELSE 0 END) AS Missing_Close_Price,
    SUM(CASE WHEN WAP IS NULL THEN 1 ELSE 0 END) AS Missing_WAP,
    SUM(CASE WHEN No_of_Shares IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Shares,
    SUM(CASE WHEN No_of_Trades IS NULL THEN 1 ELSE 0 END) AS Missing_No_of_Trades,
    SUM(CASE WHEN Total_Turnover_Rs IS NULL THEN 1 ELSE 0 END) AS Missing_Total_Turnover,
    SUM(CASE WHEN Deliverable_Quantity IS NULL THEN 1 ELSE 0 END) AS Missing_Deliverable_Quantity,
    SUM(CASE WHEN Percent_Deli_Qty_to_Traded_Qty IS NULL THEN 1 ELSE 0 END) AS Missing_Percent_Delivery,
    SUM(CASE WHEN Spread_High_Low IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_High_Low,
    SUM(CASE WHEN Spread_Close_Open IS NULL THEN 1 ELSE 0 END) AS Missing_Spread_Close_Open
FROM tvs_motors;*/


-- Part 3: SQL Queries
-- 1. Trend Analysis
SELECT 'Bajaj Auto' AS Stock_Name, ( (MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price) ) * 100 AS Percentage_Change FROM bajaj_auto
UNION ALL
SELECT 'Eicher Motors', ( (MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price) ) * 100 FROM eicher_motors
UNION ALL
SELECT 'Hero Motocorp', ( (MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price) ) * 100 FROM hero_motocorp
UNION ALL
SELECT 'Infosys', ( (MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price) ) * 100 FROM infosys
UNION ALL
SELECT 'TCS', ( (MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price) ) * 100 FROM tcs
UNION ALL
SELECT 'TVS Motors', ( (MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price) ) * 100 FROM tvs_motors;

-- 2. Buy and Sell Signals
SELECT 
    Date,
    Close_Price,
    CASE
        WHEN Close_Price > (SELECT AVG(Close_Price) FROM bajaj_auto WHERE Date <= p.Date) THEN 'BUY'
        WHEN Close_Price < (SELECT AVG(Close_Price) FROM bajaj_auto WHERE Date <= p.Date) THEN 'SELL'
    END AS `Signal`
FROM bajaj_auto p;

SELECT 
    Date,
    Close_Price,
    CASE
        WHEN Close_Price > (SELECT AVG(Close_Price) FROM eicher_motors WHERE Date <= p.Date) THEN 'BUY'
        WHEN Close_Price < (SELECT AVG(Close_Price) FROM eicher_motors WHERE Date <= p.Date) THEN 'SELL'
    END AS `Signal`
FROM eicher_motors p;

SELECT 
    Date,
    Close_Price,
    CASE
        WHEN Close_Price > (SELECT AVG(Close_Price) FROM hero_motocorp WHERE Date <= p.Date) THEN 'BUY'
        WHEN Close_Price < (SELECT AVG(Close_Price) FROM hero_motocorp WHERE Date <= p.Date) THEN 'SELL'
    END AS `Signal`
FROM hero_motocorp p;

SELECT 
    Date,
    Close_Price,
    CASE
        WHEN Close_Price > (SELECT AVG(Close_Price) FROM infosys WHERE Date <= p.Date) THEN 'BUY'
        WHEN Close_Price < (SELECT AVG(Close_Price) FROM infosys WHERE Date <= p.Date) THEN 'SELL'
    END AS `Signal`
FROM infosys p;

SELECT 
    Date,
    Close_Price,
    CASE
        WHEN Close_Price > (SELECT AVG(Close_Price) FROM tcs WHERE Date <= p.Date) THEN 'BUY'
        WHEN Close_Price < (SELECT AVG(Close_Price) FROM tcs WHERE Date <= p.Date) THEN 'SELL'
    END AS `Signal`
FROM tcs p;

SELECT 
    Date,
    Close_Price,
    CASE
        WHEN Close_Price > (SELECT AVG(Close_Price) FROM tvs_motors WHERE Date <= p.Date) THEN 'BUY'
        WHEN Close_Price < (SELECT AVG(Close_Price) FROM tvs_motors WHERE Date <= p.Date) THEN 'SELL'
    END AS `Signal`
FROM tvs_motors p;

-- Count of Buy/Sell
SELECT `Signal`, COUNT(*) AS Total_Signals FROM (
    SELECT Date,Close_Price,
        CASE
			WHEN Close_Price > (SELECT AVG(Close_Price) FROM bajaj_auto WHERE Date <= p.Date) THEN 'BUY'
			WHEN Close_Price < (SELECT AVG(Close_Price) FROM bajaj_auto WHERE Date <= p.Date) THEN 'SELL'
		END AS `Signal`
	FROM bajaj_auto p) AS signals_summary GROUP BY `Signal`;
    
SELECT `Signal`, COUNT(*) AS Total_Signals FROM (
    SELECT Date,Close_Price,
        CASE
			WHEN Close_Price > (SELECT AVG(Close_Price) FROM eicher_motors WHERE Date <= p.Date) THEN 'BUY'
			WHEN Close_Price < (SELECT AVG(Close_Price) FROM eicher_motors WHERE Date <= p.Date) THEN 'SELL'
		END AS `Signal`
	FROM eicher_motors p) AS signals_summary GROUP BY `Signal`;


SELECT `Signal`, COUNT(*) AS Total_Signals FROM (
    SELECT Date,Close_Price,
        CASE
			WHEN Close_Price > (SELECT AVG(Close_Price) FROM hero_motocorp WHERE Date <= p.Date) THEN 'BUY'
			WHEN Close_Price < (SELECT AVG(Close_Price) FROM hero_motocorp WHERE Date <= p.Date) THEN 'SELL'
		END AS `Signal`
	FROM hero_motocorp p) AS signals_summary GROUP BY `Signal`;


SELECT `Signal`, COUNT(*) AS Total_Signals FROM (
    SELECT Date,Close_Price,
        CASE
			WHEN Close_Price > (SELECT AVG(Close_Price) FROM infosys WHERE Date <= p.Date) THEN 'BUY'
			WHEN Close_Price < (SELECT AVG(Close_Price) FROM infosys WHERE Date <= p.Date) THEN 'SELL'
		END AS `Signal`
	FROM infosys p) AS signals_summary GROUP BY `Signal`;


SELECT `Signal`, COUNT(*) AS Total_Signals FROM (
    SELECT Date,Close_Price,
        CASE
			WHEN Close_Price > (SELECT AVG(Close_Price) FROM tcs WHERE Date <= p.Date) THEN 'BUY'
			WHEN Close_Price < (SELECT AVG(Close_Price) FROM tcs WHERE Date <= p.Date) THEN 'SELL'
		END AS `Signal`
	FROM tcs p) AS signals_summary GROUP BY `Signal`;

SELECT `Signal`, COUNT(*) AS Total_Signals FROM (
    SELECT Date,Close_Price,
        CASE
			WHEN Close_Price > (SELECT AVG(Close_Price) FROM tvs_motors WHERE Date <= p.Date) THEN 'BUY'
			WHEN Close_Price < (SELECT AVG(Close_Price) FROM tvs_motors WHERE Date <= p.Date) THEN 'SELL'
		END AS `Signal` FROM tvs_motors p ) AS signals_summary GROUP BY `Signal`;


-- 3. Maximum and Minimum Stock Price----------------------------------------------
SELECT 'Bajaj Auto' AS Stock_Name, MAX(Close_Price) AS Max_Price, MIN(Close_Price) AS Min_Price FROM bajaj_auto
UNION ALL
SELECT 'Eicher Motors', MAX(Close_Price), MIN(Close_Price) FROM eicher_motors
UNION ALL
SELECT 'Hero MotoCorp', MAX(Close_Price), MIN(Close_Price) FROM hero_motocorp
UNION ALL
SELECT 'Infosys', MAX(Close_Price), MIN(Close_Price) FROM infosys
UNION ALL
SELECT 'TCS', MAX(Close_Price), MIN(Close_Price) FROM tcs
UNION ALL
SELECT 'TVS Motors', MAX(Close_Price), MIN(Close_Price) FROM tvs_motors;


-- 4. Number of Buy/Sell Opportunities----------------------------------------------

SELECT 'Bajaj Auto' AS Stock_Name, 
COUNT(*) AS Buy_Opportunities, 
(SELECT COUNT(*) FROM bajaj_auto WHERE Close_Price = (SELECT MAX(Close_Price) FROM bajaj_auto)) AS Sell_Opportunities
FROM bajaj_auto WHERE Close_Price = (SELECT MIN(Close_Price) FROM bajaj_auto)

UNION ALL
SELECT 'Eicher Motors', 
COUNT(*), 
(SELECT COUNT(*) FROM eicher_motors WHERE Close_Price = (SELECT MAX(Close_Price) FROM eicher_motors))
FROM eicher_motors WHERE Close_Price = (SELECT MIN(Close_Price) FROM eicher_motors)

UNION ALL
SELECT 'Hero MotoCorp', 
COUNT(*), 
(SELECT COUNT(*) FROM hero_motocorp WHERE Close_Price = (SELECT MAX(Close_Price) FROM hero_motocorp))
FROM hero_motocorp WHERE Close_Price = (SELECT MIN(Close_Price) FROM hero_motocorp)

UNION ALL
SELECT 'Infosys', 
COUNT(*), 
(SELECT COUNT(*) FROM infosys WHERE Close_Price = (SELECT MAX(Close_Price) FROM infosys))
FROM infosys WHERE Close_Price = (SELECT MIN(Close_Price) FROM infosys)

UNION ALL
SELECT 'TCS', 
COUNT(*), 
(SELECT COUNT(*) FROM tcs WHERE Close_Price = (SELECT MAX(Close_Price) FROM tcs))
FROM tcs WHERE Close_Price = (SELECT MIN(Close_Price) FROM tcs)

UNION ALL
SELECT 'TVS Motors', 
COUNT(*), 
(SELECT COUNT(*) FROM tvs_motors WHERE Close_Price = (SELECT MAX(Close_Price) FROM tvs_motors))
FROM tvs_motors WHERE Close_Price = (SELECT MIN(Close_Price) FROM tvs_motors);

-- 5. Percentage Change Analysis----------------------------------------------------------------
SELECT 'Bajaj Auto' AS Stock_Name, ((MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price)) * 100 AS Percent_Change FROM bajaj_auto
UNION ALL
SELECT 'Eicher Motors', ((MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price)) * 100 FROM eicher_motors
UNION ALL
SELECT 'Hero MotoCorp', ((MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price)) * 100 FROM hero_motocorp
UNION ALL
SELECT 'Infosys', ((MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price)) * 100 FROM infosys
UNION ALL
SELECT 'TCS', ((MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price)) * 100 FROM tcs
UNION ALL
SELECT 'TVS Motors', ((MAX(Close_Price) - MIN(Close_Price)) / MIN(Close_Price)) * 100 FROM tvs_motors;

-- Part 4: Report and Insights
-- Trend Analysis Summary:

