# First problem
SELECT email FROM Person GROUP BY email HAVING COUNT(email) > 1;

# Second problem
DELETE FROM Person
WHERE id NOT IN(
    SELECT id FROM(
        SELECT MIN(id) AS id
        FROM Person
        GROUP BY email
    ) AS man
);

# Third problem
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      SELECT salary
      FROM Employee e1
      WHERE N = (
          SELECT COUNT(DISTINCT e2.salary)
          FROM Employee e2
          WHERE e2.salary >= e1.salary
      )
      LIMIT 1
  );
END;

# Fourth problem
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
FROM Scores
ORDER BY score DESC;

# Fifth problem
SELECT 
    dept.name AS Department,
    emp.name AS Employee,
    emp.salary AS Salary
FROM Employee emp
JOIN Department dept ON emp.departmentId = dept.id
WHERE emp.salary = (
    SELECT 
        MAX(e.salary)
    FROM Employee e
    WHERE e.departmentId = emp.departmentId
);