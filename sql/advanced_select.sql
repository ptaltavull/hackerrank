/* Type of Triangle */
SELECT
    CASE
        WHEN A + B <= C or A + C <= B or B + C <= A THEN 'Not A Triangle'
        WHEN A = B and B = C THEN 'Equilateral'
        WHEN A = B or A = C or B = C THEN 'Isosceles'
        WHEN A <> B and B <> C THEN 'Scalene'
    END type
FROM TRIANGLES;

/* The PADS */
SELECT CONCAT(NAME,"(",SUBSTR(OCCUPATION,1,1),")") FROM OCCUPATIONS ORDER BY NAME ASC;
SELECT CONCAT("There are a total of ",COUNT(OCCUPATION)," ",LOWER(OCCUPATION),"s.") FROM OCCUPATIONS GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION), OCCUPATION;

/* Occupations */
select
    Doctor,
    Professor,
    Singer,
    Actor
from (
    select
        NameOrder,
        max(case Occupation when 'Doctor' then Name end) as Doctor,
        max(case Occupation when 'Professor' then Name end) as Professor,
        max(case Occupation when 'Singer' then Name end) as Singer,
        max(case Occupation when 'Actor' then Name end) as Actor
    from (
            select
                Occupation,
                Name,
                row_number() over(partition by Occupation order by Name ASC) as NameOrder
            from Occupations
         ) as NameLists
    group by NameOrder
    ) as Names;

/* Binary Tree Nodes */
SELECT
    N,
    IF(
        P IS NULL, 'Root',
        IF(
            (SELECT COUNT(*) FROM BST WHERE P = B.N)> 0, 'Inner',
            'Leaf'
        )
    )
FROM BST AS B
ORDER BY N;

/* New Companies */
SELECT 
    Company.company_code, 
    Company.founder, 
    COUNT(DISTINCT Lead_manager.lead_manager_code),
    COUNT(DISTINCT Senior_manager.senior_manager_code),
    COUNT(DISTINCT Manager.manager_code),
    COUNT(DISTINCT Employee.employee_code)
FROM
    Company
    JOIN Lead_manager ON Company.company_code = Lead_manager.company_code
    JOIN Senior_manager ON Company.company_code = Senior_manager.company_code
    JOIN Manager ON Company.company_code = Manager.company_code
    JOIN Employee ON Company.company_code = Employee.company_code
GROUP BY
    Company.company_code,
    Company.founder
ORDER BY 
    Company.company_code;