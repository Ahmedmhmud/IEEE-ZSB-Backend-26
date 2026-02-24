## 1. UNION vs UNION ALL

**Duplicate Handling:**
- `UNION` removes duplicate rows from the result.
- `UNION ALL` keeps all rows, including duplicates.

**Performance:**
- `UNION` is slower because it does extra work to find and remove duplicates.
- `UNION ALL` is faster because it just combines the results without any extra processing.

Use `UNION ALL` when you don't need to remove duplicates — it's always the faster choice.

---

## 2. Subquery vs JOIN

Most subqueries can be rewritten as JOINs. In a real production environment, JOINs are usually preferred because:

- **Faster:** The database is optimized for JOINs and can use indexes better.
- **Easier to read:** Other developers can understand JOINs more quickly.
- **More flexible:** You can easily access columns from both tables.
- **Avoids slow re-execution:** Some subqueries run once per row, which is very slow on large tables.

**Example:**

```sql
-- Subquery
SELECT name FROM employees
WHERE dept_id IN (SELECT id FROM departments WHERE location = 'NY');

-- JOIN (better)
SELECT e.name FROM employees e
JOIN departments d ON e.dept_id = d.id
WHERE d.location = 'NY';
```

Use JOINs in production for better performance and readability.