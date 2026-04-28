-- Question 1

-- Select Database for Assignment 3
USE A3_farm_records;

SHOW TABLES;      

-- Company information
DESCRIBE Company_Info;
-- The total number of companies
SELECT COUNT(*) AS count FROM `A3_farm_records`.`Company_Info`; 

-- 
SELECT Company_name, COUNT(*) AS repeat_name FROM `A3_farm_records`.`Company_Info` 
    GROUP BY Company_name
    HAVING repeat_name > 1; 
SELECT * FROM `A3_farm_records`.`Company_Info`
    WHERE Company_name = 'BASFPlants';

--
SELECT COUNT(DISTINCT Parent_Company) AS parent_company FROM `A3_farm_records`.`Company_Info`;
SELECT Parent_Company, COUNT(*) AS subsidiary FROM `A3_farm_records`.`Company_Info`
    WHERE Parent_Company IS NOT NULL 
    GROUP BY Parent_Company
    ORDER BY subsidiary DESC;  
SELECT Company_name FROM `A3_farm_records`.`Company_Info`
    WHERE Parent_Company IS NULL; 

-- Farm Information
DESCRIBE Farm_Info;
SELECT COUNT(*) AS total FROM `A3_farm_records`.`Farm_Info`;

SELECT `Farm_name` FROM `A3_farm_records`.`Farm_Info`; 
SELECT Irrigation, COUNT(*) AS count FROM `A3_farm_records`.`Farm_Info`
    GROUP BY Irrigation; 

SELECT Soil_type, COUNT(*) AS soil_type_num FROM `A3_farm_records`.`Farm_Info`
    GROUP BY Soil_type
    ORDER BY soil_type_num DESC; 

SELECT COUNT(DISTINCT Soil_type) FROM `A3_farm_records`.`Farm_Info`;
SELECT DISTINCT Soil_type FROM `A3_farm_records`.`Farm_Info`;
SELECT COUNT(DISTINCT State_id) FROM `A3_farm_records`.`Farm_Info`;

SELECT soil_type, COUNT(*) AS frequency, ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM `A3_farm_records`.`Farm_Info`), 2) AS percentage FROM `A3_farm_records`.`Farm_Info`
    GROUP BY Soil_type
    ORDER BY frequency DESC; 

SELECT State_id, COUNT(DISTINCT soil_type) AS distinct_soil FROM `A3_farm_records`.`Farm_Info`
GROUP BY State_id
HAVING distinct_soil = 11;

SELECT soil_count, COUNT(*) AS state_count
    FROM(
        SELECT State_id, COUNT(DISTINCT soil_type) AS soil_count FROM `A3_farm_records`.`Farm_Info`
        GROUP BY State_id
    ) AS state_stat
GROUP BY soil_count
ORDER BY soil_count DESC;

SELECT State_id, soil_type FROM `A3_farm_records`.`Farm_Info`
    WHERE State_id IN (
        SELECT State_id FROM `A3_farm_records`.`Farm_Info`
        GROUP BY State_id
        HAVING COUNT(DISTINCT soil_type) = 1
    )
GROUP BY State_id, soil_type;

SELECT soil_type, COUNT(DISTINCT State_id) AS states_present_in FROM `A3_farm_records`.`Farm_Info`
    GROUP BY soil_type
    ORDER BY states_present_in ASC; 

SELECT State_id, COUNT(DISTINCT soil_type) AS soil_variety, COUNT(*) AS farm_count FROM `A3_farm_records`.`Farm_Info`
    GROUP BY State_id
    ORDER BY soil_variety DESC, farm_count DESC;

SELECT soil_type, COUNT(*) AS total_farms, ROUND(AVG(CAST(Irrigation AS DECIMAL(10, 2)))*100, 2) AS irrigation_rate_pct FROM `A3_farm_records`.`Farm_Info`
    GROUP BY soil_type
    ORDER BY irrigation_rate_pct DESC;

SELECT State_id, AVG(CAST(Irrigation AS DECIMAL(10, 2))) AS avg_irrigation FROM `A3_farm_records`.`Farm_Info`
    GROUP BY State_id
    ORDER BY avg_irrigation DESC;

-- Seed information
DESCRIBE Seed_Info;

SELECT * FROM `A3_farm_records`.`Seed_Info`;
SELECT COUNT(*) FROM `A3_farm_records`.`Seed_Info`; --12377
SELECT COUNT(DISTINCT Company_id) FROM `A3_farm_records`.`Seed_Info`;
SELECT COUNT(DISTINCT Crop) FROM `A3_farm_records`.`Seed_Info`;

SELECT COUNT(Hybrid_name), COUNT(DISTINCT Hybrid_name) FROM `A3_farm_records`.`Seed_Info`;

SELECT Hybrid_name, COUNT(*) as occurrence FROM `A3_farm_records`.`Seed_Info`
    GROUP BY Hybrid_name
    HAVING occurrence > 1
    ORDER BY occurrence DESC;
SELECT Crop, COUNT(*) AS hybrid_count FROM `A3_farm_records`.`Seed_Info`
    GROUP BY Crop
    ORDER BY hybrid_count DESC;

SELECT Crop, COUNT(*) AS sample_size, ROUND(AVG(Maturity), 2) AS avg_maturity, ROUND(STDDEV(Maturity), 2) AS sd_maturity,
    MIN(Maturity) AS minimum, MAX(Maturity) AS maximum 
    FROM `A3_farm_records`.`Seed_Info`
    GROUP BY Crop
    ORDER BY Crop ASC;

SELECT Company_id, COUNT(*) AS variety_count, ROUND(COUNT(*)*100/(SELECT COUNT(*) FROM `A3_farm_records`.`Seed_Info`), 2) AS market 
    FROM `A3_farm_records`.`Seed_Info`
    GROUP BY Company_id
    ORDER BY variety_count DESC; 

SELECT 
    CASE 
        WHEN Crop IN ('Maize', 'Corn') THEN 'Corn/Maize'
        WHEN Crop LIKE 'Soybean%' THEN 'Soybean'
        WHEN Crop LIKE 'Wheat%' THEN 'Wheat'
        WHEN Crop LIKE 'Rice%' THEN 'Rice'
        ELSE Crop 
    END AS Normalized_Crop,
    COUNT(*) AS total_hybrids
FROM `A3_farm_records`.`Seed_Info`
GROUP BY Normalized_Crop
HAVING total_hybrids > 20 
ORDER BY total_hybrids DESC;

-- State_Info
DESCRIBE State_Info; 
SELECT * FROM `A3_farm_records`.`State_Info`;

-- Trial_Info
DESCRIBE Trial_Info; 
SELECT COUNT(*) AS total_trial, COUNT(Yield) AS yield_count, COUNT(Disease_rating) AS disease_count, COUNT(*)-COUNT(Yield) AS miss_yield
    FROM `A3_farm_records`.`Trial_Info`;

SELECT MIN(Yield) AS minimun, MAX(Yield) AS maximum, ROUND(AVG(Yield), 2) AS average, ROUND(STDDEV(Yield), 2) AS SD FROM `A3_farm_records`.`Trial_Info`;

SELECT Disease_rating, COUNT(*) AS frequency, ROUND(COUNT(*)*100/(SELECT COUNT(*) FROM Trial_Info), 2) AS percentage
    FROM `A3_farm_records`.`Trial_Info`
    GROUP BY Disease_rating
    ORDER BY Disease_rating;

SELECT Year, COUNT(*) AS trials_per_year, ROUND(AVG(Yield), 2) AS yearly_avg_yield FROM `A3_farm_records`.`Trial_Info`
    GROUP BY Year
    ORDER BY Year;