/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [TFID],[TRACTCE00] as Tract,[BLOCKCE00] as Block,[BLKGRPCE00] as BlockGroup,
       [ZCTA5CE00] as ZipCode,[STATEFP10] as StateFIPS,[COUNTYFP10] as CountyFIPS,
       [ATOTAL] As TotalArea,[INTPTLAT] as Latitude,[INTPTLON] as longitude
  INTO [Census].[dbo].[Tempefaces]
  FROM [Census].[dbo].[faces]
  where TRACTCE00 in (select distinct TRACT from [Census].[dbo].[tractsblockslookup])
  order by TRACTCE00,[BLOCKCE00],[BLKGRPCE00]
