USE [retailo]
GO

SELECT [dbo].[Bookings].[Opportunity Owner], sum([dbo].[Bookings].Bookings) as [Bookings], count([dbo].[lookups].[Level 3 (House)]) as [House totals]
FROM [dbo].[Bookings]
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
Group by [dbo].[Bookings].[Opportunity Owner], [dbo].[lookups].[Level 3 (House)]
Order by [dbo].[Bookings].[Opportunity Owner]