select * from death_by_year_projet
select * from sex_year_age_project
select * from year_month_project

select * from year_month_project
where expected_mean is null

Alter table death_by_year_projet
add constraint PK_excess_mean Primary key (excess_mean)

Alter table sex_year_age_project
add constraint PK_acm_mean Primary key (acm_mean)

Alter table year_month_project
add constraint PK_expected_mean Primary key (expected_mean)

Task 1
select * from death_by_year_projet
select * from year_month_project


Task 2
select *
from death_by_year_projet
where year = (2020) 

Task 3
select count(excess_mean) as total_death
from death_by_year_projet

Task 4
select distinct year from death_by_year_projet

Task 5
select *from sex_year_age_project where sex = 'female'

task 6
select AVG (excess_high) from death_by_year_projet

Task 7
select location,sum(excess_mean) as total_death
from death_by_year_projet group by location

Task 8
select MAX (excess_high) AS max_excessdeath from death_by_year_projet
select Min (excess_high) AS min_excessdeath from death_by_year_projet

Task 9
select count (age_group) AS count_age from sex_year_age_project Group by age_group

Task 10
select *
from year_month_project
WHERE cumul_excess_high > expected_mean

Task 11
create table #temp_TO
(location varchar(50), total_excessdeath int, year varchar(50))
insert into #temp_TO
select location, sum(excess_mean), year from death_by_year_projet group by location, year

select* from #temp_TO

Task 12
select death_by_year_projet.location, count (death_by_year_projet.location) as year
 from death_by_year_projet
 join year_month_project
 on death_by_year_projet.excess_mean=year_month_project.excess_mean
 group by death_by_year_projet.location
 having count (death_by_year_projet.location)>= null

 SELECT death_by_year_projet.excess_mean, death_by_year_projet.location, death_by_year_projet.year, year_month_project.location, year_month_project.year FROM death_by_year_projet
LEFT JOIN yearmonth ON death_by_yearprojet.location=year_month_project.location
WHERE death_by_year_projet.excess_mean=year_month_project.excess_mean

 Task 13
 select* from #temp_TO
 select location, sum(excess_mean), year from death_by_year_projet where year = '2020'
 group by location, year 

 Task 14
select year_month_project.acm_mean, count (year_month_project.expected_mean) as Actual_Death from year_month_project
 join death_by_year_projet on death_by_year_projet.excess_mean=death_by_year_projet.year
 group by year_month_project.acm_mean 

 select year_month_project.acm_mean, count (year_month_project.acm_mean) as Actual_Death
 from year_month_project
 join death_by_year_projet on year_month_project.location=death_by_year_projet.location
 group by year_month_project.acm_mean
 Having COUNT (year_month_project.acm_mean)=2020 

 Task 15
 SELECT sex_year_age_project.age_group, sex_year_age_project.location, sex_year_age_project.year, AVG(sex_year_age_project.excess_mean) AS avg_excess_mean
FROM sex_year_age_project WHERE sex_year_age_project.year='2020'
 GROUP BY sex_year_age_project.age_group,sex_year_age_project.location, sex_year_age_project.year


 Task 16
 CREATE TABLE #temp_exp (
location varchar(50), expected_deaths int, actual_death int )
INSERT INTO #temp_exp
SELECT location,  expected_mean, excess_mean FROM sex_year_age_project ORDER BY location

--Open a case
SELECT * FROM #temp_exp

Task 17
SELECT location,  excess_mean, year, sex FROM sex_year_age_project WHERE year = '2021' 
ORDER BY excess_mean DESC

Task 18
SELECT sex_year_age_project.age_group, sex_year_age_project.location, sex_year_age_project.year, SUM (sex_year_age_project.excess_mean) AS total_excess_mean
 FROM sex_year_age_project
LEFT JOIN year_month_project ON sex_year_age_project.location=year_month_project.location
WHERE sex_year_age_project.year = '2020'
GROUP BY sex_year_age_project.age_group,sex_year_age_project.location, sex_year_age_project.year

Task 19
SELECT year_month_project.location FROM year_month_project
WHERE year_month_project.excess_mean=year_month_project.acm_mean

Task 20
SELECT death_by_year_projet.location, death_by_year_projet.year, SUM(death_by_year_projet.excess_mean) AS tot_excess_deaths FROM death_by_year_projet
LEFT JOIN sex_year_age_project ON death_by_year_projet.excess_mean=sex_year_age_project.excess_mean
LEFT JOIN year_month_project ON sex_year_age_project.excess_mean=year_month_project.excess_mean
GROUP BY death_by_year_projet.location, death_by_year_projet.year, death_by_year_projet.excess_mean
