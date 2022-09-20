/* Draw The Triangle 1 */
SET @number = 21;
SELECT REPEAT('* ', @number := @number - 1) 
FROM information_schema.tables;

/* Draw The Triangle 2 */
SET @number = 0;
SELECT REPEAT('* ', @number := @number + 1) 
FROM information_schema.tables LIMIT 20;