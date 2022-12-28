
with united_years as (
					select '2015' as "Year",
					y5."Happiness Rank" as "HappiRank",
					y5.country  as "Country",
					y5.region as "Region",
					y5."Happiness Score" as "HappiScore",
					y5."Economy (GDP per Capita)" as "GDP",
					y5."Health (Life Expectancy)" as "Health",
					y5.freedom  as "Freedom",
					y5.generosity as "Generosity",
					cast(y5."Trust (Government Corruption)" as varchar(30)) as "Trust",
					y5."Family" as "SocSupport"
					from "Year2015" y5
					union all
					select '2016' as "Year",
					y6."Happiness Rank" as "HappiRank",
					y6.country as "Country",
					y6.region as "Region",
					y6."Happiness Score" as "HappiScore",
					y6."Economy (GDP per Capita)" as "GDP",
					y6."Health (Life Expectancy)" as "Health",
					y6.freedom  as "Freedom",
					y6.generosity as "Generosity",
					cast(y6."Trust (Government Corruption)" as varchar(30)) as "Trust",
					y6."Family" as "SocSupport"
					from "Year2016" y6
					union all
					select '2017' as "Year",
					y7."Happiness.Rank" as "HappiRank",
					y7.country as "Country",
					' ' as "Region",
					y7."Happiness.Score"  as "HappiScore",
					y7."Economy..GDP.per.Capita."  as "GDP",
					y7."Health..Life.Expectancy."  as "Health",
					y7.freedom  as "Freedom",
					y7.generosity  as "Generosity",
					cast(y7."Trust..Government.Corruption." as varchar(30)) as "Trust",
					y7."Family"  as "SocSupport"
					from "Year2017" y7
					union all
					select '2018' as "Year",
					y8."Overall rank" as "HappiRank",
					y8."Country or region"  as "Country",
					' ' as "Region",
					y8.score  as "HappiScore",
					y8."GDP per capita"  as "GDP",
					y8."Healthy life expectancy"  as "Health",
					y8."Freedom to make life choices"  as "Freedom",
					y8.generosity  as "Generosity",
					y8."Perceptions of corruption" as "Trust",
					y8."Social support"  as "SocSupport"
					from "Year2018" y8
					union all
					select '2019' as "Year",
					y9."Overall rank"  as "HappiRank",
					y9."Country or region"  as "Country",
					' ' as "Region",
					y9.score  as "HappiScore",
					y9."GDP per capita"  as "GDP",
					y9."Healthy life expectancy"  as "Health",
					y9."Freedom to make life choices"  as "Freedom",
					y9.generosity  as "Generosity",
					cast(y9."Perceptions of corruption" as varchar(30))  as "Trust",
					y9."Social support"  as "SocSupport"
					from "Year2019" y9)

select * 
into "AllYears" from united_years
					
