-- DATA CLEANING SCRIPT

-- Step 1: Create staging table
CREATE TABLE layoffs_staging LIKE layoffs;

-- Step 2: Copy data into staging table
INSERT INTO layoffs_staging
SELECT * FROM layoffs;

-- Step 3: Remove duplicates using ROW_NUMBER
CREATE TABLE layoffs_staging2 (
  company TEXT,
  location TEXT,
  industry TEXT,
  total_laid_off INT DEFAULT NULL,
  percentage_laid_off TEXT,
  date TEXT,
  stage TEXT,
  country TEXT,
  funds_raised_millions INT DEFAULT NULL,
  row_num INT
);

INSERT INTO layoffs_staging2
SELECT *,
  ROW_NUMBER() OVER (
    PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
                 `date`, stage, country, funds_raised_millions
  ) AS row_num
FROM layoffs_staging;

DELETE FROM layoffs_staging2
WHERE row_num > 1;

-- Step 4: Standardize and clean columns

-- Trim whitespace
UPDATE layoffs_staging2
SET company = TRIM(company);

-- Standardize industry values
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Standardize country names
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

-- Convert date to correct format
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY `date` DATE;

-- Step 5: Fill missing industry using known company names
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2 ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;

-- Step 6: Delete rows with no layoff data
DELETE FROM layoffs_staging2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

-- Step 7: Final cleanup
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;
