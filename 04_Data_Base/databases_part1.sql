-- Initilization

SHOW DATABASES; 
USE field_trial; 
SHOW TABLES; 

-- Describe tables 

DESCRIBE Company_Info; 
DESCRIBE Seed_Info; 

-- Select columes from target table

SELECT * FROM Company_Info; -- select all columns from company_info table
SELECT * FROM Seed_Info; 

SELECT Company_name FROM Company_Info;  -- select target column from company_info table
SELECT Company_name, Parent_name FROM Company_Info; 
SELECT Hybrid_name, Company_id FROM Seed_Info; 

-- Select columns with single condition 

SELECT * FROM Seed_Info WHERE Maturity > 110; 
SELECT * FROM Seed_Info WHERE Hybrid_name = 'P0720Q'; 

-- Select columns with multiple condition 
SELECT * FROM Seed_Info WHERE Maturity > 110 AND Company_id = 1; -- both conditions 
SELECT * FROM Seed_Info WHERE Maturity > 110 OR Company_id = 1; -- only need one  condition

SELECT * FROM Seed_Info WHERE Maturity BETWEEN 109 AND 112; 
SELECT * FROM Seed_Info WHERE Hybrid_name IN ('P0720Q', 'P1099Q', 'P1185Q'); 

SELECT * FROM Seed_Info WHERE Hybrid_name LIKE 'P%8%Q';  -- '%' matches anything 
SELECT * FROM Seed_Info WHERE Hybrid_name LIKE 'P%8_Q';  -- '_' matches a single character


