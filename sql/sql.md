<h2>SQL interview question</h2>

<details>
<summary><b>How to get 3th higest salary</b></summary>

```SQL
SELECT MIN(Salary) FROM (SELECT Salary FROM Employees ORDER BY Salary DESC LIMIT 3) AS TopThreeSalary;

SELECT Salary
FROM (
  SELECT Salary, DENSE_RANK() OVER (ORDER BY Salary DESC) AS rank
  FROM Salaries
) AS ranked_salaries
WHERE rank = n;

```
</details>

<details>
<summary><b>How to perform joins</b></summary>

```SQL
-- Inner joins
SELECT * FROM person
JOIN car ON person.car_id = car.id;

\x -- Turn on/off expanded display

-- Left joins
SELECT * FROM person
LEFT JOIN car ON person.car_id = car.id;

-- Select all person which don't have car
SELECT * FROM person
LEFT JOIN car ON car.id = person.car_id
WHERE car.* IS NULL;
```
</details>

<details>
<summary>
<b>What is full table scan in SQL?</b>
</summary>
A full table scan in SQL occurs when the database engine reads all the rows in a table. This can happen when there is no index that can be used to optimize the query, or when the database's query optimizer determines that a full table scan is more efficient than using an index. 

During a full table scan, the database reads all blocks up to the high water mark (HWM), which are known to be formatted, and then reads the segment bitmap to determine which blocks between the HWM and the low HWM are formatted and safe to read. 

While full table scans can be slower than index scans, especially for large tables, they are not always a bad thing. For example, if a query needs to access a large percentage of the rows in a table, a full table scan can be faster than an index scan. 

To avoid unnecessary full table scans, you can ensure that your tables are properly indexed and that your queries are written to take advantage of these indexes. You can also analyze the execution plan of your queries to understand how the database is processing them.
</details>