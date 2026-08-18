-- CHART'S REQUIREMENT
-- 1.Percentage of Sales by Outlet Size:
	/*
	Objective: Analyze the correlation between outlet size and total sales.
	*/

select Outlet_Size,
       cast(sum(Total_Sales) as decimal(10,2)) as Total_Sales,
	   cast((sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over()) as decimal(10,2) ) as Sales_Percentage
from blinkit_data
group by Outlet_Size
order by Total_Sales Desc

-- 2.Sales by Outlet Location:
	/*
	Objective: Assess the geographic distribution of sales across different locations.
	*/
	select Outlet_Location_Type,
	cast(sum(Total_Sales) as decimal(10,2)) [Total_Sales],
	cast((sum(Total_Sales) * 100.0 / sum(sum(Total_Sales)) over()) as decimal(10,2) ) as Sales_Percentage,
	cast(avg(Total_Sales) as decimal(10,1)) [Avg_Sales],
	count(*)  [No_of_items],
	cast(AVG(Rating) as decimal(10,2)) [Avg_Rating]
from blinkit_data
group by Outlet_Location_Type
order by Total_Sales desc

-- 3.All Metrics by Outlet Type:
	/*
	Objective: Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of 	Items, Average Rating) broken down by different outlet types.
	*/

SELECT Outlet_Type, 
		CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
		CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS Avg_Sales,
		COUNT(*) AS No_Of_Items,
		CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating,
		CAST(AVG(Item_Visibility) AS DECIMAL(10,2)) AS Item_Visibility
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC