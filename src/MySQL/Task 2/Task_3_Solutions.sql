# First problem
SELECT tweet_id FROM Tweets WHERE Length(content) > 15;

# Second problem
SELECT user_id, CONCAT(UPPER(SUBSTR(name, 1, 1)), LOWER(SUBSTR(name, 2))) as name FROM Users ORDER BY user_id;

# Third problem
SELECT employee_id,
    CASE
        WHEN NOT name LIKE "M%" AND employee_id%2 = 1 THEN salary
        ELSE 0
    END as bonus
FROM Employees ORDER BY employee_id;

# Fourth problem
SELECT * FROM Patients WHERE conditions LIKE "DIAB1%" OR conditions LIKE "% DIAB1%";

# Fifth problem
SELECT event_day as day, emp_id, SUM(out_time - in_time) as total_time FROM Employees GROUP BY event_day, emp_id;

# Sixth problem
SELECT user_id, COUNT(follower_id) as followers_count FROM Followers GROUP BY user_id ORDER BY user_id;

# Seventh problem
SELECT 
    date_id, 
    make_name, 
    COUNT(DISTINCT lead_id) as unique_leads, 
    COUNT(DISTINCT partner_id) as unique_partners
FROM DailySales
GROUP BY 
    date_id, 
    make_name;

# Eighth problem
SELECT 
    actor_id, 
    director_id
FROM 
    ActorDirector
GROUP BY 
    actor_id, 
    director_id
HAVING COUNT(*) >= 3;

# Ninth problem
SELECT 
    class 
FROM 
    Courses 
GROUP BY 
    class 
HAVING COUNT(*) >= 5;

# Tenth problem
SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id;

# Eleventh problem
SELECT stock_name, SUM(
    CASE
        WHEN operation = "Buy" THEN 0 - price
        ELSE price
    END
) AS capital_gain_loss FROM Stocks GROUP BY stock_name;

# Twelfth problem
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);