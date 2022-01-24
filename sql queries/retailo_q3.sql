USE [retailo]
GO

Select *, ([Actual Q1-2015] + [Actual Q2-2015] + [Actual Q3-2015] + [Actual Q4-2015]) as [total 2015] From ( 
SELECT [Level 2 (Area)],
ISNULL([Q1-2015], 0 ) as [Actual Q1-2015],
ISNULL([Q2-2015], 0) as [Actual Q2-2015],
ISNULL([Q3-2015], 0) as [Actual Q3-2015],
ISNULL([Q4-2015], 0) as [Actual Q4-2015],
ISNULL([Q1-2016], 0) as [Actual Q1-2016],
ISNULL([Q2-2016], 0) as [Actual Q2-2016]

FROM (
  SELECT
    [bookings],
    [Fiscal Period Booked],
    [Level 2 (Area)]
  FROM [dbo].[Bookings]
  Where [Fiscal Year Booked] = 2015 or [Fiscal Year Booked] = 2016
) QuarterAreaBooking
PIVOT (
  SUM([bookings])
  FOR [Fiscal Period Booked]
  IN (
    [Q1-2015],
    [Q2-2015],
    [Q3-2015],
	[Q4-2015],
	[Q1-2016],
	[Q2-2016]
  )
) AS PivotTable

) AllResults