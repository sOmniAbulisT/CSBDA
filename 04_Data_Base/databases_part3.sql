SHOW DATABASES;
USE field_trial; 

SELECT COUNT(*) FROM `Trial_Info`
UNION ALL
SELECT COUNT(*) FROM `Trial_Info`
    WHERE `Yield` > 80; 
SELECT ROUND(AVG(`Yield`), 2) FROM `Trial_Info`;

-- Combine above 
SELECT Farm_info_id, Yield FROM `Trial_Info`
    WHERE `Farm_info_id` IN 
        (
            -- Subquery
            SELECT `Farm_info_id` FROM `Trial_Info`
                WHERE `Disease_rating` > 4
        );

SELECT Farm_info_id, Yield, COUNT(Seed_info_id) AS Num_Seed
    FROM `Trial_Info` GROUP BY `Farm_info_id`; 

SELECT MAX(Yield), MIN(Yield) FROM `Trial_Info`;

SELECT MAX(Yield), MIN(Yield), MAX(Num_Seed), MIN(Num_Seed) FROM
    (
        -- Inner query: group by farm, compute seed count per farm
        SELECT Farm_info_id, Yield, COUNT(Seed_info_id) AS Num_Seed
        FROM `Trial_Info` GROUP BY `Farm_info_id`
    ) AS Avg_yield_farm; 

SELECT `Farm_info_id`, `State_name`, MAX(Yield), MIN(Yield)
    FROM 
        (
            SELECT Farm_info_id, Yield, `State_name`
            FROM `Trial_Info` JOIN `Farm_Info`
            ON `Trial_Info`.`Farm_info_id`=
        )

