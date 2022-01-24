USE [retailo]
GO

Select[Opportunity Number],[Level 3 (House)],[Bookings],[Created Date],[First Signed Opportunity Date],[Close Date], [Billing Type],[Financial Services Vertical], [Forbes Global 2000]
FROM [dbo].[Bookings]
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]

SELECT [Level 3 (House)], 
ISNULL([Perpetual], 0 ) as [Perpetual],
ISNULL([Subscription], 0 ) as [Subscription]
	FROM (
  SELECT
	[Level 3 (House)],
    [bookings],
    [Billing Type]
    
	FROM [dbo].[Bookings]
	INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]

) QuarterAreaBooking
PIVOT (
  SUM([bookings])
  FOR [Billing Type]
  IN (
    [Perpetual],
    [Subscription]
  )
) AS PivotTable


 --Sum of House Greyjoy Subscription Bookings - $M

Select sum([Bookings]) as [Sum of House Greyjoy Subscription Bookings]
FROM [dbo].[Bookings]
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
Where [Level 3 (House)] = 'House Greyjoy' and [Billing Type] = 'Subscription'


--Count of House Baratheon Bookings before 2/1/2016

Select count([Level 3 (House)]) as [Count of House Baratheon Bookings before date]
FROM [dbo].[Bookings]
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
Where [Created Date] < '2016-02-01 00:00:00' and [Level 3 (House)] = 'House Baratheon'

--Which House closed the least unique opportunities from the subset?

SELECT TOP 1 count([Opportunity Number]) as [least unique opportunities], [Level 3 (House)]
FROM [dbo].[Bookings] 
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
GROUP BY [Level 3 (House)]
ORDER BY count(*) DESC

--Which House closed the most unique opportunities from the subset? 

SELECT TOP 1 count([Opportunity Number]) as [most unique opportunities], [Level 3 (House)]
FROM [dbo].[Bookings] 
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
GROUP BY [Level 3 (House)]
ORDER BY count(*)

--Which house had the largest unique Opportunity size in the subset, and what was it?

SELECT Top 1 sum([Opportunity Number]) as [largest unique opportunities], [Level 3 (House)]
FROM [dbo].[Bookings] 
INNER JOIN [dbo].[lookups] ON [dbo].[Bookings].[Opportunity Owner] = [dbo].[lookups].[Opportunity Owner]
GROUP BY [Level 3 (House)]
Order by sum([Opportunity Number]) DESC

