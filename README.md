# Console and Gaming sales 
The database contains information about games and consoles.\
In the games database, there is information such as: game titles, the system they were created for, the number of units sold, the publisher, the game developer, release date, and a link to an image.\
In the console data database, there is information about: console names, their type, generation, production year, end of production date, number of consoles sold, additional information about the console, or links to gifs.

# Background
A SQL database was created based on two CSV files. The CSV files have been modified in Python for better data analysis.\
Detailed information regarding data modifications has been included in the [Data](Data) folder, while information regarding the creation of the database and tables, as well as loading the database, can be found in the [MSSQL_create_database](MSSQL_create_database) folder.

## :mag: The dataset was analyzed in terms of:
1. **Top 10 Sold Consoles**
2. **Top 10 Sold Games**
3. **Analysis of Console Popularity by Generation**
4. **Games Publisher Analysis**
5. **Games Developer Analysis**
6. **Publishing Trends Analysis**
7. **Market Analysis of Games by Console Type**
8. **Console Lifecycle Analysis**
9. **Top-Selling Games for a Specific Console**
10. **Analysis of Average Game Unit Sales by System**
11. **Average Sales of a Console in One Year**
12. **Best-Selling Game for a Specific Console**

## :hammer_and_wrench: Tools I used
For my analysis I utilized:
* SQL: The backbone of my analysis, allowing me to query the database and unearth critical insights. 
* MS SQL Server: The chosen database management system, ideal for handling the consoles ang games posting data.
* Python :snake: : For data manipulation and processing, data cleaning, and creating charts.
    * pymssql: For conneccting python with sql server and using sql in python.
    * nbformat: For loading different data and values other jupyter notebook.
    * pandas :panda_face: : For manipulation, cleaning and processing data.
    * numpy: :blue_square: : For manipulation and processing data.
    * matplotlib :chart_with_upwards_trend: : For creating charts.
* Visual Studio Code: My go-to for database management and executing SQL queries and cleaning, processing, and visualization in Python.
* Git & GitHub: Essential for version control and sharing my Python and SQL scripts and analysis, ensuring collaboration and project tracking.

## Dataset
The database was downloaded from the [Kaggle](https://www.kaggle.com/datasets/lucasgalanti/home-consoles-and-gaming-sales) website.

# :bar_chart: The Analysis
Each query for this project aimed at investigating specific aspects of consoles and released games. Here’s how I approached each question.

## 1. Top 10 the best sold consoles
The following query, after execution, will display a table of the top 10 consoles sold the most. The columns will contain information about the console name and the number of units sold in millions.\
This query was implemented in Python to create a chart displayed below the query.
```sql
SELECT TOP 10 
    Console_Name,
    Units_sold_in_million
FROM 
    Console
ORDER BY 
    Units_sold_in_million DESC
```
![Top 10 Consoles](images/Top%2010%20the%20best%20sold%20consoles.png)

From the analyses abowe, we can infer that:
* The most units were sold for the PlayStation 2 console - 155 million units.
* The PlayStation 5 console ranked 10th, with 55 million units sold.
* All consoles from Sony (PlayStation) are in the top 10.
* Three consoles are from Nintendo (Wii / Nintendo).
* Only two consoles are from Microsoft (Xbox).

## 2. Top 10 the best sold games
The following query, after execution, will display a table of the top 10 games sold the most. The columns will contain information about the games name and the number of units sold in millions.\
This query was implemented in Python to create a chart displayed below the query.
```sql
SELECT TOP 10 
    Game_Name,
    Units_m
FROM 
    Games
ORDER BY 
    Units_m DESC
```
![Top 10 Games](images/Top%2010%20the%20best%20sold%20games.png)
```sql
SELECT TOP 10
    Game_Name,
    System_Full,
    Units_m
FROM
    Games
ORDER BY
    Units_m DESC
```
| Game Name                          | System Full                      | Units (millions) |
|------------------------------------|----------------------------------|------------------|
| Wii Sports                         | Wii                              | 82.9             |
| Mario Kart 8 Deluxe                | Nintendo Switch                  | 60.58            |
| Animal Crossing: New Horizons      | Nintendo Switch                  | 44.79            |
| Super Mario Bros.                  | Nintendo Entertainment System    | 40.24            |
| Mario Kart Wii                     | Wii                              | 37.38            |
| Super Smash Bros. Ultimate         | Nintendo Switch                  | 33.67            |
| Wii Sports Resort                  | Wii                              | 33.14            |
| The Legend of Zelda: Breath of the Wild | Nintendo Switch             | 31.61            |
| New Super Mario Bros. Wii          | Wii                              | 30.32            |
| Duck Hunt                          | Nintendo Entertainment System    | 28.31            |


From the analyses abowe, we can infer that:
* In the top 10, only games created for Nintendo consoles were included.
* The game Wii Sports has a significant lead in the number of units sold, with over 80 million units.
* Four games in the top 10 are associated with the Mario universe.

## 3. Analysing popular of consoles depending on generation
This analysis groups consoles by generation and calculates the total units sold. It then compares sales across different console generations.
```sql
SELECT 
    Generation,
    SUM(Units_sold_in_million)[Units sold in million]
FROM 
    Console
GROUP BY 
    Generation
```
| Generation | Units sold in million |
|------------|-----------------------|
| 1          | 0.5                   |
| 2          | 35                    |
| 3          | 77                    |
| 4          | 82                    |
| 5          | 144                   |
| 6          | 210                   |
| 7          | 272                   |
| 8          | 189                   |
| 9          | 221                   |
From the above table, it can be concluded that:
* With each subsequent generation, the number of consoles sold in that generation increased.
* Up to the 7th generation, demand for consoles was growing.
* From the 8th generation onwards, the number of consoles sold started to decline.
* Looking at the 7th, 8th, and 9th generations, the least consoles were purchased in the 8th generation.

Detailed information about each generation is contained in the [SQL](Query_MSSQL.sql) file.

## 4. Games publisher analysis 
This section shows the number of games published by each publisher and the average number of units sold per game by the publisher.
```sql
SELECT 
    Publisher,
    COUNT(*) [Number of games]
FROM 
    Games
GROUP BY 
    Publisher
ORDER BY 
    [Number of games] DESC, 
    Publisher ASC
```
| Publisher                    | Number of games |
|------------------------------|-----------------|
| Unknown                      | 3350            |
| Sega                         | 1252            |
| Activision                   | 888             |
| Konami                       | 854             |
| Ubisoft                      | 769             |
| Electronic Arts              | 710             |
| Sony Computer Entertainment  | 701             |
| Capcom                       | 616             |
| EA Sports                    | 552             |
| Nintendo                     | 547             |
| THQ                          | 503             |
| Atari                        | 404             |
| Acclaim Entertainment        | 355             |
| Bandai                       | 348             |
| Namco                        | 310             |
| Square Enix                  | 297             |
| KOEI                         | 281             |
| D3 Publisher                 | 259             |
| Hamster Corporation          | 257             |
| Midway Games                 | 255             |
| Namco Bandai Games           | 216             |
| Atlus                        | 189             |
| Namco Bandai                 | 175             |
| 2K Sports                    | 170             |
| Eidos Interactive            | 167             |

There are definitely more entries, but not all need to be shown. Detailed information is contained in the [SQL](Query_MSSQL.sql) file.
From the presented table, we can read that:
* Sega clearly dominates over other publishers in terms of game publications - 1252 published games.
* There are 3350 games in the database whose publisher is unknown.
* Over 800 games have been published by Activision and Konami.
* Eidos Interactive ranks 25th.

## 5. Studying changes in game sales based on release years
The following analysis aims to present how game sales have changed over time.
```sql
SELECT
    Release_Date AS Release_Year,
    SUM(Units_m) AS Total_Units_Sold_in_mln
FROM
    Games
GROUP BY
    Release_Date
ORDER BY
    Release_Date
```
![Game_sales_over_time](images/Game%20sales%20over%20time.png)

From the above analyses, it can be concluded that:
* Occasionally, sudden increases in game sales occur.
* The largest such jump was recorded around the years 2007/2008 and amounted to over 90 million units sold.
* Over the analyzed years, there is an upward trend in game sales.
* However, it should be noted that since 2020, there has been a decrease in game sales, not exceeding 30 million units.

## 6. Analysing market of games depends on kindf of consoles
This section displays the number of games released on different console platforms and compares game sales across different console platforms.
```sql
SELECT
    System_Full,
    COUNT(*) [Number_of_games]
FROM 
    Games 
GROUP BY 
    System_Full
ORDER BY [Number_of_games] DESC
```
| System Full                       | Number of Games |
|-----------------------------------|-----------------|
| PlayStation 2                     | 3565            |
| PlayStation 4                     | 3106            |
| PlayStation                       | 2707            |
| Nintendo Switch                   | 2392            |
| Xbox One                          | 2008            |
| PlayStation 3                     | 1905            |
| Xbox 360                          | 1735            |
| Wii                               | 1676            |
| Super Nintendo                    | 1211            |
| Nintendo Entertainment System     | 1108            |
| Xbox                              | 983             |
| Sega Genesis                      | 805             |
| Sega Saturn                       | 739             |
| GameCube                          | 663             |
| Sega Dreamcast                    | 655             |
| Wii U                             | 554             |
| Atari 2600                        | 501             |
| Nintendo 64                       | 393             |
| Sega Master System                | 336             |
| Intellivision                     | 134             |
| Atari 5200/7800                   | 132             |
```sql
SELECT
    System_Full,
    SUM(Units_m) [Number_of_solded_games]
FROM
    Games
GROUP BY
    System_Full
ORDER BY
    [Number_of_solded_games] DESC
```
| System Full                       | Number of Solded Games (millions) |
|-----------------------------------|------------------------------------|
| PlayStation 2                     | 1259.18                            |
| Xbox 360                          | 974.64                             |
| PlayStation 3                     | 964.7                              |
| Wii                               | 898.84                             |
| PlayStation 4                     | 849.39                             |
| PlayStation                       | 717.28                             |
| Nintendo Switch                   | 664.1                              |
| Xbox One                          | 309.06                             |
| Nintendo Entertainment System     | 263.14                             |
| Xbox                              | 261.35                             |
| Nintendo 64                       | 221.75                             |
| Super Nintendo                    | 201.16                             |
| GameCube                          | 194.22                             |
| Wii U                             | 97.47                              |
| Atari 2600                        | 97.36                              |
| Sega Genesis                      | 48.58                              |
| Sega Saturn                       | 33.82                              |
| Sega Dreamcast                    | 16.77                              |
| Intellivision                     | 9.5                                |
| Atari 5200/7800                   | 0.04                               |
| Sega Master System                | 0                                  |

From the above tables, we can infer that:
* PlayStation Dominance: PlayStation platforms, including PlayStation 2, PlayStation 4, and the original PlayStation, have the highest number of games released, indicating Sony's strong presence and support for its gaming consoles across different generations.
* Nintendo's Contribution: Nintendo platforms, such as Nintendo Switch, Super Nintendo, and Nintendo Entertainment System (NES), also have a significant number of games released, highlighting Nintendo's commitment to diverse gaming experiences and its iconic franchises.
* Xbox and Sega: Xbox consoles, represented by Xbox One and Xbox 360, have a substantial library of games, though slightly fewer compared to PlayStation and Nintendo platforms. Meanwhile, older Sega consoles like Sega Genesis and Sega Saturn also have a notable number of games released, showcasing Sega's historical significance in the gaming industry.
* Wii Era: The Wii console, known for its motion controls and broad appeal, has a considerable number of games released, demonstrating its popularity during its heyday.
<br/><br/>
* PlayStation 2 Dominance: PlayStation 2 emerges as the leading gaming platform with the highest number of solded games, indicating its significant popularity and market success during its lifetime.
* Success of Nintendo Platforms: Nintendo platforms, including Wii, Nintendo Switch, Nintendo Entertainment System (NES), and others, demonstrate strong performance in terms of game sales, highlighting Nintendo's enduring appeal to gamers across generations.
* Xbox Presence: Xbox consoles, such as Xbox 360 and Xbox One, also show notable sales figures, though generally lower than PlayStation and Nintendo platforms. However, they still represent a significant portion of the gaming market.
* Legacy Systems: Older systems like Sega Genesis, Atari 2600, and Intellivision have comparatively lower sales numbers, reflecting their historical relevance and the evolution of gaming technology over time.

## 7. Life of consoles cycle
This query provide information about each gaming console's life cycle, including its name, release year, discontinuation year, generation, and the total number of years it was active in the market.
```sql
SELECT
    Console_Name,
    Released_Year,
    Discontinuation_Year,
    Generation,
    SUM(Discontinuation_Year - Released_Year) [Years]
FROM
    Console
GROUP BY
    Console_Name,
    Released_Year,
    Discontinuation_Year,
    Generation
ORDER BY
    Generation
```
![Life of consoles cycle](Images/Life%20of%20consoles%20cycle.png)

From this analysis, we learn that:
* Generally, except for a few consoles, the next console model appears no earlier than 6 years.
* Initially, new console generations were released more frequently.
* The longest-standing console on the market was the Atari 2600 - 15 years.
* Sony held the PlayStation 2 on the market for the longest time. Others are also long, but not as much as 13 years. According to the available data, the PlayStation 3 and PlayStation 4 have been on the market for the same amount of time so far.
* Recently, a slight acceleration in the production of newer consoles can be observed, for example, Xbox 360 - 11 years, Xbox One - 7, Xbox Series - currently 4 years.