DROP TABLE Console
CREATE TABLE Console (
    Console_Name NVARCHAR(100),
    [Type] NVARCHAR(50),
    Company NVARCHAR(100),
    Gen NVARCHAR(50),
    Gen_Years NVARCHAR(50),
    Released_Year INT,
    Generation INT,
    Discontinuation_Year NVARCHAR(50),
    Units_sold_in_million DECIMAL(10, 2),
    Remarks NVARCHAR(MAX),
    Link_to_gif NVARCHAR(MAX)
)
DROP TABLE Games
CREATE TABLE Games (
    Game_Name NVARCHAR(500),
    System_Full NVARCHAR(100),
    Units_m DECIMAL(10, 2),
    Publisher NVARCHAR(100),
    Developer NVARCHAR(100),
    Image_URL NVARCHAR(MAX),
    Release_Date DATE NULL
)