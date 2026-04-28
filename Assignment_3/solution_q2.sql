-- Question 2

-- Select Database for Assignment 3
USE A3_farm_records;

SHOW TABLES;
DESCRIBE State_Info;
DESCRIBE Farm_Info;

SELECT State_name, COUNT(Farm_ID) AS num_farms FROM `A3_farm_records`.`Farm_Info`
    JOIN `A3_farm_records`.`State_Info` ON Farm_Info.State_ID = State_Info.State_ID
    GROUP BY State_Info.State_name
    ORDER BY num_farms DESC;
SELECT State_name, Farm_ID FROM `A3_farm_records`.`State_Info`
    LEFT JOIN `A3_farm_records`.`Farm_Info` ON State_Info.State_ID = Farm_Info.State_ID
    WHERE Farm_ID IS NULL; -- Wyoming

SELECT s.State_name, COUNT(f.Farm_ID) AS total_farms, ROUND(AVG(f.Irrigation), 2) AS irrigation_rate FROM `A3_farm_records`.`State_Info` AS s
    JOIN `A3_farm_records`.`Farm_Info` AS f ON s.State_ID = f.State_ID
    GROUP BY s.State_name
    ORDER BY irrigation_rate DESC;

SELECT Soil_type, COUNT(*) AS count, ROUND(AVG(Irrigation), 2) AS irrigation_rate FROM `A3_farm_records`.`Farm_Info`
    GROUP BY Soil_type
    ORDER BY irrigation_rate DESC;

SELECT s.State_name, COUNT(DISTINCT f.Soil_type) AS soils, COUNT(f.Farm_ID) AS farms FROM `A3_farm_records`.`State_Info` AS s 
    JOIN `A3_farm_records`.`Farm_Info` AS f 
        ON s.State_ID = f.State_ID 
    GROUP BY s.State_ID
    HAVING soils = 11
    ORDER BY farms DESC;