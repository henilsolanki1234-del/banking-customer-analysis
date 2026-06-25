create database banking_case;
use banking_case

SELECT * FROM customer  LIMIT 10;
-- Identify top customers based on bank deposits
SELECT Name, `Bank Deposits`
FROM customer
ORDER BY `Bank Deposits` DESC
LIMIT 10;
-- "Which customers should we target for premium savings accounts?
SELECT `Estimated Income`,
       `Bank Deposits`,
       Occupation
FROM customer
WHERE `Estimated Income` > 100000
AND `Bank Deposits` < 20000;

-- Who are our most valuable customers?
SELECT Occupation,
       SUM(`Bank Deposits`) AS Total_Deposits
FROM customer
GROUP BY Occupation
ORDER BY Total_Deposits DESC;

-- Which customers may struggle to repay loans?

SELECT `Estimated Income`,
       `Bank Loans`
FROM customer
WHERE `Bank Loans` > (`Estimated Income` * 2);

-- Which loyalty segment generates the most value?

SELECT `Loyalty Classification`,
       COUNT(*) AS Customers,
       SUM(`Bank Deposits`) AS Deposits
FROM customer
GROUP BY `Loyalty Classification`
ORDER BY Deposits DESC;

-- Who has deposits but no credit card usage?

SELECT `Bank Deposits`,
       `Credit Card Balance`
FROM customer
WHERE `Bank Deposits` > 50000
AND `Credit Card Balance` = 0;

-- Which locations generate the most deposits?

SELECT `Location ID`,
       SUM(`Bank Deposits`) AS Total_Deposits
FROM customer
GROUP BY `Location ID`
ORDER BY Total_Deposits DESC;

-- Which nationality contributes the highest deposits?

SELECT Nationality,
       SUM(`Bank Deposits`) AS Total_Deposits
FROM customer
GROUP BY Nationality
ORDER BY Total_Deposits DESC;