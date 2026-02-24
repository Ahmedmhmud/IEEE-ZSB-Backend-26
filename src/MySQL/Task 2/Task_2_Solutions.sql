# First problem
SELECT product_id FROM Products WHERE low_fats = 'Y' AND recyclable = 'Y'

# Second problem
SELECT name, population, area FROM World WHERE area >= 3000000 OR population >= 25000000

# Third problem
SELECT name FROM Customer WHERE referee_id is null OR referee_id != 2
