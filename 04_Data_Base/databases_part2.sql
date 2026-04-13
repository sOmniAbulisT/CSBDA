-- Combines rows from two or more tables in databases
SELECT * FROM Seed_Info 
	JOIN Company_Info 
	ON Seed_Info.Company_id = Company_Info = Company_ID; -- use Company_ID/Comapny_id to join 

-- Combines rows from two or more tables in databases with target columns
SELECT Hybrid_name, Maturity, Company_name, Parent_name
FROM Seed_Info JOIN Company_Info
ON Seed_Info.Company_id = Company_Info = Company_ID; 

-- Aggregate function: Count
SELECT COUNT(*) FROM Seed_Info; -- calculate # of rows
SELECT COUNT(*) FROM State_Info; 

SELECT COUNT(*) FROM State_Info JOIN Farm_Info
ON State_Info.State_ID = Farm_Info.State_ID; 

-- Aggregate function: DISTINCT
SELECT DISTINCT Company_Info.Parent_company
FROM Seed_Info JOIN Company_Info
ON Seed_Info.Company_id = Company_Info.Company_ID; -- Remove duplicate data, leaving only the unique ones
