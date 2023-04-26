CREATE TABLE IF NOT EXISTS prof_rat(
    professor character varying(50),
    subject character varying(50),
    quality double precision,
    would_take_again character varying(50),
    difficulty double precision,
    number_of_ratings character varying(50),
);

UPDATE prof_rat
SET would_take_again=  RTRIM(would_take_again, '%');

ALTER TABLE prof_rat
ALTER COLUMN would_take_again  TYPE integer USING would_take_again:: integer;


ALTER TABLE prof_rat
ADD COLUMN college TEXT ;

UPDATE prof_rat
SET college =
CASE
   WHEN (subject LIKE '%Business%'
       OR subject LIKE '%Finance%'
       OR subject LIKE '%Accounting%'
       OR subject LIKE '%International%'
		OR subject LIKE '%Marketing%'
		OR subject LIKE '%Hospitality%')
   THEN 'Business'
   
    WHEN (subject LIKE '%Engineer%'
       OR subject LIKE '%Aerospace%'
	   OR subject LIKE '%Aviation%'
	   OR subject LIKE '%Technology%')
   THEN 'Engineering'
   
   WHEN (subject LIKE '%Health%'
   		OR subject LIKE '%Nutrition%'
		OR subject LIKE '%Nursing%'
		OR subject LIKE '%Occupational Therapy%'
		OR subject LIKE '%Kinesiology%'
		OR subject LIKE '%Physical%')
		  THEN 'Health and Human Sciences'
 
   WHEN (subject LIKE '%Education%'
		OR subject LIKE '%Child%')
   THEN 'Education'
 
   WHEN (subject LIKE '%Art%'
   OR subject LIKE '%Photography%'
   OR subject LIKE '%French%'
   OR subject LIKE '%German%'
   OR subject LIKE '%Japan%'
   OR subject LIKE '%Italian%'
   OR subject LIKE '%Music%'
   OR subject LIKE '%Spanish%'
   OR subject LIKE '%Vietnam%'
   OR subject LIKE '%Theat%'
   OR subject LIKE '%Dance%'
   OR subject LIKE '%English%'
   OR subject LIKE '%Chinese%'
   OR subject LIKE '%Liberal%'
   OR subject LIKE '%Philo%'
   OR subject LIKE '%Religio%'
   OR subject LIKE '%America%'
   OR subject LIKE '%Film%'
   OR subject LIKE '%Linguistics%'
   OR subject LIKE '%Languages'
   OR subject LIKE '%Humanities%'
   )
   THEN 'Humanities and Art'
 
   WHEN (subject LIKE '%Math%'
   OR subject LIKE '%Physics%'
   OR subject LIKE '%Biology%'
   OR subject LIKE '%Chemistry%'
   OR subject LIKE '%Computer Science%'
   OR subject LIKE '%Meteo%'
	OR subject LIKE '%Astro%')
   THEN 'Science'
 
   WHEN (subject LIKE '%Studies%'
   		OR subject LIKE '%Planning%'
		OR subject LIKE '%Geo%'
		OR subject LIKE '%Economics%'
		OR subject LIKE '%Soci%'
		OR subject LIKE '%Psychology%'
		OR subject LIKE '%Political%'
		OR subject LIKE '%Anthropology%'
		OR subject LIKE '%Communication%'
		OR subject LIKE '%Journalism%'
		OR subject LIKE '%History%')
   THEN 'Social Science'

 END;
		
DELETE FROM prof_rat
WHERE ratings= '0 ratings';

--SELECT professor FROM prof_rat
--WHERE would_take_again ='N/A';
--how would you like to impute data?


UPDATE prof_rat
SET number_of_ratings = SUBSTRING(ratings, 1, 2);

ALTER TABLE prof_rat
ALTER COLUMN number_of_ratings  TYPE integer USING number_of_ratings:: integer;

INSERT INTO prof_rat (number_of_ratings)
SELECT ratings,
CONCAT (SUBSTRING (ratings, 1, 2)) AS number_of_ratings
FROM prof_rat;

ALTER TABLE prof_rat
DROP COLUMN ratings;


UPDATE prof_rat
SET would_take_again = null
WHERE would_take_again = 'N/A';






 



