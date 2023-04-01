alter table "AllYears" 
alter column "HappiScore" type numeric using "HappiScore"::numeric,
alter column "HappiRank" type numeric using "HappiRank"::numeric,
alter column "GDP" type numeric using "GDP"::numeric,
alter column "Health" type numeric using "Health"::numeric,
alter column "Freedom" type numeric using "Freedom"::numeric,
alter column "Generosity" type numeric using "Generosity"::numeric,
alter column "Trust" type numeric using "Trust"::numeric,
alter column "SocSupport" type numeric using "SocSupport"::numeric;

select * from "AllYears" ay 