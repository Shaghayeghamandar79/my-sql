-- Data cleaning

SELECT *
FROM `layoffs (1)`;


-- 1. Remove Duplicates
-- 2. Standardardize the Data
-- 3. Null values or blank values
-- 4. Remove Any Columns



CREATE TABLE layoffs_staging
LIKE `layoffs (1)`;

SELECT *
FROM layoffs_staging;

insert layoffs_staging
select *
From `layoffs (1)`;


select * , 
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
From layoffs_staging;


WITH duplicate_cte AS 
(
select * , 
ROW_NUMBER() OVER(
PARTITION BY company, industry, 
location , total_laid_off, percentage_laid_off, `date`, stage,
country , funds_raised_millions) AS row_num
From layoffs_staging
)
select *
From duplicate_cte
where row_num>1;


SELECT *
FROM layoffs_staging
where company ='Casper';





WITH duplicate_cte AS 
(
select * , 
ROW_NUMBER() OVER(
PARTITION BY company, industry, 
location , total_laid_off, percentage_laid_off, `date`, stage,
country , funds_raised_millions) AS row_num
From layoffs_staging
)
delete
From duplicate_cte
where row_num>1;


CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






SELECT *
FROM layoffs_staging3
WHERE row_num> 1;


INSERT INTO layoffs_staging3
select * , 
ROW_NUMBER() OVER(
PARTITION BY company, industry, 
location , total_laid_off, percentage_laid_off, `date`, stage,
country , funds_raised_millions) AS row_num
From layoffs_staging;




delete 
FROM layoffs_staging3
WHERE row_num> 1;




-- 2. Standardardize the Data
SELECT  company , TRIM(company)
FROM layoffs_staging3;



update layoffs_staging3
SET company = TRIM(company);

SELECT distinct industry
FROM layoffs_staging3
ORDER BY 1;

SELECT *
FROM layoffs_staging3
where industry LIKE 'Crypto%';


UPDATE layoffs_staging3
SET industry= 'Crypto'
where industry LIKE 'Crypto%';


SELECT distinct industry
FROM layoffs_staging3;

SELECT distinct country
FROM layoffs_staging3
ORDER BY 1;

SELECT *
FROM layoffs_staging3
where country LIKE 'United States%';



SELECT DISTINCT country , TRIM(TRAILING '.' FROM country)
FROM layoffs_staging3
ORDER by 1;



update layoffs_staging3
SET country = TRIM(TRAILING '.' FROM country)
where country LIKE 'United States%';

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoffs_staging3;

UPDATE layoffs_staging3
set `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

SELECT *
FROM layoffs_staging3
WHERE total_laid_off is null
AND percentage_laid_off is null;


ALTER TABLE layoffs_staging3
modify COLUMN `date` DATE;


SELECT *
FROM layoffs_staging3
where industry is  null 
or industry ='' ;


SELECT *
FROM layoffs_staging3
where company = 'Airbnb';


select *
from layoffs_staging3 as t1
join layoffs_staging3 as t2
    on t1.company = t2.company
where (t1.industry is null OR t1.industry = '')
AND t2.industry is not null ;

update layoffs_staging3 
set industry =null
where industry = '';

update layoffs_staging3 t1
join layoffs_staging3 as t2
    on t1.company = t2.company
set  t1.industry = t2.industry
where t1.industry is null 
AND t2.industry is not null ;

select *
from layoffs_staging3;


alter table layoffs_staging3
drop column row_num;



delete
FROM layoffs_staging3
WHERE total_laid_off is null
AND percentage_laid_off is null;
