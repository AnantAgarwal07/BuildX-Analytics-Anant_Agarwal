-- What are the restaurants in HSR area which cost less than 500 per person?
SELECT restaurant_name, cost_per_person FROM zomato WHERE area = 'Hsr' AND cost_per_person < 500;

-- How many restaurants are in a category and what is the average cost for two person in that category? 
SELECT rating_category, COUNT(restaurant_name) AS total_restaurants, ROUND(AVG(avg_cost_two_peo),2) AS avg_cost_for_two
FROM zomato
GROUP BY rating_category;

-- What are the top 10 most expensive restaurants for two?
SELECT restaurant_name, avg_cost_two_peo FROM zomato ORDER BY avg_cost_two_peo DESC LIMIT 10;

-- Which area are the most competitive having more than 50 restaurants listed?
SELECT area, COUNT(restaurant_name) AS total_restaurants FROM zomato GROUP BY area HAVING COUNT(restaurant_name) > 50 ORDER BY COUNT(restaurant_name) DESC;

-- Which restaurants fall under the mid-range budget between 1000 and 2000 for two people?
SELECT restaurant_name, avg_cost_two_peo FROM zomato WHERE avg_cost_two_peo BETWEEN 1000 AND 2000;

-- What are the top 5 areas with the highest avg. rating, only checking those with more than 20 restaurants to ensure statistical accuracy?
SELECT area, ROUND(AVG(avg_cost_two_peo),2) as average_rating FROM zomato GROUP BY area HAVING COUNT(restaurant_name)>20 ORDER BY AVG(avg_cost_two_peo) desc LIMIT 5;