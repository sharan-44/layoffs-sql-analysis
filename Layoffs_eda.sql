-- EXPLORATORY DATA ANALYSIS (EDA)

-- Preview the cleaned data
SELECT * FROM layoffs_staging2;

-- Max layoff figures
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Fully laid off companies
SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1;

-- Add severity classification
ALTER TABLE layoffs_staging2
ADD layoff_severity VARCHAR(20);

UPDATE layoffs_staging2
SET layoff_severity = CASE
    WHEN percentage_laid_off = 1 THEN 'Fully Laid Off'
    WHEN percentage_laid_off >= 0.5 THEN 'Major Layoff'
    WHEN percentage_laid_off > 0 THEN 'Partial Layoff'
    ELSE 'Unknown'
END;

-- Top fully laid off companies
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- Total layoffs by company
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Total layoffs by industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Total layoffs by country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Total layoffs by year
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- Rolling monthly layoffs
WITH Rolling_total AS (
  SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_off
  FROM layoffs_staging2
  WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
  GROUP BY `MONTH`
)
SELECT `MONTH`, total_off,
  SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total;

-- Top 5 companies with most layoffs per year
WITH company_year (company, years, total_laid_off) AS (
  SELECT company, YEAR(`date`), SUM(total_laid_off)
  FROM layoffs_staging2
  GROUP BY company, YEAR(`date`)
),
company_year_rank AS (
  SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
  FROM company_year
  WHERE years IS NOT NULL
)
SELECT *
FROM company_year_rank
WHERE Ranking <= 5;
