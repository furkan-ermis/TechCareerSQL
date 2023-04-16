---------------VIEW------------------------
CREATE VIEW vw_CountVisitedByTour
AS
SELECT p.Place ,COUNT(ts.SaleID) AS CountVisit 
FROM Places p
JOIN [Tour Details] td ON td.PlaceID = p.PlaceID
JOIN Tour t ON t.TourID = td.TourID
JOIN TourSale ts ON ts.TourID =t.TourID
GROUP BY p.Place
GO
---------------VIEW------------------------
CREATE VIEW vw_CountVisitedByGuide
AS
SELECT g.FirstName + ' '+ g.LastName as GuideName,p.Place AS Place,COUNT(p.Place) AS CountVisit
        FROM TourSale ts
        JOIN Tour t ON ts.TourId = t.TourId
        JOIN [Tour Details] td ON td.TourID = t.TourID
        JOIN Places p ON p.PlaceID = td.PlaceID
        JOIN Guide g ON g.GuideID = ts.GuideID
        WHERE ts.GuideID IN (SELECT GuideID 
                                    FROM TourSale
                                    GROUP BY GuideID
                                    HAVING COUNT(GuideID) > 2) 
        GROUP BY g.FirstName + ' '+ g.LastName,p.Place
GO
---------------VIEW------------------------
CREATE VIEW vw_EmployeeWorksByMonth
AS
SELECT MONTH(v.TourDate) AS [Month],v.GuideName,SUM(v.CountGuide) AS EmployeeWorks
    FROM (SELECT g.FirstName+ ' ' + g.LastName AS GuideName,
                COUNT(ts.GuideID) AS CountGuide ,
                ts.TourDate  
            FROM TourSale ts
            JOIN Tour t ON ts.TourID =t.TourID
            JOIN Guide g ON g.GuideID=ts.GuideID
            GROUP BY g.FirstName+ ' ' + g.LastName , ts.TourDate
        ) v
    GROUP BY v.GuideName,MONTH(v.TourDate)


GO

---------------VIEW------------------------
CREATE VIEW vw_VisitsByYear
AS
SELECT  YEAR(ts.TourDate) AS [YEAR],p.Place AS Place ,COUNT(td.TourID) AS CountVisit
FROM Places p
JOIN [Tour Details] td ON td.PlaceID = p.PlaceID
JOIN Tour t ON t.TourID =td.TourID
JOIN TourSale ts ON t.TourID = ts.TourID
GROUP BY p.Place,YEAR(ts.TourDate)

GO
---------------VIEW------------------------
CREATE VIEW vw_Invoices
AS
SELECT(
'FTR'+
CAST(format(datepart(yy, ts.ReservationDate),'00') as nvarchar)+
CAST(format(datepart(mm, ts.ReservationDate),'00') as nvarchar)+
CAST(format(datepart(dd, ts.ReservationDate),'00') as nvarchar)+
CAST( format(ıd.InvoiceID , '000') as nvarchar)) AS InvoiceNo,

tt.FirstName+' ' + tt.LastName AS TouristName ,

ts.ReservationDate AS InvoiceDate,

vwP.TotalPrice AS Total

FROM [Invoice Details] ıd
JOIN vw_PriceByAge vwP ON vwP.SaleID = ıd.SaleID 
JOIN TourSale ts ON ts.SaleID = ıd.SaleID
JOIN Tourists tt ON tt.TouristID = ts.TouristID
GO

---------------VIEW------------------------
CREATE VIEW vw_PriceByAge
AS
SELECT SaleID,AGE,
        TotalPrice=CASE
            WHEN AGE > 60 THEN TotalPrice * 0.85
            WHEN AGE <= 60 THEN TotalPrice*1
            END
FROM 
(SELECT ts.SaleID , SUM(p.Price) AS TotalPrice, DATEDIFF(YEAR,tt.BirthDate,GETDATE()) AS AGE
            FROM TourSale ts
            JOIN Tour t ON t.TourID = ts.TourID
            JOIN [Tour Details] td ON t.TourID =td.TourID
            JOIN Places p ON p.PlaceID = td.PlaceID
            JOIN Tourists tt ON tt.TouristID = ts.TouristID
            GROUP BY ts.SaleID,tt.Birthdate) A


