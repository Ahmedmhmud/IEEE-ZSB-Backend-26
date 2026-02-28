# Task 5 Research

## Window Functions vs GROUP BY

Both can aggregate data, but they return results at different **granularity**:

- **GROUP BY** returns **one row per group** (detail rows are collapsed).
- **Window functions** keep the **original row-level detail** and add aggregate values beside each row.

### Simple demo

```sql
-- GROUP BY: one row per department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Window function: every employee row stays, plus department average
SELECT employee_id, department_id, salary,
			 AVG(salary) OVER (PARTITION BY department_id) AS dept_avg_salary
FROM employees;
```

---

## Clustered vs Non-Clustered Indexes

### Leaf node difference

- **Clustered Index (B-Tree leaf nodes):** the leaf nodes contain the **actual table rows** (data pages).
- **Non-Clustered Index (B-Tree leaf nodes):** the leaf nodes contain the **index key + row locator/pointer** to where the full row is stored.

So, clustered = data itself is ordered by the index key. Non-clustered = separate structure that points to data.

### Why only one clustered index per table?

A clustered index defines the **physical order** of rows. A table can only have **one physical order** at a time, so it can only have **one** clustered index.

---

## Filtered & Unique Indexes

### What is a Filtered Index?

A **Filtered Index** is an index built on only a subset of rows that match a condition (for example, `WHERE status = 'ACTIVE'`).

Why useful:

- **Less storage:** fewer indexed rows means a smaller index.
- **Faster queries:** queries targeting that filter scan a much smaller index.
- **Lower maintenance cost:** fewer index entries to update than a full-table index.

### Simple demo

```sql
-- SQL Server style example
CREATE INDEX IX_Orders_Active
ON Orders(order_date)
WHERE status = 'ACTIVE';
```

### Unique index on Email: why INSERT slower, SELECT faster?

- **Faster SELECT:** searching by `email` becomes very fast (index seek instead of full scan).
- **Slower INSERT:** on each insert, DB must:
	1. update the index structure,
	2. check if the email already exists (uniqueness validation),
	3. possibly split/rebalance index pages.

So reads get faster, but writes do extra work.

---

## Choosing the Right Index (Staging Table)

For a temporary staging table where you:

1. insert millions of rows quickly,
2. read once,
3. delete,

the best choice is usually a **Heap Structure** (no clustered index).

Reason:

- fastest bulk inserts (no B-Tree maintenance during heavy load),
- you avoid index update overhead for short-lived data,
- if needed, you can add an index later only for the read step.

---

## Database Transactions (ACID)

### Atomicity = “All or Nothing”

Atomicity means a transaction either:

- **commits completely** (all steps saved), or
- **rolls back completely** (none of the steps saved).

### What can go wrong without a transaction?

Imagine bank transfer:

1. subtract 100 from Account A,
2. add 100 to Account B.

If the system crashes after step 1 but before step 2, money disappears. This is a **partial failure** and causes inconsistent, disastrous data.

### Simple demo

```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

COMMIT;
-- If any step fails: ROLLBACK;
```

