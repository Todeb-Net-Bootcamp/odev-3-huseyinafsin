--Tablo Döndüren Fonksiyon Siparişleri detayları ile getirir
CREATE FUNCTION GetCarsWithDetails()
RETURNS TABLE
AS 
RETURN
SELECT ca.CarName,ca.DaiyPrice,b.Name as Brand, co.Name as Color, ca.ModelYear
FROM Cars AS ca
INNER JOIN Brands AS b
ON ca.BrandId = b.Id
INNER JOIN Colors AS co
ON ca.ColorId = co.Id

GO
-- Siparişleri detayları fonksiyonu çağırma
SELECT * FROM GetCarsWithDetails()

--Değer Döndüren Fonksiyon, tüm arabaların toplam kiralama ücretini getirir
CREATE FUNCTION GetTotalCarPrice()
RETURNS FLOAT
AS 
BEGIN
DECLARE @Amount FLOAT
SELECT @Amount = SUM(ca.DaiyPrice) FROM Cars AS ca
RETURN @Amount 
END

GO
--Toplam fiyat fonksiyonunu çağırma
SELECT dbo.GetTotalCarPrice()

--Stored Prosedure, Rengi siyah olan arabaların findex puanlarını listelemeye yarayan sp
CREATE PROCEDURE BlackCarsFindexScores
AS
SELECT ca.CarName,ca.MinFindexScore FROM CARS as ca
WHERE ca.ColorId=2
GO
--Oluşturduğumuz SP yi burada çağırdık
EXEC BlackCarsFindexScores