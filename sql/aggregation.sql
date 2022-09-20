/* Average Population */
SELECT FLOOR(AVG(POPULATION)) FROM CITY;

/* Japan Population */
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE LIKE 'JPN';

/* Population Density Difference */
SELECT MAX(POPULATION)-MIN(POPULATION) FROM CITY;

/* The Blunder */
SELECT CEIL(AVG(salary) - AVG(replace(salary, '0', ''))) FROM EMPLOYEES;

/* Top Earners */
SELECT months*salary, count(*) FROM employee
GROUP BY months*salary
ORDER BY months*salary DESC
LIMIT 1;

/* Revising Aggregations - The Count Function */
SELECT COUNT(*) FROM CITY WHERE POPULATION > 100000;

/* Revising Aggregations - The Sum Function */
SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT LIKE 'California';

/* Revising Aggregations - Averages */
SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT LIKE 'California';

/* Weather Observation Station 2 */
SELECT ROUND(SUM(LAT_N),2),  ROUND(SUM(LONG_W),2) FROM STATION;

/* Weather Observation Station 13 */
SELECT TRUNCATE(SUM(LAT_N),4) FROM STATION 
WHERE LAT_N BETWEEN 38.7880 AND 137.2345; 

/* Weather Observation Station 14 */
SELECT TRUNCATE(MAX(LAT_N),4) FROM STATION WHERE LAT_N < 137.2345;

/* Weather Observation Station 15 */
SELECT ROUND(LONG_W,4) 
FROM STATION 
WHERE LAT_N = (
    SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345
);

/* Weather Observation Station 16 */
SELECT ROUND(LAT_N,4) FROM STATION 
WHERE LAT_N > 38.7780 ORDER BY LAT_N LIMIT 1;

/* Weather Observation Station 17 */
SELECT ROUND(LONG_W,4) FROM STATION 
WHERE LAT_N > 38.7780 ORDER BY LAT_N LIMIT 1;

/* Weather Observation Station 18 */
SELECT ROUND((MAX(LONG_W) - MIN(LONG_W)) + (MAX(LAT_N) - MIN(LAT_N)),4) 
FROM STATION;

/* Weather Observation Station 19 */
SELECT 
    TRUNCATE(
        SQRT(POWER((MAX(LONG_W) - MIN(LONG_W)),2) + POWER((MAX(LAT_N) - MIN(LAT_N)),2)),
        4
    ) 
FROM STATION;

/* Weather Observation Station 20 */
SELECT ROUND(S1.LAT_N, 4) 
FROM STATION AS S1 
WHERE (SELECT ROUND(COUNT(S1.ID)/2) - 1 
        FROM STATION) = 
    (SELECT COUNT(S2.ID) 
        FROM STATION AS S2 
        WHERE S2.LAT_N > S1.LAT_N);