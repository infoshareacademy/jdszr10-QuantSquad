/*

Happiness without BORDERS
How happiness levels have changed in different countries over the years and what influenced the results

Quant Squad

 */ -- slide 4 "Regions in World Happiness Report"
-- map
-- visualisation Excel

select distinct "Region",
                "Country"
from "AllYears" ay
order by "Region",
         "Country" -- slide 6 "Factors affecting the level of happiness - correlation"
-- tableau: https://public.tableau.com/app/profile/piotr.rzepka/viz/HappinessReport_16737239493160/4_21CorrelationbetweenattributesandHappinessScore?publish=yes
 -- slide 6 "Factors affecting the level of happiness - correlation"
-- line chart
-- visualisation Python ()

select "Year",
       corr("GDP","HappiScore") "GDP",
       corr("Health","HappiScore") "Health",
       corr("SocSupport","HappiScore") "SocSupport",
       corr("Freedom","HappiScore") "Freedom",
       corr("Trust","HappiScore") "Trust",
       corr("Generosity","HappiScore") "Generosity"
from "AllYears"
where "Year" = '2019'
group by "Year"
union
select "Year",
       corr("GDP","HappiScore") "GDP",
       corr("Health","HappiScore") "Health",
       corr("SocSupport","HappiScore") "SocSupport",
       corr("Freedom","HappiScore") "Freedom",
       corr("Trust","HappiScore") "Trust",
       corr("Generosity","HappiScore") "Generosity"
from "AllYears"
where "Year" = '2018'
group by "Year"
union
select "Year",
       corr("GDP","HappiScore") "GDP",
       corr("Health","HappiScore") "Health",
       corr("SocSupport","HappiScore") "SocSupport",
       corr("Freedom","HappiScore") "Freedom",
       corr("Trust","HappiScore") "Trust",
       corr("Generosity","HappiScore") "Generosity"
from "AllYears"
where "Year" = '2017'
group by "Year"
union
select "Year",
       corr("GDP","HappiScore") "GDP",
       corr("Health","HappiScore") "Health",
       corr("SocSupport","HappiScore") "SocSupport",
       corr("Freedom","HappiScore") "Freedom",
       corr("Trust","HappiScore") "Trust",
       corr("Generosity","HappiScore") "Generosity"
from "AllYears"
where "Year" = '2016'
group by "Year"
union
select "Year",
       corr("GDP","HappiScore") "GDP",
       corr("Health","HappiScore") "Health",
       corr("SocSupport","HappiScore") "SocSupport",
       corr("Freedom","HappiScore") "Freedom",
       corr("Trust","HappiScore") "Trust",
       corr("Generosity","HappiScore") "Generosity"
from "AllYears"
where "Year" = '2015'
group by "Year"
order by "Year" asc -- slide 15 "The state of happiness in the regions"
-- chart box
-- visualisation Python + MatPlotLib

SELECT "Year",
       "HappiScore",
       "Region",
       "Country"
FROM "AllYears";

-- slide 16 "Change (+) in happiness levels over the years in countries"
-- bar chart
-- visualisation Python + MatPlotLib

select "Country",
       "HappiScore2015",
       "HappiScore2019",
       ("HappiScore2019"-"HappiScore2015") "HappiScoreDifference",
       round((("HappiScore2019"-"HappiScore2015")/"HappiScore2015")*100,2) "HappiScorePercentage"
from
    (select distinct "Country",

         (select "HappiScore"
          from "AllYears" ay2019
          where "Year" = '2019'
              and ay2019."Country"=ay."Country") as "HappiScore2019",

         (select "HappiScore"
          from "AllYears" ay2015
          where "Year" = '2015'
              and ay2015."Country"=ay."Country") as "HappiScore2015"
     from "AllYears" ay) x
where ("HappiScore2019"-"HappiScore2015")>0
order by "HappiScoreDifference" DESC -- slide 17 "Change (-) in happiness levels over the years in countries"
-- bar chart
-- visualisation Python + MatPlotLib

select "Country",
       "HappiScore2015",
       "HappiScore2019",
       ("HappiScore2019"-"HappiScore2015") "HappiScoreDifference",
       round((("HappiScore2019"-"HappiScore2015")/"HappiScore2015")*100*-1,2) "HappiScorePercentage"
from
    (select distinct "Country",

         (select "HappiScore"
          from "AllYears" ay2019
          where "Year" = '2019'
              and ay2019."Country"=ay."Country") as "HappiScore2019",

         (select "HappiScore"
          from "AllYears" ay2015
          where "Year" = '2015'
              and ay2015."Country"=ay."Country") as "HappiScore2015"
     from "AllYears" ay) x
where ("HappiScore2019"-"HappiScore2015")<0
order by "HappiScoreDifference" ASC -- slide 18
-- chart map + column
-- visualisation Excel

select distinct *
from
    (select "Region",
            "Country",
            case
                when "Change2016-2015Direction"+"Change2017-2016Direction"+"Change2018-2017Direction"+"Change2019-2018Direction" = 4 then 'Only Increase'
                when "Change2016-2015Direction"+"Change2017-2016Direction"+"Change2018-2017Direction"+"Change2019-2018Direction" = -4 then 'Only Decrease'
            end "AllYearsInRow"
     from
         (select "Region",
                 "Country",
                 case
                     when "Change2016-2015"> 0 then 1
                     when "Change2016-2015"< 0 then -1
                     else 0
                 end "Change2016-2015Direction",
                 "Change2016-2015",
                 case
                     when "Change2017-2016"> 0 then 1
                     when "Change2017-2016"< 0 then -1
                     else 0
                 end "Change2017-2016Direction",
                 "Change2017-2016",
                 case
                     when "Change2018-2017"> 0 then 1
                     when "Change2018-2017"< 0 then -1
                     else 0
                 end "Change2018-2017Direction",
                 "Change2018-2017",
                 case
                     when "Change2019-2018"> 0 then 1
                     when "Change2019-2018"< 0 then -1
                     else 0
                 end "Change2019-2018Direction",
                 "Change2019-2018"
          from
              ( select "Region",
                       "Country",
                       "HappiScore2016"-"HappiScore2015" "Change2016-2015",
                       "HappiScore2017"-"HappiScore2016" "Change2017-2016",
                       "HappiScore2018"-"HappiScore2017" "Change2018-2017",
                       "HappiScore2019"-"HappiScore2018" "Change2019-2018"
               from
                   ( select "Region",
                            "Country",

                        ( select "HappiScore"
                         from "AllYears" ay
                         where "Year" = '2015'
                             and ay."Country" = aymain."Country") "HappiScore2015",

                        ( select "HappiScore"
                         from "AllYears" ay
                         where "Year" = '2016'
                             and ay."Country" = aymain."Country") "HappiScore2016",

                        ( select "HappiScore"
                         from "AllYears" ay
                         where "Year" = '2017'
                             and ay."Country" = aymain."Country") "HappiScore2017",

                        ( select "HappiScore"
                         from "AllYears" ay
                         where "Year" = '2018'
                             and ay."Country" = aymain."Country") "HappiScore2018",

                        ( select "HappiScore"
                         from "AllYears" ay
                         where "Year" = '2019'
                             and ay."Country" = aymain."Country") "HappiScore2019"
                    from "AllYears" aymain) ax) ay) az) aw
where "AllYearsInRow" is not null