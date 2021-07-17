CREATE EXTERNAL TABLE Country_Cases(
Country STRING,
Continent STRING,
Population INT,
TotalCases INT,
TotalDeaths INT,
TotalRecovered INT,
ActiveCases INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ‘.’
LINES TERMINATED BY ‘\n’
STORED AS TEXTFILE
LOCATION “wasbs://hadoopclusterstorage.blob.core.windows.net/input/worldometer.csv” INTO TABLE Country_Cases


<!--Find out top 10 countries Most affected by Deaths-->

SELECT Country AS MostAffected, TotalDeaths FROM Countries 
ORDER BY TotalDeaths DESC LIMIT 10;


<!--Find out top 10 countries least affected by Deaths-->

SELECT Country AS LeastAffected, TotalDeaths FROM Countries
ORDER BY TotalDeaths ASC LIMIT 10;


<!--Find out top 10 countries having large Recover rate-->

SELECT Country AS HighestRecovery, TotalRecovered FROM Countries
ORDER BY TotalRecovered DESC LIMIT 10;

<!--Find out top 10 countries having least Recover rate-->

SELECT Country AS HighestRecovery, TotalRecovered FROM Countries
ORDER BY TotalRecovered ASC LIMIT 10;
