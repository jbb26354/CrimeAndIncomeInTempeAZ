/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct [TRACTCE00]
FROM [Census].[dbo].[faces]
where TRACTCE00 in (select distinct TRACT from [Census].[dbo].[tractsblockslookup])
order by TRACTCE00