select *
from layoffs_staging3;

select MAX(total_laid_off), MAX(percentage_laid_off)
from layoffs_staging3;

select *
from layoffs_staging3
where percentage_laid_off = 1 
order by funds_raised_millions desc;

select company , SUM(total_laid_off)
from layoffs_staging3
group by company
order by 2 desc;


select MIN(`date`) , MAX(`date`)
from layoffs_staging3;

select stage , SUM(total_laid_off)
from layoffs_staging3
group by stage 
order by 2 desc;


select *
from layoffs_staging3;



select company , AVG(percentage_laid_off)
from layoffs_staging3
group by company
order by 2 desc;


select substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
from layoffs_staging3
where substring(`date`,1,7)  is not null
group by `MONTH`
ORDER BY 1 asc;

WITH Rolling_Total AS 
(
select substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
from layoffs_staging3
where substring(`date`,1,7)  is not null
group by `MONTH`
ORDER BY 1 asc
)
select `MONTH`, total_off,
SUM(total_off) over(order by`MONTH`) AS rolling_total
from Rolling_Total;

select company , YEAR(`date`) , SUM(total_laid_off)
from layoffs_staging3
group by company, YEAR(`date`) 
order by company asc ;


select company , YEAR(`date`) , SUM(total_laid_off)
from layoffs_staging3
group by company, YEAR(`date`) 
order by 3 desc ;



with Company_Year(company, years ,total_laid_off)  AS 
(
select company , YEAR(`date`) , SUM(total_laid_off)
from layoffs_staging3
group by company, YEAR(`date`) 
), company_year_rank AS
(select * , 
dense_rank() OVER(partition by years ORDER BY total_laid_off desc) AS Ranking
from Company_Year
where years is not null
order by Ranking asc
)
select *
from company_year_rank
where ranking <= 5
;
