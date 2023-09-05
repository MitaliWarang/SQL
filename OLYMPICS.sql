# OLYMPICS SQL PROJECT 

USE OLYMPICS;
SELECT * FROM OLYMPICS_HISTORY;
SELECT * FROM OLYMPICS_HISTORY_NOC_REGION;


# Q1.  How many olympics games have been held?
select count(distinct games) as Total_olympic_games from olympics_history;

# Q2. List down all Olympics games held so far?
select distinct games , city as ALL_olympic_games from olympics_history order by games asc;



# Q3. How many athletes won the gold medal?
select count(distinct nameof) from olympics_history where medal = "gold";


# Q4. WHICH TEAMS PARTICIPATED IN 1992 SUMMER GAMES?
select team , games
from olympics_history
where games = "1992 SUmmer"
group by team;   

# Q5. Top 3 cities in terms of total number of medals?
select city , count(medal) as total_medals 
from olympics_history
group by city
order by total_medals desc 
limit 3;

# Q6. Average age of female and male athletes who won medal?
select avg(age), sex 
from olympics_history 
where medal = "Gold"
GROUP BY sex;


# Q7. TOP 5 SPORTS IN WHICH FEMALE ATHLETES HAVE WON THE MOST MEDALS?
select sport, count(medal) as total_medals
from olympics_history
where sex = "F"
group by sport
order by total_medals desc
limit 5;

# Q8. Mention the total no of nations who participated in each olympics game?
with all_countries as
(select region,games
from olympics_history as OH
join olympics_history_noc_regions on oh.noc = olympics_history_noc_regions.noc)
select games, count(region) as total_countries
    from all_countries
    group by games
    order by games asc;

# Q9. SHOW HOW MANY MALES AND FEMALES PARTICIPATED FROM ALL COUNTRIES?
with all_countries as
(
select sex, region
from olympics_history as oh
join olympics_history_noc_regions on oh.noc = olympics_history_noc_regions.noc)
select sex, count( region) as total_countries
    from all_countries
    group by sex;

# Q10. SHOW COUNTRY STARTING WITH LETTER A WHO WON HIGHEST MEDALS?
with all_countries as
(
select MEDAL, region
from olympics_history as oh
join olympics_history_noc_regions on oh.noc = olympics_history_noc_regions.noc)
select region, count(medal) from all_countries 
group by region
order by region asc;





          	
          
 
 



