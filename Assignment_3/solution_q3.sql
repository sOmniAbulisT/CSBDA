-- Question 3

-- Select Database for Assignment 3
USE A3_farm_records;

SHOW TABLES;
DESCRIBE Trial_Info;

SELECT COUNT(*) AS anomalies FROM `A3_farm_records`.`Trial_Info`
    WHERE Yield > 1000 OR Yield < 0;

SELECT t.Yield, t.Year, s.State_name, sd.Crop, sd.Hybrid_name FROM `A3_farm_records`.`Trial_Info` AS t 
    JOIN `A3_farm_records`.`Farm_Info` AS f ON t.Farm_info_id = f.Farm_ID
    JOIN `A3_farm_records`.`State_Info` AS s ON f.State_id = s.State_ID 
    JOIN `A3_farm_records`.`Seed_Info` AS sd ON t.Seed_info_id = sd.Seed_ID
    WHERE t.Yield > 1000 OR t.Yield < 0;

SELECT COUNT(Yield) AS total_farm, MIN(Yield) AS min_yield, MAX(Yield) AS max_yield, ROUND(AVG(Yield), 2) AS avg_yield, ROUND(STDDEV(Yield), 2) AS sd_yield, 
    ROUND((STDDEV(Yield)/AVG(Yield))*100, 2) AS cv_yield FROM `A3_farm_records`.`Trial_Info`
    WHERE Yield BETWEEN 0 AND 1000 AND (Disease_rating BETWEEN 0 AND 10 OR Disease_rating IS NULL);

SELECT Year, COUNT(*) AS total_record, ROUND(AVG(Yield), 2) AS avg_yield, ROUND(AVG(Disease_rating), 2) AS avg_disease FROM `A3_farm_records`.`Trial_Info`
    WHERE Yield BETWEEN 0 AND 1000
    GROUP BY Year
    ORDER BY Year;

SELECT st.State_name, COUNT(DISTINCT f.Farm_ID) AS farm_count, ROUND(AVG(t.Yield), 2) AS regional_avg_yield, ROUND(MAX(t.Disease_rating), 2) AS max_disease
    FROM `A3_farm_records`.`Trial_Info` AS t 
    JOIN `A3_farm_records`.`Farm_Info` AS f ON t.Farm_info_id = f.Farm_ID
    JOIN `A3_farm_records`.`State_Info` AS st ON f.State_id = st.State_ID 
    WHERE t.Yield BETWEEN 0 AND 1000
    GROUP BY st.State_name
    ORDER BY regional_avg_yield DESC;

SELECT s.Crop, s.Maturity, ROUND(AVG(t.Yield), 2) AS avg_yield, ROUND(AVG(t.Disease_rating), 2) AS avg_disease, COUNT(*) AS trial_count
    FROM `A3_farm_records`.`Trial_Info` AS t
    JOIN `A3_farm_records`.`Seed_Info` AS s ON t.Seed_info_id = s.Seed_ID
    WHERE t.Yield > 150 AND t.Disease_rating < 3
    GROUP BY s.Crop, s.Maturity
    HAVING trial_count > 5
    ORDER BY avg_yield DESC;

SELECT s.Maturity, ROUND(AVG(t.Yield), 2) AS avg_yield,COUNT(*) AS trial_count FROM `A3_farm_records`.`Trial_Info` AS t
    JOIN `A3_farm_records`.`Seed_Info` AS s ON t.Seed_info_id = s.Seed_ID
    WHERE s.Crop = 'Maize' AND t.Yield BETWEEN 0 AND 1000
    GROUP BY s.Maturity
    ORDER BY s.Maturity ASC;

SELECT s.Crop, ROUND(AVG(t.Yield), 2) AS avg_yield, ROUND(STDDEV(t.Yield), 2) AS yield_sd, ROUND(STDDEV(t.Yield) / AVG(t.Yield) * 100, 2) AS cv_percent
    FROM `A3_farm_records`.`Trial_Info` AS t
    JOIN `A3_farm_records`.`Seed_Info` AS s ON t.Seed_info_id = s.Seed_ID
    WHERE t.Yield BETWEEN 0 AND 1000
    GROUP BY s.Crop
    HAVING COUNT(*) > 50
    ORDER BY cv_percent DESC;