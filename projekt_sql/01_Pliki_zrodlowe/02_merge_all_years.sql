-- Create "AllYears" table to merge all separate tables into one table
create table "AllYears" (
                    "Year" varchar null,
                    "HappiRank" varchar NULL,
                    "Country" varchar NULL,
                    "Region" varchar NULL,
                    "HappiScore" varchar NULL,
                    "GDP" varchar NULL,
                    "Health" varchar NULL,
                    "Freedom" varchar NULL,
                    "Generosity" varchar NULL,
                    "Trust" varchar NULL,
                    "SocSupport" varchar NULL);

-- Import all data from "year2015" table into "AllYears" common table
insert into "AllYears" ("Year",
                        "HappiRank",
                        "Country",
                        "Region",
                        "HappiScore",
                        "GDP",
                        "Health",
                        "Freedom",
                        "Generosity",
                        "Trust",
                        "SocSupport")
select '2015',
       "Happiness Rank",
       "Country",
       "Region",
       "Happiness Score",
       "Economy (GDP per Capita)",
       "Health (Life Expectancy)",
       "Freedom",
       "Generosity",
       "Trust (Government Corruption)",
       "Family"
from year2015;


-- Import all data from "year2016" table into "AllYears" common table
insert into "AllYears" ("Year",
                        "HappiRank",
                        "Country",
                        "Region",
                        "HappiScore",
                        "GDP",
                        "Health",
                        "Freedom",
                        "Generosity",
                        "Trust",
                        "SocSupport")
select '2016',
       "Happiness Rank",
       "Country",
       "Region",
       "Happiness Score",
       "Economy (GDP per Capita)",
       "Health (Life Expectancy)",
       "Freedom",
       "Generosity",
       "Trust (Government Corruption)",
       "Family"
from year2016;


-- Import all data from "year2017" table into "AllYears" common table
insert into "AllYears" ("Year",
                        "HappiRank",
                        "Country",
                        "HappiScore",
                        "GDP",
                        "Health",
                        "Freedom",
                        "Generosity",
                        "Trust",
                        "SocSupport")
select '2017',
       "Happiness.Rank",
       "Country",
       "Happiness.Score",
       "Economy..GDP.per.Capita.",
       "Health..Life.Expectancy.",
       "Freedom",
       "Generosity",
       "Trust..Government.Corruption.",
       "Family"
from year2017;


-- Import all data from "year2018" table into "AllYears" common table
insert into "AllYears" ("Year",
                        "HappiRank",
                        "Country",
                        "HappiScore",
                        "GDP",
                        "Health",
                        "Freedom",
                        "Generosity",
                        "Trust",
                        "SocSupport")
select '2018',
       "Overall rank",
       "Country or region",
       "Score",
       "GDP per capita",
       "Healthy life expectancy",
       "Freedom to make life choices",
       "Generosity",
       "Perceptions of corruption",
       "Social support"
from year2018;


-- Import all data from "year2019" table into "AllYears" common table
insert into "AllYears" ("Year",
                        "HappiRank",
                        "Country",
                        "HappiScore",
                        "GDP",
                        "Health",
                        "Freedom",
                        "Generosity",
                        "Trust",
                        "SocSupport")
select '2019',
       "Overall rank",
       "Country or region",
       "Score",
       "GDP per capita",
       "Healthy life expectancy",
       "Freedom to make life choices",
       "Generosity",
       "Perceptions of corruption",
       "Social support"
from year2019;

