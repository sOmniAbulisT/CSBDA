# Report Question 2

## 1. Implementation logic
The objective if Question 2 was to expand the existing database schema to accommodate complex course schedules and to process time data from `a4_table2.csv` into a SQL script (`autogen_q2.sql`).

This task required a two phase approach:
1. Modifying the `Course` table to support multiple time slots per course while maintaining relational integrity.
2. Decoding database logic to map human readable time strings into numerical primary keys, and merging multiple records into single database entries.

## 2. Database schema expansion (`solution_q2.sql`)
To accurately represent the university coures, I utilized the `ALTER TABLE` statement to restructure the `Course` table:
* Added `Year`, `Semester`, and `Credit` to store the course information. 
* Added `TimeSlotTwoId`, `TimeSlotThreeId`, and `TimeSlotFourId` to handle the four periods. 
* Implemented `FOREIGN KEY` constraints on all TimeSlot columns. 

## 3. Data cleaning and transformation (`solution_q2.py`)
Processing `a4_table2.csv` presented significant data inconsistency challenges. I implemented several strategies to handle them:

### A. String normalization via dictionary mapping
The `Day of the Week` column contained mixed formats (e.g., `"Wed"` vs. `"Wednesday"`). I constructed a normalization dictionary (`day_map`). By converting all inputs to lowercase and passing them through the dictionary, all variations were reliably mapped to standard numeric Day IDs (e.g., Monday = 2, Tuesday = 3). A similar mapping was applied to handle period variations, including alphabetical night-class periods (e.g., "A", "B").

### B. The TimeSlot mathematical logic
The most critical challenge was determining how the database generates `TimeSlotId`. By inspecting the `Day`, `Period`, and `TimeSlot` tables, I find the database's 1D array flattening logic. Since each day consists of exactly 15 periods, the unique `TimeSlotId` can be calculated using the following formula:

```
TimeSlotId = (DayId - 1) * 15 + PeriodId
```

This discovery allowed the Python script to dynamically and accurately calculate foreign keys without querying the database for every row.

### C. Multi-row data aggregation
I utilized Python's `collections.defaultdict(list)` using a composite key `(CourseNumber, Year, Semester, Credit)`. This allowed the script to group all calculated `TimeSlotIds` for a single course into a list. Finally, the script unpacked this list, assigning the periods sequentially to `TimeSlotOneId` through `TimeSlotFourId`, filling any unused slots with `NULL`.