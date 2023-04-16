-----------------RAPORLAR--------------------
GO
-- 1. En çok gezilen yer/yerler neresidir?

SELECT * 
FROM vw_CountVisitedByTour
WHERE CountVisit = (SELECT MAX(CountVisit) 
        FROM vw_CountVisitedByTour
    )

GO
-- 2. Ağustos ayında en çok çalışan rehber/rehberler kimdir/kimlerdir?
GO

SELECT GuideName
FROM vw_EmployeeWorksByMonth 
WHERE EmployeeWorks = (SELECT MAX(EmployeeWorks) 
        FROM vw_EmployeeWorksByMonth)
    and [Month] = 8
GO
-- 3. Kadın turistlerin gezdiği yerleri, toplam ziyaret edilme sayılarıyla beraber listeleyin
SELECT p.Place ,COUNT(td.TourID) AS CountVisit 
FROM Places p
JOIN [Tour Details] td ON td.PlaceID = p.PlaceID
JOIN Tour t ON t.TourID =td.TourID
JOIN TourSale ts ON ts.TourID = t.TourID
JOIN Tourists tr ON tr.TouristID = ts.TouristID
WHERE tr.Gender = 'Female'
GROUP BY p.Place

-- 4. İngiltere’den gelip de Kız Kulesi’ni gezen turistler kimlerdir?

SELECT tt.FirstName + ' ' + tt.LastName AS TouristName  
FROM Tourists tt
JOIN TourSale ts ON tt.TouristID = ts.TouristID
JOIN Tour t ON t.TourID = ts.TourID
JOIN [Tour Details] td ON td.TourID = t.TourID
JOIN Places p ON td.PlaceID = p.PlaceID
WHERE tt.Country = 'English' AND p.PlaceID = 103

-- 5. Gezilen yerler hangi yılda kaç defa gezilmiştir?

SELECT [YEAR],Place,SUM(CountVisit) AS CountVisit
FROM vw_VisitsByYear
GROUP BY Place,[YEAR]

-- 6. 2’den fazla tura rehberlik eden rehberlerin en çok tanıttıkları yerler nelerdir?
SELECT *
FROM vw_CountVisitedByGuide main
WHERE CountVisit = (SELECT MAX(CountVisit) 
                        FROM vw_CountVisitedByGuide sub
                        WHERE  GuideName= main.GuideName
                        )
ORDER BY CountVisit DESC


-- 7. İtalyan turistler en çok nereyi gezmiştir?
SELECT p.Place
FROM TourSale ts
JOIN Tourists tt ON tt.TouristID = ts.TouristID
JOIN Tour t ON t.TourID = ts.TourID
JOIN [Tour Details] td ON td.TourID = t.TourID
JOIN Places p ON td.PlaceID = p.PlaceID
WHERE tt.Nationality='Italy'


-- 8. Kapalı Çarşı’yı gezen en yaşlı turist kimdir?
SELECT TOP 1 tt.FirstName + ' ' +tt.LastName AS TouristName ,DATEDIFF(YEAR,MIN(BirthDate),GETDATE()) AS AGE 
FROM Tourists tt 
JOIN TourSale ts ON ts.TouristID = tt.TouristID
JOIN Tour t ON t.TourID=ts.TourID
JOIN [Tour Details] td ON td.TourID = t.TourID
JOIN Places p ON td.PlaceID = p.PlaceID
WHERE p.PlaceID = 113
GROUP BY tt.FirstName + ' ' +tt.LastName
ORDER BY AGE DESC

-- 9. Yunanistan’dan gelen Finlandiyalı turistin gezdiği yerler nerelerdir?

SELECT p.Place  
FROM Places p
JOIN [Tour Details] td ON td.PlaceID = p.PlaceID
JOIN Tour t ON t.TourID =td.TourID
JOIN TourSale ts ON ts.TourID = t.TourID
JOIN Tourists tt ON ts.TouristID = tt.TouristID
WHERE tt.Nationality='Finnish' AND tt.Country='Greek'
GROUP BY p.Place
-- 10. Dolmabahçe Sarayı’na en son giden turistler ve rehberi listeleyin.
SELECT tt.FirstName + ' ' + tt.LastName AS TouristName, 
            g.FirstName + ' ' + g.LastName AS GuideName ,
        ts.TourDate
FROM TourSale ts
JOIN Tourists tt ON ts.TouristID = tt.TouristID
JOIN Guide g ON g.GuideID = ts.GuideID
JOIN Tour t ON ts.TourID = t.TourID
JOIN [Tour Details] td ON td.TourID= t.TourID
WHERE td.PlaceID = 105
ORDER BY ts.TourDate DESC