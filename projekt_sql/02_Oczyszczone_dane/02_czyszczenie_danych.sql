-- Sprawdzenie czy kraj wystepuje w kazdym roku oraz roznic w nazwach
select a."Country" ,
lag(a."Country") over (order by a."Country") as "Porownanie_kraju",
count(*) as "Liczba_krajow"
from "AllYears" a
group by a."Country" 
having count(*)<>5
order by a."Country" 


-- zmiana nazw krajow

update "AllYears" set "Country"= 'Hong Kong' where "Country" = 'Hong Kong S.A.R., China';
update "AllYears" set "Country"= 'North Cyprus' where "Country" = 'Northern Cyprus';
update "AllYears" set "Country"= 'Somaliland Region' where "Country" = 'Somaliland region';
update "AllYears" set "Country"= 'Taiwan' where "Country" = 'Taiwan Province of China';
update "AllYears" set "Country"= 'Trinidad and Tobago' where "Country" = 'Trinidad & Tobago';

-- usuniecie krajow ktore nie wystepuja w 5 latach
delete from "AllYears" where "Country"= 'Angola';
delete from "AllYears" where "Country"= 'Belize';
delete from "AllYears" where "Country"= 'Central African Republic';
delete from "AllYears" where "Country"= 'Comoros';
delete from "AllYears" where "Country"= 'Djibouti';
delete from "AllYears" where "Country"= 'Gambia';
delete from "AllYears" where "Country"= 'Laos';
delete from "AllYears" where "Country"= 'Lesotho';
delete from "AllYears" where "Country"= 'Macedonia';
delete from "AllYears" where "Country"= 'Mozambique';
delete from "AllYears" where "Country"= 'Namibia';
delete from "AllYears" where "Country"= 'North Macedonia';
delete from "AllYears" where "Country"= 'Oman';
delete from "AllYears" where "Country"= 'Puerto Rico';
delete from "AllYears" where "Country"= 'Somalia';
delete from "AllYears" where "Country"= 'Somaliland Region';
delete from "AllYears" where "Country"= 'South Sudan';
delete from "AllYears" where "Country"= 'Sudan';
delete from "AllYears" where "Country"= 'Suriname';
delete from "AllYears" where "Country"= 'Swaziland';


--- uzupełnienie wartosci z kolumny Regon								
update "AllYears" ay set "Region" = (select ay1."Region"
									  from "AllYears" ay1
								      where ay1."Country" = ay."Country" 
								      and ay1."Year" = '2015'
								      limit 1
								      )
where ay."Region" = ' '

-- czyszczenie danych
-- sprawdzenie czy są wartości "null"
select *
from "AllYears" ay
where ay."HappiRank" isnull or ay."Country" isnull 
or ay."Region" isnull or ay."HappiScore" isnull or ay."GDP" isnull 
or ay."Health" isnull or ay."Freedom" isnull or ay."Generosity" isnull 
or ay."Trust" isnull or ay."SocSupport" isnull

-- usuniecie wartosci United Arab Emirates z uwagi na "N/A" w roku 2018 i inne rozbieżnosci

delete from "AllYears" where "Country"= 'United Arab Emirates';


--zmiana typu kolumny "Trust" na float

alter table "AllYears" alter column "Trust" type float4 using float4("Trust"); 

--zmiana typu kolumny na numeric dla kolumn ktore zawieraja ulamki dzisietne
alter table "AllYears" alter column "HappiScore" set data type numeric;
alter table "AllYears" alter column "GDP" set data type numeric;
alter table "AllYears" alter column "Health" set data type numeric;
alter table "AllYears" alter column "Freedom" set data type numeric;
alter table "AllYears" alter column "Generosity" set data type numeric;
alter table "AllYears" alter column "Trust" set data type numeric;
alter table "AllYears" alter column "SocSupport" set data type numeric;


												