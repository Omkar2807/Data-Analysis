CREATE DATABASE videogame_db;
USE videogame_db;

DROP TABLE games;
CREATE TABLE games (
    id INTEGER PRIMARY KEY ,
    title TEXT,
    release_date DATE,
    team TEXT,
    rating FLOAT,
    times_listed INTEGER,
    num_reviews INTEGER,
    genre TEXT,
    plays INTEGER,
    playing INTEGER,
    backlogs INTEGER,
    wishlist INTEGER
);

DROP TABLE vgsales;
CREATE TABLE vgsales (
    rank INTEGER PRIMARY KEY,
    name TEXT,
    platform TEXT,
    year INTEGER,
    genre TEXT,
    publisher TEXT,
    na_sales FLOAT,
    eu_sales FLOAT,
    jp_sales FLOAT,
    other_sales FLOAT,
    global_sales FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/cleaned_games.csv' 
INTO TABLE games 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS; 

LOAD DATA INFILE 'C:/xampp/tmp/cleaned_vgsales.csv' 
INTO TABLE vgsales 
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

select * from games;
select * from vgsales;