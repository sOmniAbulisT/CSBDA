# Report Question 2

In this question, I used a `JOIN` to link state names with the farm data. I found that the farms are not distributed evenly at all; most of the data is concentrated in California (2,902 farms) and Iowa (2,116 farms), which represent a significant portion of the dataset. By using a `LEFT JOIN`, I identified an anomaly: although 51 administrative areas listed in the `State_Info` table, Wyoming has zero farms recored. This represents a clear gap in the data, meaning this dataset doesn't have any information on what's happening in that state.

**SQL Output**
```
+----------------------+-----------+    +--------------+----------+
| State_name           | num_farms |    | State_name   | Farm_ID  |
+----------------------+-----------+    +--------------+----------+
| California           | 2902      |    | Wyoming      | (NULL)   |
| Iowa                 | 2116      |    +--------------+----------+
| ...                  | ...       |
| Oregon               | 2         |
| District of Columbia | 2         |
+----------------------+-----------+

```

Although irrigation status is a binary variable (0/1), calculating its mean provides the proportion of irrigated farms per states. This allows for a standardized comparision across states with different sample sizes. For instance, a mean of 1.0 indicateds that states is fully irrigated. 

Beyound the farm counts, the irrigation status reveals a distinct pattern. In states with the largest number of farms, such as California (2,902 farms) and Iowa (2,116 farms), the irrigation rate consistently stabilizes around 50% (0.47 to 0.50). However, extreme values are found in states with very small number of farms. For instance, Alabama shows a 100% irrigation rate across its 5 farms, while Oregon and Delaware show 0% irrigation. I am curious whether these irrigation patterns are liked to local soil types.

**SQL Output**
```
+--------------+---------------+------------------+
| State_name   | total_farms   | irrigation_rate  |
+--------------+---------------+------------------+
| Alabama      | 5             | 1.00             |
| ...          | ...           | ...              |
| California   | 2902          | 0.50             |
| ...          | ...           | ...              |
| Iowa         | 2116          | 0.49             |
| ...          | ...           | ...              |
| Oregon       | 2             | 0.00             |
| Delaware     | 3             | 0.00             |
+--------------+---------------+------------------+

```

Finally, I observed a highly symmetrical pattern: the irrigation rate remains consistent at approximately 50% across all soil types. This suggests that irrigation assignment is largely independent of soil characteristics in this dataset. Furthermore, the 10 states that encompass all 11 soil types (such as California and Iowa) each have more than 700 farms. This indicates that these major states not only provide substantial sample sizes but also offer complete soil type diversity.