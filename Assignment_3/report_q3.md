# Report Question 3
To begin the analysis of the `Trial_Info` table, I first performed an exploratory query to evaluate the data integrity of the yield records. I identified 8 extreme anomalies where the yield values exceeded 1,000, reaching as high as 8,192.5, which falls significantly outside the biologically typical range of 0 to 1,000. To ensure that the subsequent descriptive statistics remained accurate and representative of the typical trial performance, I made the deliberate decision to exclude these 8 records from my primary analysis. For the remaining validated dataset, the average yield 149.24 with a standard deviation of 208.78, reflecting a wide but realistic distribution of crop performance.

**SQL Output**
```
+---------+--------+-----------------+--------------+--------------+      +------------+-----------+-----------+-----------+----------+-----------+
| Yield   | Year   | State_name      | Crop         | Hybrid_name  |      | total_farm | min_yield | max_yield | avg_yield | sd_yield | cv_yield  |
+---------+--------+-----------------+--------------+--------------+      +------------+-----------+-----------+-----------+----------+-----------+
| 5692.6  | 3004   | California      | Corn         | JKR-185      |      | 15672      | 20        | 999.7     | 149.24    | 208.78   | 139.89    |
| 6145.3  | 3014   | California      | Sugercane    | GMWCX-746    |      +------------+-----------+-----------+-----------+----------+-----------+
| 8166.2  | 3018   | Iowa            | Soybean Oil  | WCIM-603     |
| 8192.5  | 3007   | Iowa            | Sorghum      | YLJ-856      |
| 7374.1  | 3002   | Illinois        | Rice         | OBFF-491     |
| 7706.4  | 3016   | Indiana         | Maize        | FFOSD-683    |
| 7435.3  | 3019   | Kansas          | Maize        | WHTUE-464    |
| 5933.5  | 3016   | North Carolina  | Rice         | FLIGE-224    |
+---------+--------+-----------------+--------------+--------------+

```

Analysis of the `Disease_rating` identified 772 NULL values and several invalid negative entries, such as -10, -8, and -7. These records were excluded to maintain data integrity. Post-filtering results indicate that the average yield does not decrease as disease severity increase, remaining consistent at approximately 150 across all levels from 0 to 10. Also, the `Year` column, although some values appear in the distant future (3000+), the records are uniformly distributed across years, ensuring that no specific temporal bias affects the overall descriptive statistics.

Next analysis was performed by joining the `Trial_Info`, `Farm_Info` and `State_Info` tables to integrate crop performance data with its corresponding geographical data. The resulting dataset reveals a significant correlation between sample size (farm_count) and observational stability, identifying critical anomalous patterns within the trial records. In regions with the highest average yields, such as New Jersey (average: 376.6) and South Dakota (average: 310.25), the number of farm records is extremely low (3 farms). The major agricultural states with extensive trial records, such as California (2,841 farms), Texas (1,523 farms), and Kansas (1,286 farms), show regional yields close to 152. This alignment with the overall validated mean of 149.26 underscores high data stability in high-density regions. Furthermore, while most major producers reached a maximum disease rating of 10 —consistent with typical pathogen proliferation in large-scale monocultures—Delaware and Missouri recorded anomalous maximum disease values of 0. Particularly in Missouri, the combination of the lowest average yield (47.37) and zero disease pressure strongly suggests severe abiotic stress, such as extreme drought, which likely suppressed both crop growth and pathogen activity simultaneously.

**SQL Output**
```
+--------------+------------+---------------------+--------------+
| State_name   | farm_count | regional_avg_yield  | max_disease  |
+--------------+------------+---------------------+--------------+
| New Jersey   | 3          | 376.6               | 3            |
| South Dakota | 3          | 310.25              | 1            |
| ...          | ...        | ...                 | ...          |
| California   | 2841       | 152.48              | 10           |
| Texas        | 1523       | 152.44              | 10           |
| ...          | ...        | ...                 | ...          |
| Missouri     | 3          | 47.37               | 0            |
+--------------+------------+---------------------+--------------+

```
To conclusion the investigation of the `Trial_Info` table, I performed a comparative stability analysis across all major crops with a sufficient sample size by calculating the Coefficient of Variation (CV). This metric allows for a normalized comparision of yield risk across different biological scales. 

The results identify Soybean and Soyben Oil as the most stable crops in the dataset, exhibiting the lowest CV values of approximately 11.5%. In contrast, Sugarcane demonstrated the highest environmental sensitivity with a CV of 19.72%, indicating that its productivity is more susceptible to extenal trial conditions. Notably, Cotton maintains its status as the most productive crop with an elite average yield of 753.93, through it carries a moderate relative variance comparable to that of low-yielding crops like Sorghum or Rice. This comprehensive profiling suggests that while Cotton offers the highest total production potential, Soybeans represent a safer, more reliable alternative for consistent performance across diverse geographic locations.