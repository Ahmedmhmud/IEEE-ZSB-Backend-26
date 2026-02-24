# First problem
SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;

# Second problem
SELECT 
    EmployeeUNI.unique_id,
    Employees.name 
FROM Employees 
LEFT JOIN EmployeeUNI 
    ON EmployeeUNI.id = Employees.id

# Third problem
SELECT 
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans 
FROM Visits v 
LEFT JOIN Transactions t 
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

# Fourth problem
SELECT 
    p.project_id, 
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM 
    Project p 
INNER JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;

# Fifth problem
SELECT 
    s.name
FROM SalesPerson s
LEFT JOIN Orders o 
    ON s.sales_id = o.sales_id
LEFT JOIN Company c 
    ON o.com_id = c.com_id AND c.name = 'RED'
GROUP BY s.name
HAVING COUNT(c.name) = 0;

# Sixth problem
SELECT 
    w.id 
FROM Weather w, Weather ww
WHERE w.temperature > ww.temperature AND DATEDIFF(w.recordDate, ww.recordDate) = 1
ORDER BY w.id ASC;

# Seventh problem
SELECT 
    a1.machine_id, 
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time 
FROM 
    Activity a1
JOIN Activity a2 
    ON a2.process_id = a1.process_id AND a2.machine_id = a1.machine_id AND a1.activity_type = 'start' AND a2.activity_type = 'end'
GROUP BY a1.machine_id;

# Eighth problem
SELECT 
    s.student_id, 
    s.student_name, 
    su.subject_name, 
    COUNT(e.student_id) AS attended_exams 
FROM 
    Students S
CROSS JOIN Subjects su
LEFT JOIN Examinations e 
    ON e.student_id = s.student_id AND e.subject_name = su.subject_name
GROUP BY s.student_id, s.student_name, su.subject_name
ORDER BY s.student_id, s.student_name, su.subject_name ASC;

# Ninth problem
SELECT 
    e1.name 
FROM Employee e1
JOIN Employee e2 ON e1.id = e2.managerId
GROUP BY e2.managerId
HAVING COUNT(*) >= 5;

# Tenth problem
SELECT 
    s.user_id, 
    ROUND(AVG(
                CASE
                    WHEN c.action = 'confirmed' THEN 1.0
                    ELSE 0
                END
            ), 2) AS confirmation_rate 
FROM Signups s
LEFT JOIN Confirmations c ON c.user_id = s.user_id
GROUP BY s.user_id;

# Eleventh problem
SELECT 
    product_id, 
    year AS first_year, 
    quantity, 
    price 
FROM sales
WHERE (product_id, year) IN (
                                SELECT 
                                    product_id, 
                                    MIN(year) 
                                FROM Sales 
                                GROUP BY product_id
                            );

# Twelfth problem
SELECT 
    u.user_id AS buyer_id, 
    min(join_date) AS join_date, 
    SUM(
        CASE
            WHEN YEAR(order_date) = 2019 THEN 1
            ELSE 0
        END
    ) AS orders_in_2019 
FROM Users u
LEFT JOIN Orders o ON o.buyer_id = u.user_id
GROUP BY u.user_id
ORDER BY u.user_id ASC;