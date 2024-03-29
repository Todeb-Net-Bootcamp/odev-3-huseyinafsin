USE [ReCap]
GO
/****** Object:  UserDefinedFunction [dbo].[GetTotalCarPrice]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTotalCarPrice]()
RETURNS FLOAT
AS 
BEGIN
DECLARE @Amount FLOAT
SELECT @Amount = SUM(ca.DaiyPrice) FROM Cars AS ca
RETURN @Amount 
END

GO
/****** Object:  Table [dbo].[Brands]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[ModelYear] [int] NOT NULL,
	[DaiyPrice] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CarName] [nchar](10) NULL,
	[MinFindexScore] [int] NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCarsWithDetails]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCarsWithDetails]()
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CarImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCards]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](max) NULL,
	[ExpireYear] [nvarchar](max) NULL,
	[ExpireMonth] [nvarchar](max) NULL,
	[Cvc] [nvarchar](max) NULL,
	[CardHolderFullName] [nvarchar](max) NULL,
	[Balance] [decimal](18, 4) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_CreditCards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[FindexScore] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MailSubscribes]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MailSubscribes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_MailSubscribes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreditCardId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Amount] [decimal](18, 4) NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[RentDate] [datetime2](7) NOT NULL,
	[ReturnDate] [datetime2](7) NOT NULL,
	[PaymentId] [int] NOT NULL,
	[DeliveryStatus] [bit] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PasswordHash] [varbinary](500) NOT NULL,
	[PasswordSalt] [varbinary](500) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210930164553_InitialCommit', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210930164740_InitialCommit2', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211003172917_ini', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211008184945_init', N'5.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211016133955_car_image', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211213084856_CC_and_Payment', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211213092436_paymentid', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211213115643_rentals', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211213115748_rentals1', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220117164047_adding_creditScore', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220117181244_email_subscribe', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220128081256_card_user_relation', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'BMW')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Volkswagen')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Opel')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Tesla')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Fiat')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (9, N'Toyota')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1, 0, N'Images/CarImages/default.jpg', CAST(N'2021-10-17T18:02:16.7011703' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1016, 5, N'Images/CarImages/Tesla-Roadster.jpg', CAST(N'2021-10-17T18:56:00.3495717' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1017, 5, N'Images/CarImages/bugatti.jpg', CAST(N'2021-10-17T19:15:03.3548198' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1021, 3, N'Images/CarImages/76f62260-100c-4ce8-9b79-d3681aacf712.jpg', CAST(N'2021-10-13T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1040, 0, N'Images/CarImages/57b229fa-93d2-4f0e-82f1-703ab3b0a68f.jpg', CAST(N'2022-01-01T10:21:04.1986266' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1041, 0, N'Images/CarImages/034076d3-e6cf-4638-9071-0f587c4f918c.jpg', CAST(N'2022-01-01T10:22:08.4959463' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1042, 0, N'Images/CarImages/6222f838-090c-4e9a-b530-5b95eb682a4d.jpg', CAST(N'2022-01-01T10:24:21.8188730' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1045, 4, N'Images/CarImages/ef742284-9134-4d51-b5a0-b7951d9eb5f1.jpg', CAST(N'2022-01-01T11:58:05.7676516' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1046, 4, N'Images/CarImages/d4dd1d32-8e42-47c0-ae6e-c01db683b1f7.jpg', CAST(N'2022-01-01T11:58:30.6773705' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1047, 27, N'Images/CarImages/92b2f7e6-0d32-4e45-8c48-aa2d6ec22e29.jpg', CAST(N'2022-01-01T12:07:51.9784703' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1049, 28, N'Images/CarImages/cb2adc86-1785-4652-b0d0-8332053cebd5.jpg', CAST(N'2022-01-01T12:27:47.8220092' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1050, 28, N'Images/CarImages/08bcd1d2-2fd4-4242-8de6-b7ddd2b76499.jpg', CAST(N'2022-01-01T12:28:07.3062979' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1051, 28, N'Images/CarImages/bdd78c31-feae-4c1a-8fc2-b5df59b2675c.jpg', CAST(N'2022-01-02T16:25:39.7353481' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1052, 2, N'Images/CarImages/6acfa9b2-988c-4aaa-af75-f2fc9f7634d4.jpg', CAST(N'2022-01-02T17:52:48.2650013' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1053, 2, N'Images/CarImages/bf008dc4-9b27-4676-913a-7757c7157c9c.jpg', CAST(N'2022-01-02T17:53:08.1273615' AS DateTime2))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1055, 2, N'Images/CarImages/55b5ec68-4aeb-423d-b680-931361285e62.jpg', CAST(N'2022-01-02T17:53:54.3356497' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DaiyPrice], [Description], [CarName], [MinFindexScore]) VALUES (2, 2, 2, 2000, CAST(60.00 AS Decimal(18, 2)), N'Aracım orjinal 137.500 kmdir

-16 valf modelidir 
(2002 öncesi üretilen 8 valflerle kıyaslamayın.)

- Değişen parçası yoktur.

- Hız sabitleyici vardır.
(Yetkili serviste takılmıştır.)

-Park sensörü vardır
 (Aracın renk koduna göre boyatılıp yetkili serviste taktırılmıştır.)

-Araç ile tam uyumlu multimedya sistem vardır.
(Telefon bağlantılı,geri görüş kameralı,navigasyonlu,bluetooth bağlantılı,usb bağlantılı,internete bağlanabilen modeldir.)

-Araç içerisindeki bütün hoparlörler orijinal boyutlarına sadık kalınarak yenilenmiştir
(Pasific modellerinde arka kapılarda hoparlörler yoktur onlarda eklenmiştir.)

- Takım halinde yazlık ve kışlık lastikleri vardır.

-2 takım jant vardır.
(Modelleri fotoğraflara eklenmiştir.Yazlık ve kışlık olarak ayrı kullanılmaktadır.)

-Bakımları aralık ayı içerisinde yapılmıştır.
(Sıvı,filtre,triger değişimi,termostat değişimi,lpg bakımı,kalorifer peteği değişimi,yakıt hortumları  değişimi,bujilerin değişimi.)

- Simit tanklı lpg vardır.
(Ruhsata işlidir.)

- Ekspertiz raporu ve tramer sorgusu fotoğraflarda bulunmaktadır.

- 3 adet anahtarı mevcuttur.
(2’si yeni model sustalı anahtardır)

-Döşemelerinde ve tavanda yırtık ya da sarkma yoktur.

-Otomatik golf 4 ya da 5 ile takas düşünülebilir.', N'enerji    ', 1400)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DaiyPrice], [Description], [CarName], [MinFindexScore]) VALUES (3, 1, 3, 800, CAST(655.00 AS Decimal(18, 2)), N'1.4 TSI 122 HP COMFORTLINE 2014 MODEL


123.000 km’de orjinal.
Otomatik farlar.
Far yıkama.
Ön arka park sensörü.
Multimedya dokunmatik ekran.
Direksiyondan kumandalı.
Yokuş kalkış desteği.
Yol bilgisayarı.
Lastik arıza göstergesi.
Deri kumaş koltuklar.
Yağ ve yağ filitresi yeni değişti.
Antifiriz değişti.
Polen filitresi değişti.
Ön ve arka balatalar yeni değişti.
Turbo bakımı yeni yapıldı.
Klima bakımları yapıldı. (Buz gibi yapıyor).
Pasta cilası ve boya koruması yeni yapıldı.
Ciddi olan alıcılar arasın boş muhabbete vaktim yok.
Az da pazarlık payı vardır.
Ağır hasar kayıtlıdır. ( )
Alıcısına hayırlı uğurlu olsun.', N'BMW       ', 1800)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DaiyPrice], [Description], [CarName], [MinFindexScore]) VALUES (4, 2, 2, 2021, CAST(5166.00 AS Decimal(18, 2)), N'Araç oldukça diri ve temiz bir araçtır
Tramer: sol iki kapı ve ön tanpon sürtünmeden dolayı değişmiş kaput ucunda ve sol arka tanponda  bir parmak kadr serpme boya varolup haricinde boyasızdır sınıfının en dolu paketidir', N'Toros     ', 1200)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DaiyPrice], [Description], [CarName], [MinFindexScore]) VALUES (5, 2, 1, 2015, CAST(50.00 AS Decimal(18, 2)), N'Yaşıtlarına göre güzel bir araçtır, çok soğuk havalarda bile tek marş çalışır, Motoru tertemiz bakımlı, Şanzıman gayet güzel vites geçişleri hissettirmez, yokuşta geri kaydırma yapmaz,
Keyfe keder ufak tefek koltuk kılıfı tavanda güneş yanığı gibi birkaç kozmetik masrafı vardır. Muayyer bir araçtır...
Acil nakit ihtiyacından ötürü bu fiyattan satılıktır, ilk gelen alır.', N'Passat    ', 900)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DaiyPrice], [Description], [CarName], [MinFindexScore]) VALUES (27, 1, 2, 2020, CAST(60.00 AS Decimal(18, 2)), N'- 2011 E 350 4MATİC PREMİUM 265 HP

- Koluman Bakımlı, Evrakları Mevcuttur

EKSPERTİZ RAPORU

- Araçta 4 Parça Çizikten Dolayı Boya Vardır.

- 3.000 TL Hasar Kaydı Mevcuttur.

- Aracın Yedek Anahtarı Ve Kitapçıkları Mevcuttur.

AKSESUAR LİSTESİ

Ahşap Direksiyon

Panoramik Cam Tavan

Distronik ( Araç Takip )

Kör Nokta

Şerit Takip

Adaptif Bi-xenon Farlar

F1 Vites

Ön Koltuk Isıtma

Arka Koltuk Isıtma  

Ön Koltuk Soğutma

Arka Yan Makam Perdeleri

Arka Elektrikli Perde

Bluetooth Telefon / Media

Cruise Control

Elektrikli / Isıtmalı Katlanır Yan Aynalar


Karartmalı Camlar

Ön Ve Arka Park Mesafe Sensösrü

İsofix

DS AUTO ETİLER 

Diğer Araçlarımız İçin Web Sitemize Bakabilirsiniz.

www.dsautoetiler.com

Nispetiye Mahallesi, Aytar Caddesi No:3/A Etiler / İstanbul 

0212 279 44 54

', N'M5        ', 700)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelYear], [DaiyPrice], [Description], [CarName], [MinFindexScore]) VALUES (28, 9, 9, 2010, CAST(150.00 AS Decimal(18, 2)), N'​

*** İTHALAT DURUMU: ÖZEL İTHALAT ***

*** VERGİ BARIŞI YAPILMIŞTIR ***

***ARAÇ KODU: 6689 ***



DIŞ RENK : MAT GRİ

İÇ RENK : SİYAH

DÖŞEME : DERİ / ALCANTARA

KAPLAMA : ALUMINYUM



- DONANIMLAR 

LIFTING

SERAMİK FREN SİSTEMİ

CARBON SPOILER

CARBON MARŞPİYELLER

CARBON SPLITTER

BI XENON FARLAR

PADDLESHIFT (F1)

SPOR DERİ DİREKSİYON

CD CHANGER

19" PIANO BLACK JANTLAR

SPOR GÖSTERGELER

ONBOARD COMPUTER

ELEKTRİKLİ KATLANIR YAN AYNALAR

ÇİFT YÖNLÜ DİJİTAL KLİMA

YOL BİLGİSAYARI

GÜNEŞ KORUMALI CAMLAR

*** PAZAR GÜNLERİ HİZMETİNİZDEYİZ **', N'Corolla   ', 1500)
SET IDENTITY_INSERT [dbo].[Cars] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Beyaz')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Siyah')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Sarı')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Kırmızı')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Turuncu')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (8, N'Mavi')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[CreditCards] ON 

INSERT [dbo].[CreditCards] ([Id], [CardNumber], [ExpireYear], [ExpireMonth], [Cvc], [CardHolderFullName], [Balance], [CustomerId]) VALUES (1, N'7458856941255236', N'2022', N'01', N'456', N'Huseyin Afsin', CAST(318.4000 AS Decimal(18, 4)), 3)
INSERT [dbo].[CreditCards] ([Id], [CardNumber], [ExpireYear], [ExpireMonth], [Cvc], [CardHolderFullName], [Balance], [CustomerId]) VALUES (3, N'4554856941255236', N'2027', N'04', N'412', N'Ahmet Sonmez', CAST(789.0000 AS Decimal(18, 4)), 3)
SET IDENTITY_INSERT [dbo].[CreditCards] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName], [FindexScore]) VALUES (1, 6, N'Company1', 1900)
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName], [FindexScore]) VALUES (2, 7, N'Company2', 1500)
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName], [FindexScore]) VALUES (3, 8, N'Company3', 1600)
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName], [FindexScore]) VALUES (5, 24, N'Company', 1500)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[MailSubscribes] ON 

INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (1, N'test@mail.com')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (2, N'sdsd')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (3, N'test@mail.com')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (4, N'sdsd')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (5, N'sdsd')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (6, N'dfd')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (7, N'fd')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (8, N'sdsd')
INSERT [dbo].[MailSubscribes] ([Id], [Email]) VALUES (9, N'xc')
SET IDENTITY_INSERT [dbo].[MailSubscribes] OFF
GO
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'customer')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([Id], [CreditCardId], [CustomerId], [Amount], [PaymentDate]) VALUES (1, 1, 1, CAST(50.0000 AS Decimal(18, 4)), CAST(N'2021-10-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Payments] ([Id], [CreditCardId], [CustomerId], [Amount], [PaymentDate]) VALUES (2, 1, 2, CAST(40.0000 AS Decimal(18, 4)), CAST(N'2021-12-24T20:17:33.7769441' AS DateTime2))
INSERT [dbo].[Payments] ([Id], [CreditCardId], [CustomerId], [Amount], [PaymentDate]) VALUES (3, 1, 2, CAST(141.6000 AS Decimal(18, 4)), CAST(N'2022-01-02T18:14:10.3778313' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (1, 2, 1, CAST(N'2021-10-08T22:17:59.0000000' AS DateTime2), CAST(N'2021-10-12T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (2, 2, 1, CAST(N'2021-10-08T22:18:12.0000000' AS DateTime2), CAST(N'2021-10-12T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (3, 2, 1, CAST(N'2021-10-08T22:20:32.0000000' AS DateTime2), CAST(N'2021-10-08T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (4, 2, 1, CAST(N'2021-10-08T22:21:21.0000000' AS DateTime2), CAST(N'2021-10-08T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (5, 3, 1, CAST(N'2021-10-08T22:28:25.0000000' AS DateTime2), CAST(N'2021-10-08T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (9, 0, 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (10, 2, 2, CAST(N'2021-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2021-12-25T00:00:00.0000000' AS DateTime2), 2, 1)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate], [PaymentId], [DeliveryStatus]) VALUES (11, 2, 2, CAST(N'2022-01-03T21:00:00.0000000' AS DateTime2), CAST(N'2022-01-05T21:00:00.0000000' AS DateTime2), 3, 1)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
GO
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 8, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2, 23, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (3, 1024, 1)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (6, N'test', N'test', N'test@mail.com', 0xBCC21DD575D067E9F4CB055C0DC64599D8882FA169B4B7787F05A07EA48DB69460B335CD2EEF04BE83CE6C4A12C59AC472835361718D68894F0D5B843C425D6B00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0x6BB81E0E4F44F33F5B8FEFF67E0A3699FB7169768533C9EFEB389DB7D1047A26D67B7EE51C2756AF74A0F1F794592B25D3657F69F5FF49AA0F87EB173460709C19DECDF2E6A31A57950C962E8F50CB8E9B42AE1DC4E4EBC1EF644D7F1280EF88F173739667899E39B5AE3B63746865133408D11614E85D98C8A4A6C251E1D417000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (7, N'ben', N'ben', N'ben@mail.com', 0x130A3E81653E2DAB61B0C3AC2279A7450B19C58C34BC35B2E5F1EB65C81610E14262D6C07698D746AE97FDF3A887EE126127F0AA3E9F0723DF298FB8B9F19018, 0x8BE9C67554610B24AEFC8713380947770E38EBD22B1C7F775975F5D8613D09A885588238E1FC8E990D7BFB4CA8DDD59D5035CA43E91CE44680A1C604330C05205008618BAC695EB5351E1E7366B4314A7C8C22737FE1D948AC27C6DAC545B6FBDE8FD307885E9AF7E90BCA17ACF4E3ED5B3A6BB04F342A7A80AF85E9B246EEE9, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (8, N'admin', N'admin', N'admin@mail.com', 0xF3723B98BE3A86088F584A46E7002AE7251BBE9A3F840C0944F93526E38C4046FD906089637817AC74F336641068BE10DA932C5A460E0E30F74EC8CC2C1B95A7, 0xB164FE6CA7019511E1F63B6A6DD09237D69644EF24ACC311D6D4EBF03DDAD06D9E5F89C4178A13CCE97C1C42F95ED36AD71537EC75507785C9A4DA32083E7C937F89D5F6B895F5F076327B3FCF9618A7EC30BCFF1D123C7702111B67647E26F8B1645063C54026B0FDAB29ED41B3CA053B1CD5C902D7E2FA0476D00A52DF4858, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (23, N'test1', N'test1', N'test1@mail.com', 0x21D9345AB7388BABF9D2172F02FC5FABAFB8BF3637D8F5E3E6249AB3724ADDD71C58479EB7CA0D750E9D7D9B002802EDFAB4E64875D7C05248EA864387693C87, 0xCF60D7C881A854A5080C78376F9DF9F8199D04253DD7BC60B082377D33F2B6C5F5AE6F5CED467F798860DFF568E75345C03D22F58E0EFB8B50595056CC014E7A69AF980F00A7826EAF0C8D90ACFBE1F5C91B1A9485A5F082679CD907E760C20442158844CFE98EC1CF0879F610A8827AEF1E8CBFA2640A511783F65B8D640748, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (24, N'Test', N'Test', N'test@customer.com', 0x7A0363466472502B2BC4C6752E74F6065A512612BC622578B2FA32EEB90B691059F7443D808E732F6329A8148B56CCBCB8C0E7CD33872A1EA3AC31ADBAA52CF5, 0x6F3AF0F08A207483B9F7B1EBE0AF32DB12CFF7F3ADF45842C047D126A1F00F2E01CB378413BF0504107265F08160C09C74B127AE298B56C94EA0A885300174B0D9309EAC681768245E460030AA0A5E4FFC2294D2B27B3DD84445E3EF23369698944C061AE3D6CBC340CA0669D103070E02AFB6E3C2136552B79BEF6F93943CE4, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (1024, N'Bekir', N'afsin', N'bekir@mail.com', 0x3C627E70B2FE07872DBCBBA3FB3B749FF3A469CA7A797E4DE68C55A194728555E70CCF5595F529E5AF11D668726B013789978D688A339558EE5A414A34638F55, 0x57E643A533C77B3FB9FDAD64CC8BBD64AD5FB37C1859E8796FFADBEEED5668109C149402A5B87B1602A070170A668DC4799F9D13C731C9CDF2771B7476357E38049C911466B78ED6461335741FD5DD30BCF328538106CCE094E551514928D7E4196DAB22CB04D1D444BAE328E03940C32A1FCFA0F3226D76E83A61EFB616E6C3, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[CreditCards] ADD  DEFAULT ((0)) FOR [CustomerId]
GO
/****** Object:  StoredProcedure [dbo].[BlackCarsFindexScores]    Script Date: 15.07.2022 11:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BlackCarsFindexScores]
AS
SELECT ca.CarName,ca.MinFindexScore FROM CARS as ca
WHERE ca.ColorId=2
GO
