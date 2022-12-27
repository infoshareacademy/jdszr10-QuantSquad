-- query returning Country,
-- how many times it is listed (should be 5 as we have 5 years measured)
-- and country 1,2 and 3 higher on list or 1,2 and 3 lower on list (to see if there are differences and/or similarities in name) 
select *
from
    (select "Country",
            count(*),
            lag("Country",3) over (order by "Country") lag3, -- 3 kraje niżej na liście
            lag("Country",2) over (order by "Country") lag2, -- 2 kraje niżej na liście
            lag("Country",1) over (order by "Country") lag1, -- 1 kraj niżej na liście
            lead("Country",1) over (order by "Country") lead1, -- 1 kraj wyżej na liście
            lead("Country",2) over (order by "Country") lead2, -- 2 kraje wyżej na liście
            lead("Country",3) over (order by "Country") lead3, -- 3 kraje wyżej na liście
            case
                when count(*)<>5 then 'Potrzebna korekta'
                else ''
            end status
     from "AllYears" ay
     group by "Country"
     order by "Country") x
where status='Potrzebna korekta'



-- cleaning country data based on results of query above

DELETE from "AllYears" WHERE "Country"='Angola';
DELETE from "AllYears" WHERE "Country"='Belize';
DELETE from "AllYears" WHERE "Country"='Central African Republic';
DELETE from "AllYears" WHERE "Country"='Comoros';
DELETE from "AllYears" WHERE "Country"='Djibouti';
DELETE from "AllYears" WHERE "Country"='Gambia';
DELETE from "AllYears" WHERE "Country"='Laos';
DELETE from "AllYears" WHERE "Country"='Lesotho';
DELETE from "AllYears" WHERE "Country"='Macedonia';
DELETE from "AllYears" WHERE "Country"='Mozambique';
DELETE from "AllYears" WHERE "Country"='Namibia';
DELETE from "AllYears" WHERE "Country"='North Macedonia';
DELETE from "AllYears" WHERE "Country"='Oman';
DELETE from "AllYears" WHERE "Country"='Puerto Rico';
DELETE from "AllYears" WHERE "Country"='Somalia';
DELETE from "AllYears" WHERE "Country"='Somaliland region';
DELETE from "AllYears" WHERE "Country"='Somaliland Region';
DELETE from "AllYears" WHERE "Country"='South Sudan';
DELETE from "AllYears" WHERE "Country"='Sudan';
DELETE from "AllYears" WHERE "Country"='Suriname';
DELETE from "AllYears" WHERE "Country"='Swaziland';

UPDATE "AllYears" set "Country" = 'Hong Kong' WHERE "Country"='Hong Kong S.A.R., China';
UPDATE "AllYears" set "Country" = 'North Cyprus' WHERE "Country"='Northern Cyprus';
UPDATE "AllYears" set "Country" = 'Taiwan' WHERE "Country"='Taiwan Province of China';
UPDATE "AllYears" set "Country" = 'Trinidad and Tobago' WHERE "Country"='Trinidad & Tobago';

-- update column  Region for measures where Region was missing (Years 2017/2018/2019)

update "AllYears" ay set "Region"= (select distinct ay_r."Region" from "AllYears" ay_r where ay_r."Region" notnull and ay_r."Country" = ay."Country" order by ay_r."Region" limit 1)
where ay."Region" isnull ;



