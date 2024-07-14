CREATE DATABASE IF NOT EXISTS walmart_sales;

USE walmart_sales;

CREATE TABLE IF NOT EXISTS sales (
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10 , 2 ) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6 , 4 ) NOT NULL,
    total DECIMAL(12 , 4 ) NOT NULL,
    `date` DATETIME NOT NULL,
    `time` TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10 , 2 ) NOT NULL,
    gross_margin_percent FLOAT(11 , 9 ),
    gross_income DECIMAL(12 , 4 ) NOT NULL,
    rating FLOAT(2 , 1 )
);

-- import data from Walmart_Sales.csv file 

SELECT 
    *
FROM
    sales;

-- As all the values are not null so no missing data

-- Feature Enginering
-- 1) time_of_day

SELECT 
    `time`,
    (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END) AS time_of
FROM
    sales;
    
ALTER TABLE sales 
ADD COLUMN time_of_day varchar(20);

UPDATE sales 
SET 
    time_of_day = (CASE
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END);
    
-- 2) date_name
SELECT 
    `date`, DAYNAME(`date`)
FROM
    sales;
    
ALTER TABLE sales 
ADD COLUMN day_name varchar(20);

UPDATE sales 
SET 
    day_name = DAYNAME(`date`);
    
-- 3) month_name

SELECT 
    `date`, 
    monthname(`date`)
FROM
    sales;
    
ALTER TABLE sales 
ADD COLUMN month_name varchar(20);

UPDATE sales 
SET 
    month_name = MONTHNAME(`date`);
    
-- Exploratory Data Analysis(EDA)

-- 1) Generic Questions
-- a) How many unique cities does the data have?

SELECT DISTINCT
    city
FROM
    sales;

-- b) In which city is each branch?

SELECT DISTINCT
    branch, city
FROM
    sales;
    
-- Product Questions
-- a) How many unique product lines does the data have?

SELECT 
    COUNT(DISTINCT product_line) AS count_product_line
FROM
    sales;
    
-- b) What is the most comman payment method?

SELECT 
    payment_method, COUNT(payment_method) AS cnt
FROM
    sales
GROUP BY payment_method
ORDER BY cnt DESC
limit 1;

-- c) what is the most selling product line?

SELECT 
    product_line, COUNT(product_line) AS cnt
FROM
    sales
GROUP BY product_line
ORDER BY cnt DESC;

-- d) What is the Total Revenue by month?

SELECT 
    SUM(total) as total_revenue, month_name as `Month`
FROM
    sales
GROUP BY `Month`
order by total_revenue;

-- e) What month have the largest COGS? (COGS = Cost Of Goods Sold that is unit_price * quantity)

SELECT 
    SUM(cogs) AS Total_cogs, month_name AS `Month`
FROM
    sales
GROUP BY `Month`
ORDER BY Total_cogs;

-- f) What product line have the largest revenue?

SELECT 
    product_line, SUM(total) AS Revenue
FROM
    sales
GROUP BY product_line
ORDER BY Revenue DESC;

-- g) What is the city with the largest revenue?

SELECT 
    city, SUM(total) AS Revenue
FROM
    sales
GROUP BY city
ORDER BY Revenue DESC;

-- h) What product line had the largest VAT? (Value-Added Tax -a common form of indirect tax levied on services and goods)

SELECT 
    product_line, ROUND(AVG(VAT), 2) AS avg_vat
FROM
    sales
GROUP BY product_line
ORDER BY avg_vat DESC;
    
-- i) Which branch sold more products than the average product sold?

SELECT 
    branch, SUM(quantity) AS Quantity
FROM
    sales
GROUP BY branch
HAVING SUM(quantity) > AVG(quantity)
ORDER BY Quantity;

-- j) What is the most commmom product line by gender

SELECT 
    product_line, gender, COUNT(gender) AS cnt
FROM
    sales
GROUP BY product_line , gender
ORDER BY cnt DESC;

-- Sales
-- a) Number of sales made in each time of the day per weekday

SELECT 
    time_of_day, COUNT(*) AS total_sales
FROM
    sales
WHERE
    day_name = 'Sunday'
GROUP BY time_of_day;

-- b) Which of the customer types brings the most revenue?

SELECT 
    customer_type, SUM(total) as Revenue
FROM
    sales
GROUP BY customer_type;

-- c)Which customer type pays the most in VAT?

SELECT 
    customer_type, ROUND(AVG(VAT), 2) AS average
FROM
    sales
GROUP BY customer_type;

-- Customer
-- a) How many unique customer types does the data have?

SELECT DISTINCT
    customer_type
FROM
    sales;
    
-- b) How many unique payment methods does the data have?

SELECT DISTINCT
    payment_method
FROM
    sales;
    
-- c) What is the most common customer type?

SELECT 
    customer_type, COUNT(*)
FROM
    sales
GROUP BY customer_type;

-- d) Which day fo the week has the best avg ratings?

SELECT 
    day_name, ROUND(AVG(rating), 2) AS avg_rating
FROM
    sales
GROUP BY day_name
ORDER BY avg_rating DESC;

-- ------------------------------------------------------------END--------------------------------------------------------------------


