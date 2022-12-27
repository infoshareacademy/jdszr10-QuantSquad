createdb -U postgres happiness
@REM download files from https://www.kaggle.com/datasets/unsdsn/world-happiness

@REM year2015
@REM Kolumny: Country,Region,Happiness Rank,Happiness Score,Standard Error,Economy (GDP per Capita),Family,Health (Life Expectancy),Freedom,Trust (Government Corruption),Generosity,Dystopia Residual
psql -U postgres -d happiness -c "CREATE TABLE if not exists year2015 (\"Country\" varchar NULL,\"Region\" varchar NULL,\"Happiness Rank\" varchar NULL,\"Happiness Score\" varchar NULL,\"Standard Error\" varchar NULL,\"Economy (GDP per Capita)\" varchar NULL,\"Family\" varchar NULL,\"Health (Life Expectancy)\" varchar NULL,\"Freedom\" varchar NULL,\"Trust (Government Corruption)\" varchar NULL,\"Generosity\" varchar NULL,\"Dystopia Residual\" varchar NULL)"
psql -U postgres -d happiness -c "COPY year2015 FROM 'D:\files\2015.csv' WITH (FORMAT CSV, HEADER TRUE)"

@REM year2016
@REM Kolumny: Country,Region,Happiness Rank,Happiness Score,Lower Confidence Interval,Upper Confidence Interval,Economy (GDP per Capita),Family,Health (Life Expectancy),Freedom,Trust (Government Corruption),Generosity,Dystopia Residual
psql -U postgres -d happiness -c "CREATE TABLE if not exists year2016 (\"Country\" varchar NULL,\"Region\" varchar NULL,\"Happiness Rank\" varchar NULL,\"Happiness Score\" varchar NULL,\"Lower Confidence Interval\" varchar NULL,\"Upper Confidence Interval\" varchar NULL,\"Economy (GDP per Capita)\" varchar NULL,\"Family\" varchar NULL,\"Health (Life Expectancy)\" varchar NULL,\"Freedom\" varchar NULL,\"Trust (Government Corruption)\" varchar NULL,\"Generosity\" varchar NULL,\"Dystopia Residual\" varchar NULL)"
psql -U postgres -d happiness -c "COPY year2016 FROM 'D:\files\2016.csv' WITH (FORMAT CSV, HEADER TRUE)"

@REM year2017
@REM Kolumny: "Country","Happiness.Rank","Happiness.Score","Whisker.high","Whisker.low","Economy..GDP.per.Capita.","Family","Health..Life.Expectancy.","Freedom","Generosity","Trust..Government.Corruption.","Dystopia.Residual"
psql -U postgres -d happiness -c "CREATE TABLE if not exists year2017 (\"Country\" varchar NULL, \"Happiness.Rank\" varchar NULL, \"Happiness.Score\" varchar NULL, \"Whisker.high\" varchar NULL, \"Whisker.low\" varchar NULL, \"Economy..GDP.per.Capita.\" varchar NULL, \"Family\" varchar NULL, \"Health..Life.Expectancy.\" varchar NULL, \"Freedom\" varchar NULL, \"Generosity\" varchar NULL, \"Trust..Government.Corruption.\" varchar NULL, \"Dystopia.Residual\" varchar NULL)"
psql -U postgres -d happiness -c "COPY year2017 FROM 'D:\files\2017.csv' WITH (FORMAT CSV, HEADER TRUE)"

@REM year2018
@REM Kolumny: Overall rank,Country or region,Score,GDP per capita,Social support,Healthy life expectancy,Freedom to make life choices,Generosity,Perceptions of corruption
psql -U postgres -d happiness -c "CREATE TABLE if not exists year2018 (\"Overall rank\" varchar NULL, \"Country or region\" varchar NULL, \"Score\" varchar NULL, \"GDP per capita\" varchar NULL, \"Social support\" varchar NULL, \"Healthy life expectancy\" varchar NULL, \"Freedom to make life choices\" varchar NULL, \"Generosity\" varchar NULL, \"Perceptions of corruption\" varchar NULL)"
psql -U postgres -d happiness -c "COPY year2018 FROM 'D:\files\2018.csv' WITH (FORMAT CSV, HEADER TRUE)"

@REM year2019
@REM Kolumny: Overall rank,Country or region,Score,GDP per capita,Social support,Healthy life expectancy,Freedom to make life choices,Generosity,Perceptions of corruption
psql -U postgres -d happiness -c "CREATE TABLE if not exists year2019 (\"Overall rank\" varchar NULL, \"Country or region\" varchar NULL, \"Score\" varchar NULL, \"GDP per capita\" varchar NULL, \"Social support\" varchar NULL, \"Healthy life expectancy\" varchar NULL, \"Freedom to make life choices\" varchar NULL, \"Generosity\" varchar NULL, \"Perceptions of corruption\" varchar NULL)"
psql -U postgres -d happiness -c "COPY year2019 FROM 'D:\files\2019.csv' WITH (FORMAT CSV, HEADER TRUE)"


