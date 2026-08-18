-- KPI'S
-- 1.Total Sales: The overall revenue generated from all items sold

select cast(sum(Total_Sales)/ 1000000 as decimal(10,2)) [Total_Sales_Millions]
from blinkit_data

select cast(sum(Total_Sales)/ 1000000 as decimal(10,2)) [Total_Sales_Millions]
from blinkit_data
where Outlet_Establishment_Year = 2022

-- 2.Average Sales: The average revenue per sale.

select cast(avg(Total_Sales) as decimal(10,0)) [Avg_Sales] from blinkit_data
where Outlet_Establishment_Year = 2022

-- 3.Number of Items: The total count of different items sold.

select count(*)  [No_of_items]
from blinkit_data
where Outlet_Establishment_Year = 2022

-- 4.Average Rating: The average customer rating for items sold. 

select cast(AVG(Rating) as decimal(10,2)) [Avg_Rating]
from blinkit_data