-- import the file to table Console
BULK INSERT Console
FROM '/Console_Data_convert.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW  = 2
)
GO

-- import the file to table Games
BULK INSERT Games
FROM '/scrapped_data_convert.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW  = 2
)
GO