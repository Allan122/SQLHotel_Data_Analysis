-- Question 1: What is the total number of reservations in the dataset?

SELECT COUNT(*) AS total_reservations FROM hotel_data_analysis;

-- Answer 1: The total number of reservations in the dataset is 700.



-- Question 2: Which meal plan is the most popular among guests?

SELECT type_of_meal_plan, COUNT(*) AS total_count
FROM hotel_data_analysis
GROUP BY type_of_meal_plan
ORDER BY total_count DESC
LIMIT 1;

-- Answer 2: The most popular meal plan among guests is Meal Plan 1 with a count of 527.



-- Question 3: What is the average price per room for reservations involving children?

SELECT AVG(CAST(avg_price_per_room AS NUMERIC)) AS avg_price
FROM hotel_data_analysis
WHERE CAST(no_of_children AS INTEGER) > 0;

-- Answer 3: The average price per room for reservations involving children is $144.5683333333333333.



-- Question 4: How many reservations were made for the year 2017 (replace 2017 with the desired year)? 

SELECT COUNT(*) AS reservations_2017
FROM hotel_data_analysis
WHERE TO_DATE(arrival_date, 'DD-MM-YYYY') >= '2017-01-01' AND TO_DATE(arrival_date, 'DD-MM-YYYY') < '2018-01-01';

-- Answer 4: Reservations made for the year 2017 is 78.


-- 5. What is the most commonly booked room type? 

SELECT room_type_reserved, COUNT(*) AS total_count
FROM hotel_data_analysis
GROUP BY room_type_reserved
ORDER BY total_count DESC
LIMIT 1;

-- Answer 5: Most commonly used room type is Room_Type_1 with a total count of 534.



-- Question 6: How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT COUNT(*) AS no_of_reservations_on_weekend
FROM hotel_data_analysis
WHERE CAST(no_of_weekend_nights AS INTEGER) > 0;

-- Answer 6: There are 383 reservations that fall on a weekend.


-- 7. What is the highest and lowest lead time for reservations? 

SELECT MAX(lead_time) AS max_lead_time, MIN(lead_time) AS min_lead_time
FROM hotel_data_analysis;

-- Answer 7: The highest lead time for reservation is 443 and the lowest lead time is 0.



---- Question 8: What is the most common market segment type for reservations?

SELECT market_segment_type, COUNT(*) AS total_count
FROM hotel_data_analysis
GROUP BY market_segment_type
ORDER BY total_count DESC
LIMIT 1;

-- Answer 8: The most common market segment type for reservation is Online with a total count of 518.



-- 9. How many reservations have a booking status of "Confirmed"? 

SELECT COUNT(*) AS confirmed_reservations
FROM hotel_data_analysis
WHERE booking_status = 'Confirmed';

-- Answer 9: Booking status of "Confirmed" reservations is 0.



-- 10. What is the total number of adults and children across all reservations? 

SELECT SUM(CAST(no_of_adults AS INTEGER)) AS total_adults, 
SUM(CAST(no_of_children AS INTEGER)) AS total_children
FROM hotel_data_analysis;

-- Answer 10: Reservation for the total number of adults is 1316 and children is 69.



-- 11. What is the average number of weekend nights for reservations involving children? 

SELECT AVG(CAST(no_of_weekend_nights AS INTEGER)) AS avg_weekend_nights
FROM hotel_data_analysis
WHERE CAST(no_of_children AS INTEGER) > 0;

-- Answer 11. The average number of weekened nights for reservation involving children is 1.00000000000000000000.



-- 12. How many reservations were made in each month of the year?

SELECT EXTRACT(MONTH FROM TO_DATE(arrival_date, 'DD-MM-YYYY')) AS month, COUNT(*) AS reservations_count
FROM hotel_data_analysis
GROUP BY EXTRACT(MONTH FROM TO_DATE(arrival_date, 'DD-MM-YYYY'))
ORDER BY month;

-- Answer 12: Reservations made in each month of the year are as follows:
-- January - 11, February - 28, March - 52, April - 67, May - 55,
-- June - 84, July - 44, August - 70, September - 80, October - 103,
-- November - 54, December - 52.



-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? 

SELECT room_type_reserved,
AVG(CAST(no_of_weekend_nights AS numeric) + CAST(no_of_week_nights AS numeric)) AS avg_nights
FROM hotel_data_analysis
GROUP BY room_type_reserved
ORDER BY room_type_reserved;

-- Answer 13: The average number of nights (both weekend and weekday) 
-- spent by guests for each room type is calculated as follows:
-- Room Type 1: 2.8782771535580524
-- Room Type 2: 3.0000000000000000
-- Room Type 4: 3.8000000000000000
-- Room Type 5: 2.5000000000000000
-- Room Type 6: 3.6111111111111111
-- Room Type 7: 2.6666666666666667



-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 

SELECT room_type_reserved, AVG(CAST(avg_price_per_room AS numeric)) AS Avg_Price
FROM hotel_data_analysis
WHERE CAST(no_of_children AS INTEGER) > 0
GROUP BY room_type_reserved
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Answer 14: For reservation involving children, the most common room type is Room_Type 1. 
-- The average price for this room type is $123.1229166666666667 



-- 15. Find the market segment type that generates the highest average price per room.

SELECT market_segment_type, AVG(CAST(avg_price_per_room AS NUMERIC)) AS Avg_Price_Per_Room
FROM hotel_data_analysis
GROUP BY market_segment_type
ORDER BY Avg_Price_Per_Room DESC
LIMIT 1;

-- Answer 15: The market segment type "Online" generates the highest average price per room, 
-- with an average price of approximately $112.4552123552123552.
