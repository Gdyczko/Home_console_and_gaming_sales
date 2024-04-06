-- Top 10 Consoles sold
SELECT TOP 10 Console_Name,
    Units_sold_in_million
FROM Console
ORDER BY Units_sold_in_million DESC

-- Top 10 Games sold
SELECT TOP 10 Game_Name,
    Units_m
FROM Games
ORDER BY Units_m DESC