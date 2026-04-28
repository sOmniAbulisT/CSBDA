# Report Question 1

## 1. Company_Info
The first table is `Company_Info`, which contains 108 records of companies involved in the seed supply chain. The company name `BASFPlants` (ID: 17) and `BasfPlants` (ID: 53) are listed as distinct entities under the same parent company `BASF`, Given that the only difference is the casing of the name, these records likely refer to the same company.

**SQL Output**
```
+------------+--------------+----------------+
| Company_ID | Company_name | Parent_company |
+------------+--------------+----------------+
| 17         | BASFPlants   | BASF           |
| 53         | BasfPlants   | BASF           |
+------------+--------------+----------------+

```
Based on my analysis, the dataset of 108 records is not merely a flat list but is organized into 12 distinct corporate clusters. Each of the 12 primary parent companies oversees exactly 8 subsidiaries, creating a perfectly symmetrical hierarchy that accounts for the total count (12 parents + 96 subsidiaries = 108 records). The 12 identified parent companies are presented below:

**SQL Output**
```
+-------------------------+
| Company_name            |
+-------------------------+
| Bayer Crop Science      |
| Corteva Agriscience     |
| Syngenta                |
| Advanta Seeds           |
| BASF                    |
| Limagrain               |
| KWS SAAT                |
| Sakata Seed Corporation |
| DLF Seeds               |
| Rijk Zwaan              |
| Vilmorin Cie            |
| RAGT Semences           |
+-------------------------+

```

## 2. Farm_Info
The second table is `Farm_Info`, contain records for 14,544 individual farms. The table structure includes the farm name, irrigation status, soil type, and a state identifier. The farms are distributed across 50 states, encompassing 11 distinct soil types.

The distribution of the 11 soil types across farms is remarkably uniform, with counts for each type ranging between 1,265 and 1,378. However, soil diversity varies significantly at the state level: only 10 out of 50 states possess all 11 soil categories, while the remaining 40 states host between 1 and 8 types. Notably, State 8 is the least diverse, containing only a sigle soil type (Sandy clay loam). Furthermore, geographic presence differs by soil; "Clay" has the narrowest distribution, appearing in only 21 states, whereas "Sandy clay" is the most widespread, found on 33 states.

Interestingly, the data reveals that `irrigation` rates remain relatively consistent across different soil types, a finding that deviates from conventional pedological principles. Theoretically, sandy soils - characterized by high hydraulic conductivity and raoid drainage - are expected to required more frequent irrigation compared to clay - rich soils, which have higher water retention capacity. However, the soil texture may not be the primary driver of irrigation infrastructure in this specific dataset.

## 3. Seed_Info
The third table is `Seed_Info`, there are contain 12,377 hybrids source from 108 different companies, which are classified into 20 crop categories. Notably, the dataset contains 55 hybrids that appear twice. Additionally, the table records the days to maturity for each hybrid. 

Regarding company distribution, Company NO. 91 holds the largest share with 207 hybrids, accounting for 1.67% of the total; notably, no single company exceeds a 2% representation. Analysis of maturity periods shows that Maize and Corn exhibit highly similar profiles, with mean maturities of 116.61 days (SD = 47.09) and 114.93 days (SD = 52.68), respectively. Similarly, Soybean and Soybean oil show comparable statistics, with mean maturity days of 117.95 (SD = 49.6) and 115.56 (SD = 46.43). Given these statistical similarities, these respective pairs can be treated as belonging to the same genetic populations for downstream analysis.

Furthermore, certain hybrid names featuring underscored suffixes (e.g., 'Wheat_f' or 'Wheat_r') present a point of ambiguity. These designations may either represent specific subpopulations characterized by low intra-group variation, or they could simply be the result of data entry inconsistencies. The exact nature of these entries remains subject to further verification.

## 4. State_Info
The fourth table is `State_Info`, encompasses all 51 administrative units across the Unite States, comprising the 50 states and the District of Columbia (Washington D.C.), along with their respective abbreviations.

## 5. Trial_Info
The last table is `Trial_Info`, which contains 16,030 trials, within the dataset, there are 15,691 records with documented yield data, and 15,258 records containing dieases susceptibility ratings.

**SQL Output**
```
+-------------+--------------+----------------+
| total_trial | yield_count  | disease_count  |
+-------------+--------------+----------------+
| 16030       | 15691        | 15258          |
+-------------+--------------+----------------+

```
Preliminary descriptive statistical analysis of the yield data reveals a mean of 152.8, yet a disproportionately high standard deviation of 261.75. This high variability, coupled with an observed maximum value of 8192.5—which differs from the mean by several orders of magnitude—strongly suggests potential human recording errors. From a biostatistical perspective, such extreme values are considered biologically implausible and likely represent data entry inconsistencies rather than true biological variation.

```
+----------+----------+---------+---------+
| minimum  | maximum  | average | SD      |
+----------+----------+---------+---------+
| 20       | 8192.5   | 152.8   | 261.75  |
+----------+----------+---------+---------+

```

Within the disease susceptibility ratings, a small number of negative values (11 entries in total) were detected and identified as clerical errors. The overall distribution of disease pressure is heavily skewed towards the lower range, with ratings between 0 and 3 accounting for approximately 70% of the observations.