use ev_co2;

select * from co2_analysis;

#1.	Retrieve all data for the year 2023.
create view data_2023 as
select * from co2_analysis
where Year="2023";
select * from data_2023;

#2.Find the average CO2 reduction percentage for each manufacturer
create view CO2_per_manufacturer as
select Manufacturer, avg(CO2_Reduction_percentage)
as  AVG_CO2 from co2_analysis
group by Manufacturer;

#3.	Get the total CO2 savings by region.
create view co2_saving_according_region as
select Region, count(CO2_Savings) as total_co2_sav 
from co2_analysis group by Region;

#4.	List the top 5 models with the highest sales volume.
create view High_sales_vloume as
select Model, count(Sales_Volume) as Top_models_high_sales
from co2_analysis
group by Model
order by Top_models_high_sales DESC limit 5;

#5.	Get the number of models with a CO2 reduction percentage above 80%.
create view Co2_percent_no_models as
SELECT Model, COUNT(Model) 
FROM co2_analysis 
WHERE CO2_Reduction_percentage > 75
GROUP BY Model;

#6.	Find the maximum and minimum price of vehicles for each manufacturer.
create view MAX_price_manufrs as
select Manufacturer,max(Price) from 
co2_analysis 
group by Manufacturer;

select * from MAX_price_manufrs;

create view MIN_price_manufrs as
select Manufacturer,min(Price)from 
co2_analysis
group by Manufacturer;

select * from MIN_price_manufrs;

#7.	Retrieve all data where the CO2 emissions from traditional vehicles are above 4000 kg/year.
SELECT * 
FROM co2_analysis
WHERE CO2_Emissions_Traditional_Vehicle > 4000;

#8.	Find the average CO2 emissions reduction per vehicle type.
create view CO2_saved_reduction as
select Vehicle_Type, avg(CO2_Savings)
from co2_analysis
group by Vehicle_Type;

#9.	Get the total CO2 savings from EVs for each region.
create view Regional_CO2_savings as
select region, count(CO2_Savings)
from co2_analysis
group by Region;

#10.List the top 3 manufacturers by total CO2 reduction percentage.
create view TOP3_CO2reductn_manuf as
select Manufacturer, count(CO2_Savings) as CO2_red_perct
from co2_analysis
group by Manufacturer
order by CO2_red_perct DESC limit 3 ;
