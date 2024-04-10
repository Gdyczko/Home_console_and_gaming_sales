/* 1. Top 10 Consoles sold */
SELECT TOP 10 
    Console_Name,
    Units_sold_in_million
FROM 
    Console
ORDER BY 
    Units_sold_in_million DESC

/* 2. Top 10 Games sold */
SELECT TOP 10 
    Game_Name,
    Units_m
FROM 
    Games
ORDER BY 
    Units_m DESC

/* 3. Analysing popular of consoles depending on generation: */
-- Calculating the sum of units sold in millions for each console generation
SELECT 
    Generation,
    SUM(Units_sold_in_million)[Units sold in million]
FROM 
    Console
GROUP BY 
    Generation

-- Comparison solding between different generation of consoles
SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 1 -- 1 st generation
ORDER BY 
    Units_sold_in_million DESC

SELECT  
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 2 -- 2 nd generation
ORDER BY 
    Units_sold_in_million DESC

SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 3 -- 3 rd generation
ORDER BY 
    Units_sold_in_million DESC

SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 4 -- 4 th generation
ORDER BY 
    Units_sold_in_million DESC

SELECT
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 5 -- 5 th generation
ORDER BY 
    Units_sold_in_million DESC

SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 6 -- 6 th generation
ORDER BY 
    Units_sold_in_million DESC

SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 7 -- 7 th generation
ORDER BY 
    Units_sold_in_million DESC

SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 8 -- 8 th generation
ORDER BY 
    Units_sold_in_million DESC

SELECT 
    Console_Name,
    Company,
    Generation,
    Units_sold_in_million
FROM 
    Console
WHERE 
    Generation = 9 -- 9 th generation
ORDER BY 
    Units_sold_in_million DESC

-- Which kind of company sold the most consoles
SELECT 
    Company,
    SUM(Units_sold_in_million) [Sold consoles in million]
FROM 
    Console
GROUP BY 
    Company
ORDER BY 
    [Sold consoles in million] DESC

/* 4. Games publisher analysis */
-- Number of games published by that publisher
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

-- Averageaverage units sold games by a publisher
SELECT 
    Publisher,
    AVG(Units_m) [Avg unit games in million]
FROM 
    Games
GROUP BY 
    Publisher
ORDER BY 
    [Avg unit games in million] DESC

/* 5. Games developer analysis */
-- Number of games made by developer
SELECT 
    Developer,
    COUNT(*) [Number of games]
FROM 
    Games
GROUP BY 
    Developer
ORDER BY 
    [Number of games] DESC, 
    Developer ASC

-- Average units sold games by a developer
SELECT 
    Developer,
    AVG(Units_m) [Avg unit games in million]
FROM 
    Games
GROUP BY 
    Developer
ORDER BY 
    [Avg unit games in million] DESC

/* 6. Analysis of publishing trends */
-- The determination of the most popular release years of games on various console platforms 
SELECT
    G.Release_Date AS Year_of_Release,
    G.System_Full AS Console_Name,
    C.Generation AS Generation_Number,
    COUNT(*) AS Games_Released
FROM
    Games G
INNER JOIN 
    Console C ON (C.Console_Name = G.System_Full)
GROUP BY
    G.Release_Date,
    G.System_Full,
    C.Generation
ORDER BY
    Console_Name,
    Games_Released DESC

-- Studying changes in game sales based on release years
SELECT
    Release_Date AS Release_Year,
    SUM(Units_m) AS Total_Units_Sold_in_mln
FROM
    Games
GROUP BY
    Release_Date
ORDER BY
    Release_Date

/* Analysing market of games depends on kindf of consoles */
-- Number of games released on defferent consoles platform
SELECT
    System_Full,
    COUNT(*) [Number_of_games]
FROM 
    Games 
GROUP BY 
    System_Full
ORDER BY [Number_of_games] DESC