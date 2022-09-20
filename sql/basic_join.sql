/* Population Census */
SELECT SUM(CITY.POPULATION) 
FROM CITY 
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT LIKE 'Asia';

/* African Cities */
SELECT city.name 
FROM CITY 
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT LIKE 'Africa';

/* Average Population of Each Continent */
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION))
FROM CITY 
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;

/* The Report */
SELECT 
    CASE 
        WHEN GRADES.grade < 8 THEN NULL 
        WHEN GRADES.grade >= 8 THEN STUDENTS.name END,
    GRADES.grade, 
    STUDENTS.marks 
FROM 
    STUDENTS, 
    GRADES
WHERE 
    STUDENTS.marks BETWEEN GRADES.min_mark 
    AND GRADES.max_mark
ORDER BY GRADES.grade DESC, STUDENTS.name ASC;

/* Top Competitors */
SELECT
    Submissions.hacker_id,
    Hackers.name
FROM 
    Submissions
    JOIN Hackers ON Submissions.hacker_id = Hackers.hacker_id
    JOIN Challenges ON Submissions.challenge_id = Challenges.challenge_id
    JOIN Difficulty ON Challenges.difficulty_level = Difficulty.difficulty_level
WHERE
    Submissions.score = Difficulty.score
GROUP BY 
    Submissions.hacker_id,
    Hackers.name
HAVING 
    COUNT(Submissions.challenge_id) > 1
ORDER BY 
    COUNT(Submissions.challenge_id) DESC,
    Submissions.hacker_id;

/* Ollivander's Inventory */
SELECT
    Wands.id, Wands_Property.age, Wands.coins_needed, Wands.power
FROM
    Wands 
    JOIN Wands_Property ON Wands.code = Wands_property.code
WHERE
    Wands.coins_needed = (
        select min(coins_needed)
        from Wands w2 inner join Wands_Property p2 
        on w2.code = p2.code 
        where p2.is_evil = 0 and Wands_Property.age = p2.age and Wands.power = w2.power)
ORDER BY
    Wands.power DESC, Wands_Property.age DESC;

/* Challenges */
SELECT c.hacker_id, h.name, count(c.challenge_id) AS cnt 
FROM Hackers AS h JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name 
HAVING cnt = (SELECT count(c1.challenge_id) FROM Challenges AS c1 GROUP BY c1.hacker_id 
              ORDER BY count(*) desc limit 1) or
cnt NOT IN (SELECT count(c2.challenge_id) FROM Challenges AS c2 GROUP BY c2.hacker_id 
            HAVING c2.hacker_id <> c.hacker_id)
ORDER BY cnt DESC, c.hacker_id;