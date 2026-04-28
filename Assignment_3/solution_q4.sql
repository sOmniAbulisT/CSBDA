-- Question 4

-- Select Database for Assignment 3
USE A3_farm_records;

SHOW TABLES;

SELECT c.Company_name, COUNT(s.Seed_ID) AS total_hybrids, COUNT(DISTINCT s.Crop) AS crop_diversity FROM `A3_farm_records`.`Company_Info` AS c
    JOIN Seed_Info AS s ON c.Company_ID = s.Company_id
    WHERE c.Parent_company = 'BASF'
    GROUP BY c.Company_name
    ORDER BY total_hybrids DESC;

SELECT 'BASF Portfolio' AS entity, ROUND(AVG(t.Yield), 2) AS avg_yield, ROUND(AVG(t.Disease_rating), 2) AS avg_disease FROM `A3_farm_records`.`Trial_Info` AS t
    JOIN `A3_farm_records`.`Seed_Info` AS s ON t.Seed_info_id = s.Seed_ID
    JOIN `A3_farm_records`.`Company_Info` AS c ON s.Company_id = c.Company_ID
    WHERE c.Parent_company = 'BASF' AND t.Yield BETWEEN 0 AND 1000

UNION ALL

SELECT 'Global Average' AS entity, ROUND(AVG(Yield), 2) AS avg_yield, ROUND(AVG(Disease_rating), 2) AS avg_disease FROM `A3_farm_records`.`Trial_Info`
    WHERE Yield BETWEEN 0 AND 1000;

SELECT st.State_name, ROUND(AVG(t.Yield), 2) AS avg_yield, COUNT(t.Trial_ID) AS total_trials FROM `A3_farm_records`.`Trial_Info` AS t
    JOIN `A3_farm_records`.`Seed_Info` AS s ON t.Seed_info_id = s.Seed_ID
    JOIN `A3_farm_records`.`Company_Info` AS c ON s.Company_id = c.Company_ID
    JOIN `A3_farm_records`.`Farm_Info` AS f ON t.Farm_info_id = f.Farm_ID
    JOIN `A3_farm_records`.`State_Info` AS st ON f.State_id = st.State_ID
    WHERE c.Parent_company = 'BASF' AND t.Yield BETWEEN 0 AND 1000
    GROUP BY st.State_name
    HAVING total_trials > 10
    ORDER BY avg_yield DESC
    LIMIT 5;

SELECT s.Crop, ROUND(AVG(t.Disease_rating), 2) AS avg_disease_risk, ROUND(AVG(t.Yield), 2) AS current_avg_yield
    FROM `A3_farm_records`.`Trial_Info` AS t
    JOIN `A3_farm_records`.`Seed_Info` AS s ON t.Seed_info_id = s.Seed_ID
    JOIN `A3_farm_records`.`Company_Info` AS c ON s.Company_id = c.Company_ID
    WHERE c.Parent_company = 'BASF' AND t.Yield BETWEEN 0 AND 1000
    GROUP BY s.Crop
    ORDER BY avg_disease_risk DESC;