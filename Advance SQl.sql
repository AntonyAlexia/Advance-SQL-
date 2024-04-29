--1. I need total Population in zipcode 94085 (Sunnyvale CA)

SELECT SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085';
 --2. I need number of Male and Female head count in zipcode 94085 (Sunnyvale CA)
SELECT SUM(CASE WHEN gender = 'male' THEN population ELSE 0 END) AS male_population,
       SUM(CASE WHEN gender = 'female' THEN population ELSE 0 END) AS female_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085';

--3. I want which Age group has max headcount for both male and female genders combine (zipcode 94085 (Sunnyvale CA))
SELECT minimum_age, maximum_age,
       SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085'
  AND minimum_age IS NOT NULL
  AND maximum_age IS NOT NULL
GROUP BY minimum_age, maximum_age
ORDER BY total_population DESC
LIMIT 1;

--4. I want age group for male gender which has max male population zipcode 94085 (Sunnyvale CA))
SELECT minimum_age, maximum_age,
       SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085'
  AND minimum_age IS NOT NULL
  AND maximum_age IS NOT NULL
GROUP BY minimum_age, maximum_age
ORDER BY total_population DESC
LIMIT 1;

--5. I want age group for female gender which has max male population zipcode 94085 (Sunnyvale CA))
SELECT minimum_age, maximum_age
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE zipcode = '94085' AND gender = 'female'
  AND minimum_age IS NOT NULL
  AND maximum_age IS NOT NULL
ORDER BY population DESC
LIMIT 1;

--6. I want zipcode which has highest male and female population in USA
SELECT zipcode, gender, SUM(population) AS total_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY zipcode, gender
ORDER BY total_population DESC
LIMIT 1;

--7. I want first five age groups which has highest male and female population in USA
SELECT zipcode, SUM(CASE WHEN gender = 'female' THEN population ELSE 0 END) AS female_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY zipcode
ORDER BY female_population DESC
LIMIT 5;

--8. I want first five zipcodes which has highest female population in entire USA
SELECT zipcode, SUM(CASE WHEN gender = 'female' THEN population ELSE 0 END) AS female_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
GROUP BY zipcode
ORDER BY female_population DESC
LIMIT 5;

--9. I want first 10 which has lowest male population in entire USA
SELECT zipcode, SUM(population) AS male_population
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010`
WHERE gender = 'male'
GROUP BY zipcode
ORDER BY male_population ASC
LIMIT 10;

