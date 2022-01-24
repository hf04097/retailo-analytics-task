USE [retailo]
GO

--which house has been the most efficient in terms of Bookings

SELECT Top 1 sum([Bookings]) as [most efficient booking], [Level 3 (House)]
FROM [dbo].[Bookings] 
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
where [Fiscal Period Booked] = 'Q1-2016'
group by [Level 3 (House)]
Order by sum([Bookings]) DESC

--which house has been the most efficient in terms of Bookings
SELECT Top 1 count([Bookings]) as [most efficient booking], [Level 3 (House)]
FROM [dbo].[Bookings] 
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
group by [Level 3 (House)]
Order by count([Bookings]) DESC