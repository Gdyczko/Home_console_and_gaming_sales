-- import the file to Console
BULK INSERT Console
FROM '/Console_Data.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW  = 2
)
GO

-- import the file to Games
BULK INSERT Games
FROM '/scrapped_data_convert.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW  = 2
)
GO