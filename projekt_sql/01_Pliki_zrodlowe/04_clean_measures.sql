-- check if there are any nulls

select * from "AllYears" where "HappiScore" isnull or "GDP" isnull or "Health" isnull or "Freedom" isnull or "Generosity" isnull or "Trust" isnull or "SocSupport" isnull

-- check if there are any empty strings

select * from "AllYears" where 
"HappiScore" = ''or 
"GDP" = ''or 
"Health" = '' or 
"Freedom" = '' or 
"Generosity" = '' or 
"Trust" = '' or
"SocSupport" = ''

-- check if there are any values which are not numbers

select * from "AllYears" where 
textregexeq("HappiScore",'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false or 
textregexeq("GDP",'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false or 
textregexeq("Health",'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false or 
textregexeq("Freedom",'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false or 
textregexeq("Generosity",'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false or 
textregexeq("Trust",'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false or
textregexeq("SocSupport" ,'^[[:digit:]]+(\.[[:digit:]]+)?$')  = false

-- delete 'United Arab Emirates' as there is "N/A" for one of measures.

DELETE FROM  "AllYears" ay where "Country" = 'United Arab Emirates'
