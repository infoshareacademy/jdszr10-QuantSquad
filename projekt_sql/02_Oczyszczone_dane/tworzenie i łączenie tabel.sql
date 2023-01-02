

 create table year2015 ( "Year" varchar, "HappiRank" numeric, "Country" varchar, "Region" varchar, 
 "HappiScore" numeric, "GDP" numeric, "Health" numeric, "Freedom" numeric, "Generosity" numeric,
 "Trust" numeric, "SocSupport" numeric)
 
 create table year2016 ( "Year" varchar, "HappiRank" numeric, "Country" varchar, "Region" varchar, 
 "HappiScore" numeric, "GDP" numeric, "Health" numeric, "Freedom" numeric, "Generosity" numeric,
 "Trust" numeric, "SocSupport" numeric)
 
 create table year2017 ( "Year" varchar, "HappiRank" numeric, "Country" varchar, "Region" varchar, 
 "HappiScore" numeric, "GDP" numeric, "Health" numeric, "Freedom" numeric, "Generosity" numeric,
 "Trust" numeric, "SocSupport" numeric)
 
 create table year2018 ( "Year" varchar, "HappiRank" numeric, "Country" varchar, "Region" varchar, 
 "HappiScore" numeric, "GDP" numeric, "Health" numeric, "Freedom" numeric, "Generosity" numeric,
 "Trust" numeric, "SocSupport" numeric)
 
 create table year2019 ( "Year" varchar, "HappiRank" numeric, "Country" varchar, "Region" varchar, 
 "HappiScore" numeric, "GDP" numeric, "Health" numeric, "Freedom" numeric, "Generosity" numeric,
 "Trust" numeric, "SocSupport" numeric)
 
 
 create table AllYears as 
select 
	'2015' as "Year","HappiRank","Country","Region","HappiScore","GDP","Health","Freedom"
	,"Generosity","Trust","SocSupport"
from year2015
union
select 
	'2016' as "Year","HappiRank", "Country","Region","HappiScore","GDP","Health", "Freedom",      "Generosity", "Trust","SocSupport"
from year2016
union
select 
	'2017' as "Year","HappiRank","Country","Region","HappiScore","GDP","Health","Freedom"
	,"Generosity","Trust","SocSupport"
from year2017
union
select
	'2018' as "Year","HappiRank","Country","Region","HappiScore","GDP","Health","Freedom"
	,"Generosity","Trust","SocSupport"
from year2018 
union
select 
	'2019' as "Year","HappiRank","Country","Region","HappiScore","GDP","Health","Freedom"
	,"Generosity","Trust","SocSupport"
from year2019 
order by 1, 2
 