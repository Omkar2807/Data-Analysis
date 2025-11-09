USE tennis_analytics;
-- --------------------------------------Data Analysis-----------------------------------------
# 1. Competitions Table Queries
-- a List all competitions with their category name
SELECT c.competition_name, cat.category_name
FROM Competitions c
JOIN Categories cat ON c.category_id = cat.category_id;

-- b Count how many competitions belong to each category
SELECT category_id, COUNT(*) AS total_competitions
FROM Competitions
GROUP BY category_id;

-- c Get all competitions of type 'doubles'
SELECT *
FROM Competitions
WHERE type = 'doubles';

-- d Get all competitions under a specific category (example: ITF Men)
SELECT *
FROM Competitions
WHERE category_id = 'ITF Men';

-- e Count competitions grouped by their parent_id
SELECT parent_id, COUNT(*) AS total
FROM Competitions
GROUP BY parent_id;

-- f Count competitions grouped by category and type
SELECT category_id, type, COUNT(*) AS total
FROM Competitions
GROUP BY category_id, type;

-- g Find competitions that do not have a parent competition
SELECT *
FROM Competitions
WHERE parent_id IS NULL;

# 2. Venues Table Analysis------------------------------------------
-- a List venues with their complex names
SELECT v.venue_name, c.complex_name
FROM Venues v
JOIN Complexes c ON v.complex_id = c.complex_id;

-- b Count number of venues in each complex
SELECT complex_id, COUNT(*) AS total_venues
FROM Venues
GROUP BY complex_id;

-- c Find venues located in Chile
SELECT *
FROM Venues
WHERE country_name = 'Chile';

-- d List venue names with their timezones
SELECT venue_name, timezone
FROM Venues;

-- e Show complex IDs that have more than one venue
SELECT complex_id
FROM Venues
GROUP BY complex_id
HAVING COUNT(*) > 1;

-- f Count number of venues per country
SELECT country_name, COUNT(*) AS total_venues
FROM Venues
GROUP BY country_name;

-- g Find venues that belong to a specific complex (example: Nacional)
SELECT *
FROM Venues
WHERE complex_id = 'Nacional';


# 3. Competitor Rankings Analysis---------------------------------------------
-- a Show competitor name, rank, and points
SELECT c.name, r.rank, r.points
FROM Competitors c
JOIN Competitor_Rankings r ON c.competitor_id = r.competitor_id;

-- b Show top 5 ranked competitors
SELECT *
FROM Competitor_Rankings
ORDER BY rank ASC
LIMIT 5;

-- c Show competitors whose movement is 0 (no change in rank)
SELECT *
FROM Competitor_Rankings
WHERE movement = 0;

-- d Show total points by country (example: Croatia)
SELECT c.country, SUM(r.points) AS total_points
FROM Competitors c
JOIN Competitor_Rankings r ON c.competitor_id = r.competitor_id
WHERE c.country = 'Croatia'
GROUP BY c.country;

-- e Count how many competitors belong to each country
SELECT c.country, COUNT(*) AS total_competitors
FROM Competitors c
GROUP BY c.country;

-- f Show the competitor with the highest points
SELECT c.name, r.points
FROM Competitors c
JOIN Competitor_Rankings r ON c.competitor_id = r.competitor_id
ORDER BY r.points DESC
LIMIT 1;
