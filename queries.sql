create database Ola;
use Ola;
--1. Retrieve all successful bookings:
create view successful_bookings as 
select * from bookings where Booking_Status = 'Success';

select*from successful_bookings;


--2. Find the average ride distance for each vehicle type:
 create view ride_distance_for_each_vehicle_type as
 select Vehicle_Type, Avg(Ride_Distance) as avg_distance
 from bookings 
 group by Vehicle_Type;
 
select * from ride_distance_for_each_vehicle_type ;
 
 

--3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers as 
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers;


--4. List the top 5 customers who booked the highest number of rides:
create view highest_number_of_rides as
select Customer_ID, count(Booking_ID) as total_rides from bookings 
group by Customer_ID
order by total_rides desc limit 5;

select * from highest_number_of_rides;


--5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers_due_to_personal_and_car_related_issues as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select* from cancelled_by_drivers_due_to_personal_and_car_related_issues;


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_ratings_by_drivers_PS as
select max(Driver_Ratings) as max_rating, min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = 'Prime Sedan';

select * from max_min_ratings_by_drivers_PS;


--7. Retrieve all rides where payment was made using UPI:
create view payment_using_UPI as
select Booking_ID, Payment_Method from bookings
where Payment_Method= 'UPI';

select*from payment_using_UPI ;

--8. Find the average customer rating per vehicle type:
create view avg_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as avg_ratings from bookings
group by Vehicle_Type;

select * from avg_customer_rating;

--9. Calculate the total booking value of rides completed successfully:
create view total_booking_value as
select sum(Booking_Value) as total_booking_value from bookings 
where Booking_Status = 'Success';

select*from total_booking_value;


--10. List all incomplete rides along with the reason:
create view incomplete_ride as
select  Booking_ID, Incomplete_Rides_Reason from bookings 
where Incomplete_Rides= 'Yes';

select * from incomplete_ride;