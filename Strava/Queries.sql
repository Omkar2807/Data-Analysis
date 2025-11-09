
drop database Strava;
Create database Strava;
USE Strava;

-- 1️⃣ dailyActivity_merged
CREATE TABLE dailyActivity_merged (
  Id BIGINT,
  ActivityDate DATE,
  TotalSteps INT,
  TotalDistance FLOAT,
  TrackerDistance FLOAT,
  LoggedActivitiesDistance FLOAT,
  VeryActiveDistance FLOAT,
  ModeratelyActiveDistance FLOAT,
  LightActiveDistance FLOAT,
  SedentaryActiveDistance FLOAT,
  VeryActiveMinutes INT,
  FairlyActiveMinutes INT,
  LightlyActiveMinutes INT,
  SedentaryMinutes INT,
  Calories FLOAT
);
LOAD DATA INFILE 'C:/xampp/tmp/dailyActivity_merged.csv'
INTO TABLE dailyActivity_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 2️⃣ dailyCalories_merged
CREATE TABLE dailyCalories_merged (
  Id BIGINT,
  ActivityDay DATE,
  Calories FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/dailyCalories_merged.csv'
INTO TABLE dailyCalories_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 3️⃣ dailyIntensities_merged
CREATE TABLE dailyIntensities_merged (
  Id BIGINT,
  ActivityDay DATE,
  SedentaryMinutes INT,
  LightlyActiveMinutes INT,
  FairlyActiveMinutes INT,
  VeryActiveMinutes INT,
  SedentaryActiveDistance FLOAT,
  LightActiveDistance FLOAT,
  ModeratelyActiveDistance FLOAT,
  VeryActiveDistance FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/dailyIntensities_merged.csv'
INTO TABLE dailyIntensities_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 4️⃣ dailySteps_merged
CREATE TABLE dailySteps_merged (
  Id BIGINT,
  ActivityDay DATE,
  StepTotal INT
);
LOAD DATA INFILE 'C:/xampp/tmp/dailySteps_merged.csv'
INTO TABLE dailySteps_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 5️⃣ heartrate_seconds_merged
CREATE TABLE heartrate_seconds_merged (
  Id BIGINT,
  Time DATETIME,
  Value INT
);

LOAD DATA INFILE 'C:/xampp/tmp/heartrate_seconds_merged.csv'
INTO TABLE heartrate_seconds_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 6️⃣ hourlyCalories_merged
CREATE TABLE hourlyCalories_merged (
  Id BIGINT,
  ActivityHour DATETIME,
  Calories FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/hourlyCalories_merged.csv'
INTO TABLE hourlyCalories_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 7️⃣ hourlyIntensities_merged
CREATE TABLE hourlyIntensities_merged (
  Id BIGINT,
  ActivityHour DATETIME,
  TotalIntensity INT,
  AverageIntensity FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/hourlyIntensities_merged.csv'
INTO TABLE hourlyIntensities_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 8️⃣ hourlySteps_merged
CREATE TABLE hourlySteps_merged (
  Id BIGINT,
  ActivityHour DATETIME,
  StepTotal INT
);

LOAD DATA INFILE 'C:/xampp/tmp/hourlySteps_merged.csv'
INTO TABLE hourlySteps_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 9️⃣ minuteCaloriesNarrow_merged
CREATE TABLE minuteCaloriesNarrow_merged (
  Id BIGINT,
  ActivityMinute DATETIME,
  Calories FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteCaloriesNarrow_merged.csv'
INTO TABLE minuteCaloriesNarrow_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 🔟 minuteCaloriesWide_merged
CREATE TABLE minuteCaloriesWide_merged (
  Id BIGINT,
  ActivityHour DATETIME,
  Calories00 FLOAT, Calories01 FLOAT, Calories02 FLOAT, Calories03 FLOAT,
  Calories04 FLOAT, Calories05 FLOAT, Calories06 FLOAT, Calories07 FLOAT,
  Calories08 FLOAT, Calories09 FLOAT, Calories10 FLOAT, Calories11 FLOAT,
  Calories12 FLOAT, Calories13 FLOAT, Calories14 FLOAT, Calories15 FLOAT,
  Calories16 FLOAT, Calories17 FLOAT, Calories18 FLOAT, Calories19 FLOAT,
  Calories20 FLOAT, Calories21 FLOAT, Calories22 FLOAT, Calories23 FLOAT,
  Calories24 FLOAT, Calories25 FLOAT, Calories26 FLOAT, Calories27 FLOAT,
  Calories28 FLOAT, Calories29 FLOAT, Calories30 FLOAT, Calories31 FLOAT,
  Calories32 FLOAT, Calories33 FLOAT, Calories34 FLOAT, Calories35 FLOAT,
  Calories36 FLOAT, Calories37 FLOAT, Calories38 FLOAT, Calories39 FLOAT,
  Calories40 FLOAT, Calories41 FLOAT, Calories42 FLOAT, Calories43 FLOAT,
  Calories44 FLOAT, Calories45 FLOAT, Calories46 FLOAT, Calories47 FLOAT,
  Calories48 FLOAT, Calories49 FLOAT, Calories50 FLOAT, Calories51 FLOAT,
  Calories52 FLOAT, Calories53 FLOAT, Calories54 FLOAT, Calories55 FLOAT,
  Calories56 FLOAT, Calories57 FLOAT, Calories58 FLOAT, Calories59 FLOAT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteCaloriesWide_merged.csv'
INTO TABLE minuteCaloriesWide_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣1️⃣ minuteIntensitiesNarrow_merged
CREATE TABLE minuteIntensitiesNarrow_merged (
  Id BIGINT,
  ActivityMinute DATETIME,
  Intensity INT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteIntensitiesNarrow_merged.csv'
INTO TABLE minuteIntensitiesNarrow_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣2️⃣ minuteIntensitiesWide_merged
CREATE TABLE minuteIntensitiesWide_merged (
  Id BIGINT,
  ActivityHour DATETIME,
  Intensity00 INT, Intensity01 INT, Intensity02 INT, Intensity03 INT,
  Intensity04 INT, Intensity05 INT, Intensity06 INT, Intensity07 INT,
  Intensity08 INT, Intensity09 INT, Intensity10 INT, Intensity11 INT,
  Intensity12 INT, Intensity13 INT, Intensity14 INT, Intensity15 INT,
  Intensity16 INT, Intensity17 INT, Intensity18 INT, Intensity19 INT,
  Intensity20 INT, Intensity21 INT, Intensity22 INT, Intensity23 INT,
  Intensity24 INT, Intensity25 INT, Intensity26 INT, Intensity27 INT,
  Intensity28 INT, Intensity29 INT, Intensity30 INT, Intensity31 INT,
  Intensity32 INT, Intensity33 INT, Intensity34 INT, Intensity35 INT,
  Intensity36 INT, Intensity37 INT, Intensity38 INT, Intensity39 INT,
  Intensity40 INT, Intensity41 INT, Intensity42 INT, Intensity43 INT,
  Intensity44 INT, Intensity45 INT, Intensity46 INT, Intensity47 INT,
  Intensity48 INT, Intensity49 INT, Intensity50 INT, Intensity51 INT,
  Intensity52 INT, Intensity53 INT, Intensity54 INT, Intensity55 INT,
  Intensity56 INT, Intensity57 INT, Intensity58 INT, Intensity59 INT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteIntensitiesWide_merged.csv'
INTO TABLE minuteIntensitiesWide_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣3️⃣ minuteMETsNarrow_merged
CREATE TABLE minuteMETsNarrow_merged (
  Id BIGINT,
  ActivityMinute DATETIME,
  METs INT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteMETsNarrow_merged.csv'
INTO TABLE minuteMETsNarrow_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣4️⃣ minuteSleep_merged
CREATE TABLE minuteSleep_merged (
  Id BIGINT,
  date DATETIME,
  value INT,
  logId BIGINT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteSleep_merged.csv'
INTO TABLE minuteSleep_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣5️⃣ minuteStepsNarrow_merged
CREATE TABLE minuteStepsNarrow_merged (
  Id BIGINT,
  ActivityMinute DATETIME,
  Steps INT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteStepsNarrow_merged.csv'
INTO TABLE minuteStepsNarrow_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣6️⃣ minuteStepsWide_merged
CREATE TABLE minuteStepsWide_merged (
  Id BIGINT,
  ActivityHour DATETIME,
  Steps00 INT, Steps01 INT, Steps02 INT, Steps03 INT, Steps04 INT, Steps05 INT,
  Steps06 INT, Steps07 INT, Steps08 INT, Steps09 INT, Steps10 INT, Steps11 INT,
  Steps12 INT, Steps13 INT, Steps14 INT, Steps15 INT, Steps16 INT, Steps17 INT,
  Steps18 INT, Steps19 INT, Steps20 INT, Steps21 INT, Steps22 INT, Steps23 INT,
  Steps24 INT, Steps25 INT, Steps26 INT, Steps27 INT, Steps28 INT, Steps29 INT,
  Steps30 INT, Steps31 INT, Steps32 INT, Steps33 INT, Steps34 INT, Steps35 INT,
  Steps36 INT, Steps37 INT, Steps38 INT, Steps39 INT, Steps40 INT, Steps41 INT,
  Steps42 INT, Steps43 INT, Steps44 INT, Steps45 INT, Steps46 INT, Steps47 INT,
  Steps48 INT, Steps49 INT, Steps50 INT, Steps51 INT, Steps52 INT, Steps53 INT,
  Steps54 INT, Steps55 INT, Steps56 INT, Steps57 INT, Steps58 INT, Steps59 INT
);

LOAD DATA INFILE 'C:/xampp/tmp/minuteStepsWide_merged.csv'
INTO TABLE minuteStepsWide_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣7️⃣ sleepDay_merged
CREATE TABLE sleepDay_merged (
  Id BIGINT,
  SleepDay DATETIME,
  TotalSleepRecords INT,
  TotalMinutesAsleep INT,
  TotalTimeInBed INT
);

LOAD DATA INFILE 'C:/xampp/tmp/sleepDay_merged.csv'
INTO TABLE sleepDay_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- 1️⃣8️⃣ weightLogInfo_merged
CREATE TABLE weightLogInfo_merged (
  Id BIGINT,
  Date DATETIME,
  WeightKg FLOAT,
  WeightPounds FLOAT,
  Fat INT,
  BMI FLOAT,
  IsManualReport BOOLEAN,
  LogId BIGINT
);

LOAD DATA INFILE 'C:/xampp/tmp/weightLogInfo_merged.csv'
INTO TABLE weightLogInfo_merged
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

Select * from dailyActivity_merged;





