-- Combines rows from two or more tables in databases
SELECT * FROM Seed_Info 
	JOIN Company_Info 
	ON Seed_Info.Company_id = Company_Info.Company_ID; -- use Company_ID/Comapny_id to join 

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

-- Aggregate function: LIMIT
SELECT Seed_ID, Maturity FROM `Seed_Info` LIMIT 5; 

SELECT `Seed_ID`, Maturity FROM `Seed_Info` LIMIT 3 OFFSET 2; -- OR
SELECT Seed_ID, Maturity FROM `Seed_Info` LIMIT 2, 3;

-- Aggregate function: ORDER
SELECT Hybrid_name, Maturity 
	FROM `Seed_Info`
	ORDER BY `Maturity` ASC; -- ascending order

SELECT Hybrid_name, Maturity
	FROM `Seed_Info`
	ORDER BY `Maturity` DESC; -- decreasing order 

SELECT * FROM `Seed_Info`
	ORDER BY `Company_id`, `Maturity` DESC; -- sort by Company_id first (ascending), then decreasing by Maturity

SELECT * FROM `Seed_Info`
	ORDER BY `Company_id` DESC, `Maturity` ASC; -- decreasing order by Company_id first, then ascending order by Maturity

-- Sorting by custom order 
SELECT * FROM `State_Info`
	ORDER BY FIELD(
		`State_name`, 
		'California', 'Texas', 'Kansas', 
		'Illinois', 'Florida'
	); 

SELECT * FROM `State_Info`
	ORDER BY FIELD(
		`State_name`, 
		'USA', 'California', 'Texas', 'Flordia'
	);

SELECT * FROM `Seed_Info`
	ORDER BY `Company_id` DESC, `Maturity` ASC
	LIMIT 7;

SELECT * FROM `Seed_Info`
	WHERE (`Maturity` >= 111 AND `Company_id` = 2)
		OR (`Maturity` <= 109 AND `Company_id` = 1)
	ORDER BY `Company_id` DESC, `Maturity` ASC; 

SELECT Hybrid_name, `Company_Info`.Company_name, `Company_Info`.Company_id, Maturity
	FROM `Seed_Info` JOIN `Company_Info` ON `Seed_Info`.`Company_id`=`Company_Info`.`Company_ID`
	WHERE (`Maturity` >= 111 AND `Company_name` = 'Pioneer') 
		OR (`Maturity` <= 109 AND `Company_name` = 'Dekalb')
	ORDER BY `Company_Info`.Company_id DESC, `Maturity` ASC;


