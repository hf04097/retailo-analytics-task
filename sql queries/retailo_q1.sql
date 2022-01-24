USE [retailo]
GO

CREATE TABLE bookings_level_year (
    [2014] int,
	[2015] int,
	[Level 2 (Area)] varchar(255),
);


Insert into bookings_level_year ([2015],[Level 2 (Area)])
	Select [bookings], [Level 2 (Area)]
	from [dbo].[Bookings]
	where [Fiscal Year Booked] = 2015

Insert into bookings_level_year ([2014], [Level 2 (Area)])
	Select [bookings], [Level 2 (Area)]
	from [dbo].[Bookings]
	where [Fiscal Year Booked] = 2014


select sum([2014]) as [2014_booking],sum([2015]) as [2015_booking],[Level 2 (Area)], ((sum([2015]) - sum([2014]))* 100.0) / sum([2014]) as [yoy]
from bookings_level_year
group by [Level 2 (Area)]
Having sum([2014]) is not null and sum([2015]) is not null
order by [Level 2 (Area)]





