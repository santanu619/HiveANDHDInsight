  GNU nano 5.6.1                                                                                    day2daywise.hql































CREATE EXTERNAL TABLE Day_to_Day_Cases(
Date DATE,
Confirmed INT,
Deaths INT,
Recovered INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ‘.’
LINES TERMINATED BY ‘\n’
STORED AS TEXTFILE
LOCATION “wasbs://hadoopclusterstorage.blob.core.windows.net/input/day_wise.csv” INTO TABLE Country_Cases


<!--Find out on which days having large Deaths/Recovered/Confirmed cases-->

SELECT Date, Deaths AS MostDeaths FROM Day_to_Day_Cases
ORDER BY Deaths DESC LIMIT 10;

SELECT Date, Recovered AS MostRecovered FROM Day_to_Day_Cases
ORDER BY Recovered DESC LIMIT 10;

SELECT Date, Confirmed AS MostConfirmedCases FROM Day_to_Day_Cases
ORDER BY Confirmed DESC LIMIT 10;


<!--Find out on which days having least Deaths/Recovered/Confirmed cases-->

SELECT Date, Deaths AS LeastDeaths FROM Day_to_Day_Cases
ORDER BY Deaths ASC LIMIT 10;

SELECT Date, Recovered AS LeastRecovered FROM Day_to_Day_Cases
ORDER BY Recovered ASC LIMIT 10;

SELECT Date, Confirmed AS LeastConfirmedCases FROM Day_to_Day_Cases
ORDER BY Confirmed ASC LIMIT 10;
