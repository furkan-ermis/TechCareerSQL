
--------------------------Trigger Invoice---------------------------------
GO
Truncate TABLE DemoFatura
DROP TRIGGER InvoiceDetail
GO

CREATE TRIGGER InvoiceDetail ON TourSale
AFTER INSERT
AS
Truncate TABLE [Invoice Details]
BEGIN

    DECLARE @InvoiceID AS INT = 0
    DECLARE @SaleID AS INT
    DECLARE @Tourist AS BIGINT
    DECLARE @date AS DATETIME
    DECLARE SaleCursor CURSOR FOR

    SELECT SaleID ,TouristID,ReservationDate  FROM TourSale
    OPEN SaleCursor
    FETCH NEXT FROM SaleCursor INTO @SaleID,@Tourist, @date
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @InvoiceID = @InvoiceID + 1
        IF @Tourist NOT IN  (SELECT TouristID
                            FROM (select TouristID,ReservationDate 
                                from TourSale
                                GROUP BY TouristID, ReservationDate
                                HAVING COUNT(ReservationDate)>1
                                ) A 
                            WHERE ReservationDate=@date)
            BEGIN
                INSERT INTO [Invoice Details]
                VALUES(@InvoiceID,@SaleID)
            END

        ELSE IF @Tourist IN  (SELECT TouristID
                            FROM (select TouristID,ReservationDate 
                                from TourSale
                                GROUP BY TouristID, ReservationDate
                                HAVING COUNT(ReservationDate)>1
                                ) A 
                            WHERE ReservationDate=@date)
            BEGIN
                DECLARE @Sale AS INT
                DECLARE TouristCursor CURSOR FOR
                SELECT SaleID 
                FROM (
                    SELECT TouristID,SaleID,ReservationDate  
                    FROM TourSale 
                    WHERE ReservationDate IN (
                        select ReservationDate
                        from TourSale
                        GROUP BY ReservationDate
                        HAVING COUNT(ReservationDate)>1
                                            )
                    ) A 
                WHERE TouristID =@Tourist and ReservationDate =@date
                
                OPEN TouristCursor
                FETCH NEXT FROM TouristCursor INTO @Sale
                WHILE @@FETCH_STATUS = 0
                    BEGIN
                        INSERT INTO [Invoice Details]
                        VALUES(@InvoiceID,@Sale)
                    FETCH NEXT FROM TouristCursor INTO @Sale
                    END
                FETCH NEXT FROM SaleCursor INTO @SaleID,@Tourist, @date
                CLOSE TouristCursor
                DEALLOCATE TouristCursor 

                FETCH NEXT FROM SaleCursor INTO @SaleID,@Tourist, @date
            END
                FETCH NEXT FROM SaleCursor INTO @SaleID,@Tourist, @date
    END
    CLOSE SaleCursor
    DEALLOCATE SaleCursor 
END

GO
----------------------------
