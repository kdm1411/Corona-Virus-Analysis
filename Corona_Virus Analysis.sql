create database corona_virus_database
use corona_virus_database

select * from corona_dataset

---Write a code to check NULL values---
select province from corona_dataset where province is null
select country_region from corona_dataset where country_region is null
select latitude from corona_dataset where latitude is null
select longitude from corona_dataset where longitude is null
select date from corona_dataset where date is null
select confirmed from corona_dataset where confirmed is null
select deaths from corona_dataset where deaths is null
select recovered from corona_dataset where recovered is null

---If NULL values are present, update them with zeros for all columns---
update corona_dataset set province = 0 where province is null;
update corona_dataset set country_region = 0 where country_region is null;
update corona_dataset set latitude = 0 where latitude is null;
update corona_dataset set longitude = 0 where longitude is null;
update corona_dataset set confirmed = 0 where confirmed is null;
update corona_dataset set deaths = 0 where deaths is null;
update corona_dataset set recovered = 0 where recovered is null;

---check total number of rows---
select count (*) as [Total Rows] from corona_dataset

---Check what is start_date and end_date---
select min(date) as [Start Date], max(date) as [End Date]
FROM corona_dataset;

---Number of month present in dataset---
select 
year(date) as year,
count(distinct month(date)) as [Total Months]
from corona_dataset
group by year(date);

---Find monthly average for confirmed, deaths, recovered---
select 
year(date) as year,
month(date) as month,
avg(confirmed) as [Average Confirmed],
avg(deaths) as [Average Deaths],
avg(recovered) as [Average Recovered] from corona_dataset
group by year(date), month(date)
order by year(date), month(date);

---Find most frequent value for confirmed, deaths, recovered each month---
with freq_cte as (
select confirmed,deaths,recovered,count(*) as freq from corona_dataset group by confirmed,deaths,recovered)
select * from freq_cte
where freq= (select max(freq) from freq_cte)


---Find minimum values for confirmed, deaths, recovered per year---
select
year(date) as year,
min(confirmed) as [Min Confirmed],
min(deaths) as [Min Death],
min(recovered) as [Min Recovered]
from corona_dataset
group by year(date)
order by year(date);

---Find maximum values of confirmed, deaths, recovered per year---
select
year(date) as year,
max(confirmed) as [Max Confirmed],
max(deaths) as [Max Death],
max(recovered) as [Max Recovered]
from corona_dataset
group by year(date)
order by year(date);

---The total number of case of confirmed, deaths, recovered each month---
select
year(date) as year,
month(date) as month,
sum(confirmed) as [Total Confirmed],
sum(deaths) as [Total Death],
sum(recovered) as [Total Recovered]
from corona_dataset
group by year(date), month(date)
order by year(date), month(date);

---Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )---
select 
sum(confirmed) as [Total Confirmed Cases],
avg(confirmed) as [Avgerage Confirmed Cases],
var(confirmed) as Variance,
stdev(confirmed) [STDEV Confirmed Cases]
from corona_dataset

---Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )---
select 
year(date) as year,
month(date) as month,
sum(deaths) as [Total Death Cases],
avg(deaths) as [Average Death Cases],
var(deaths) as [Variance Death cases],
stdev(deaths) [STDDEV Death Cases]
from corona_dataset
group by year(date), month(date)
order by year(date), month(date);

---Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )---
select 
sum(recovered) as [Total Recovered cases],
avg(deaths) as [Average Recovered Cases],
var(deaths) as [Variance Recovered],
stdev(confirmed) [STDDEVRecovered]
from corona_dataset;

---Find Country having highest number of the Confirmed case---
select top 1 country_region as [Country with highest numbers of confirmed cases], sum(confirmed) as [Total confirmed cases] from corona_dataset 
group by country_region
order by [Total confirmed cases] desc

---Find Country having lowest number of the death case---
select top 1 country_region, sum(deaths) as [Country with lowest number of death cases] from corona_dataset 
group by country_region
order by [Country with lowest number of death cases] asc

---Find top 5 countries having highest recovered case---
select top 5 country_region, sum(recovered) as [Countries having highest recovered cases] from corona_dataset 
group by country_region
order by [Countries having highest recovered cases] desc






