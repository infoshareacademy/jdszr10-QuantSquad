@REM Create 2 databases happiness_prod and happiness_test and import previously saved data (same file into both databases)
@REM Made as separate file (instead of query within the database server) to make it easier to import by other team members 
createdb -U postgres happiness_prod
createdb -U postgres happiness_test
psql -U postgres -d happiness_prod -f d:\files\happiness_allyears_only.sql
psql -U postgres -d happiness_test -f d:\files\happiness_allyears_only.sql
