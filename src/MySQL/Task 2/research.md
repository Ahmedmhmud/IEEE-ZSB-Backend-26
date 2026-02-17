# SQL Research Questions

---

## 1. WHERE vs HAVING

Both filter data, but at different stages:

- **WHERE** filters **rows** before any grouping happens.
- **HAVING** filters **groups** after `GROUP BY` has been applied.

> Simple rule: If you're filtering on a raw column → use `WHERE`. If you're filtering on an aggregate (like `SUM`, `COUNT`) → use `HAVING`.

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
WHERE salary > 3000          -- filters individual rows first
GROUP BY department
HAVING COUNT(*) > 5;         -- filters groups after aggregation
```

---

## 2. DELETE vs TRUNCATE vs DROP

| Command | What it does | Can be Rolled Back? |
|---|---|---|
| `DELETE` | Removes specific rows (can use `WHERE`) | ✅ Yes |
| `TRUNCATE` | Removes **all** rows quickly, keeps the table structure | ❌ No (in most databases) |
| `DROP` | Removes the **entire table** (structure + data) | ❌ No |

- Use `DELETE` when you need to remove specific rows or need the option to undo.
- Use `TRUNCATE` when you want to empty a table fast.
- Use `DROP` when you want to completely get rid of the table.

---

## 3. Logical Order of Execution

Even though we *write* a query in this order:
`SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY`

The SQL engine *executes* it in this order:

1. `FROM` – identify the table(s)
2. `WHERE` – filter individual rows
3. `GROUP BY` – group the remaining rows
4. `HAVING` – filter the groups
5. `SELECT` – choose which columns to return
6. `ORDER BY` – sort the final result

This is why you **cannot use a SELECT alias in a WHERE clause** — the alias doesn't exist yet when WHERE is processed.

---

## 4. COUNT(*) vs COUNT(Column_Name)

- **`COUNT(*)`** counts **all rows**, including rows with NULL values.
- **`COUNT(column_name)`** counts only rows where that column is **not NULL**.

```sql
-- Table has 5 rows, but 2 have NULL in the 'phone' column

SELECT COUNT(*)     FROM users;  -- returns 5
SELECT COUNT(phone) FROM users;  -- returns 3
```

Use `COUNT(*)` to count total rows. Use `COUNT(column)` when you only want to count non-missing values in a specific field.

---

## 5. CHAR vs VARCHAR

Both store text, but they handle storage differently:

- **`CHAR(10)`** is **fixed-length**. It always uses exactly 10 characters of space. If you store "Cat" (3 chars), it pads the rest with spaces → `"Cat       "`.
- **`VARCHAR(10)`** is **variable-length**. It only uses as much space as needed. Storing "Cat" uses just 3 characters of space → `"Cat"`.

| | CHAR(10) storing "Cat" | VARCHAR(10) storing "Cat" |
|---|---|---|
| Space used | 10 characters (padded) | 3 characters only |
| Good for | Fixed-size data (e.g. country codes, gender flags) | Variable-size data (e.g. names, emails) |

> Use `CHAR` when all values will have the same length. Use `VARCHAR` for everything else to save storage space.