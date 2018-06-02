install.packages('MonetDBLite', dependencies = TRUE)

## Loading packages
library(MonetDBLite)
library(DBI)

## Set directory to the database
dbdir <- 'database/'

## Creating a conection to the database
con <- dbConnect( MonetDBLite::MonetDBLite() , dbdir )

## Dumping the csv file to the database
monetdb.read.csv(conn = con, files = 'CSV', tablename = 'TABLE', header = TRUE, na.strings = '', delim = ',')

## Listing tables
dbListTables(con)

## Couting rows in the table
dbGetQuery(con, 'SELECT count(*) FROM enem2014')

## Quering the firts 100 rows
teste <- dbGetQuery(con, "SELECT * FROM enem2014 LIMIT 100")