# Corona-Virus-Analysis - An SQL Project
![images](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/f59082f5-4d92-4a05-803e-1e8e03382deb)

### Project Overview.
---
The CORONA VIRUS pandemic has had a significant impact on public health and has created an urgent need for data-driven insight to understand the spread of the virus. As a data analyst, I analyzed the corona virus dataset to derive meaningful insights and present findings.

### Data Source.
---
Corona Virus Data: The dataset used for this analysis is Corona Virus Dataset.csv containing detail information of corona virus across the world between throughout 2020, with a peak in early 2021.

### Tools.
---

- SQL Server & Microsoft Power Point - Data Cleaning, Data Analysis & Creating Reports

### Data Cleaning.
---

In the initial Data prepartion phase, we performed the following tasks:

1. Data loading and inspections
2. Handling null values
   
```sql
select province from corona_dataset where province is null
select country_region from corona_dataset where country_region is null
select latitude from corona_dataset where latitude is null
select longitude from corona_dataset where longitude is null
select date from corona_dataset where date is null
select confirmed from corona_dataset where confirmed is null
select deaths from corona_dataset where deaths is null
select recovered from corona_dataset where recovered is null;
```

### Exploratory Data Analysis.
---

EDA involves exploring the Corona Virus data to answer key questions, such as:

1. Check what is start_date and end_date

2. Number of month present in dataset

3. Find monthly average for confirmed, deaths, recovered

4. Find most frequent value for confirmed, deaths, recovered each month 

5. The total number of case of confirmed, deaths, recovered each month

6. Check how corona virus spread out with respect to confirmed case
--(Eg.: total confirmed cases, their average, variance & STDEV )

7. Check how corona virus spread out with respect to death case per month
(Eg.: total confirmed cases, their average, variance & STDEV )

8. Check how corona virus spread out with respect to recovered case
Eg.: total confirmed cases, their average, variance & STDEV )

9. Find Country having highest number of the Confirmed case

10. Find Country having lowest number of the death case

11. Find top 5 countries having highest recovered case

### Data Analysis.
---

```sql
select min(date) as [Start Date], max(date) as [End Date]
FROM corona_dataset;
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/6ebbfe58-cd2c-4752-aaaf-6df9603dec73)

```sql
select 
year(date) as year,
count(distinct month(date)) as [Total Months]
from corona_dataset
group by year(date);
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/f2d731f4-a4df-482c-ad61-34b93d741454)

```sql
select 
year(date) as year,
month(date) as month,
avg(confirmed) as [Average Confirmed],
avg(deaths) as [Average Deaths],
avg(recovered) as [Average Recovered] from corona_dataset
group by year(date), month(date)
order by year(date), month(date);
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/fc4cdf9e-31e5-4da2-b11d-5180fcdfb4db)

```sql
with freq_cte as (
select confirmed,deaths,recovered,count(*) as freq from corona_dataset group by confirmed,deaths,recovered)
select * from freq_cte
where freq= (select max(freq) from freq_cte)
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/bc53331c-13bb-4f23-859b-227c5e9280ae)

```sql
select 
year(date) as year,
month(date) as month,
count(confirmed) as most_frequent_confirmed,
count(deaths) as most_frequest_deaths,
count(recovered) as most_frequent_recovered
from corona_dataset 
group by year(date), month(date) 
order by year(date),month( date)asc
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/001beb0d-38c7-49e2-807f-32d393a3b9e3)

```sql
select
year(date) as year,
month(date) as month,
sum(confirmed) as [Total Confirmed],
sum(deaths) as [Total Death],
sum(recovered) as [Total Recovered]
from corona_dataset
group by year(date), month(date)
order by year(date), month(date);
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/c22b0d7e-40f3-48c2-b185-fa51fd9ae796)

```sql
select 
sum(confirmed) as [Total Confirmed Cases],
avg(confirmed) as [Avgerage Confirmed Cases],
var(confirmed) as Variance,
stdev(confirmed) [STDEV Confirmed Cases]
from corona_datase
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/60935ca6-5d99-4a70-87e8-ee6058c8af0a)

```sql
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
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/d7ee27df-e87d-40c4-a493-c49cf972e52d)

```sql
select 
sum(recovered) as [Total Recovered cases],
avg(deaths) as [Average Recovered Cases],
var(deaths) as [Variance Recovered],
stdev(confirmed) [STDDEVRecovered]
from corona_dataset;
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/f1933b37-1576-4ffd-afb6-b9e695cc4909)

```sql
select top 1 country_region as [Country with highest numbers of confirmed cases], sum(confirmed) as [Total confirmed cases] from corona_dataset 
group by country_region
order by [Total confirmed cases] desc
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/100c9521-97d8-4dec-8d66-99f2ee4120b8)

```sql
select top 1 country_region, sum(deaths) as [Country with lowest number of death cases] from corona_dataset 
group by country_region
order by [Country with lowest number of death cases] asc
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/671fcb78-7290-443e-a83e-329e0c9883e2)

```sql
select top 5 country_region, sum(recovered) as [Countries having highest recovered cases] from corona_dataset 
group by country_region
order by [Countries having highest recovered cases] desc
```
![image](https://github.com/kdm1411/Corona-Virus-Analysis/assets/150349346/2b06eff7-ea05-4a4e-b4b0-23c6fbf52d50)

### Results.
---
The analysis revealed a rapid escalation of Covid-19 cases throughout 2020, with a peak in early 2021. Post vaccination , death rate began to stabilize, and there was noticeable improvements in recovery rates, attributable to enhanced treatment protocol and healthcare response.

### Conclusion.
---
Moving forward, research should be focus on evaluating the long-term efficacy of vaccines and the impacts on virus mutations, ensuring that strategies adapt to evolving pandemic dynamics.












