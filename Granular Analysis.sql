----Granular Requirements

select * from blinkit_data

-- 1.Total Sales by Fat Content:
	/* 
	Objective: Analyze the impact of fat content on total sales.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
    */
select Item_Fat_Content,
	cast(sum(Total_Sales)/1000 as decimal(10,2)) [Total_Sales_Thousands],
	cast(avg(Total_Sales) as decimal(10,1)) [Avg_Sales],
	count(*)  [No_of_items],
	cast(AVG(Rating) as decimal(10,2)) [Avg_Rating]
from blinkit_data
group by Item_Fat_Content

-- 2. Total Sales by Item Type:
	/*
	Objective: Identify the performance of different item types in terms of total sales.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
    */
select Item_Type,
	cast(sum(Total_Sales) as decimal(10,2)) [Total_Sales],
	cast(avg(Total_Sales) as decimal(10,1)) [Avg_Sales],
	count(*)  [No_of_items],
	cast(AVG(Rating) as decimal(10,2)) [Avg_Rating]
from blinkit_data
group by Item_Type

-- 3.Fat Content by Outlet for Total Sales:
    /*
	Objective: Compare total sales across different outlets segmented by fat content.
	Additional KPI Metrics: Assess how other KPIs (Average Sales, Number of Items, Average Rating) vary with fat content.
    */
	select Outlet_Location_Type,Item_Fat_Content,
	cast(sum(Total_Sales) as decimal(10,2)) [Total_Sales]
from blinkit_data
group by Outlet_Location_Type,Item_Fat_Content
 
     --    OR

	SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM blinkit_data
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type

 -- 4.Total Sales by Outlet Establishment:
	/*
	Objective: Evaluate how the age or type of outlet establishment influences total sales.
	*/

select Outlet_Establishment_Year,
	cast(sum(Total_Sales) as decimal(10,2)) [Total_Sales],
	cast(avg(Total_Sales) as decimal(10,1)) [Avg_Sales],
	count(*)  [No_of_items],
	cast(AVG(Rating) as decimal(10,2)) [Avg_Rating]
from blinkit_data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year