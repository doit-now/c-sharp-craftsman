USE master
GO

CREATE DATABASE Fall24PerfumeStoreDB 
GO

USE Fall24PerfumeStoreDB
GO

CREATE TABLE PSAccount (
  PSAccountID int primary key,
  Password nvarchar(60) not null,
  EmailAddress nvarchar(100) unique, 
  PSAccountNote nvarchar(220) not null,
  Role int
)
GO

INSERT INTO PSAccount VALUES(551 ,N'@5','admin@PerfumeStore.net', N'System Admin', 1);
INSERT INTO PSAccount VALUES(553 ,N'@5','manager@PerfumeStore.net', N'Project Manager', 2);
INSERT INTO PSAccount VALUES(552 ,N'@5','staff@PerfumeStore.net', N'Staff', 3);
INSERT INTO PSAccount VALUES(554 ,N'@5','member1@PerfumeStore.net', N'Member', 4);
GO


CREATE TABLE ProductionCompany (
  ProductionCompanyID nvarchar(30) primary key,
  ProductionCompanyName nvarchar(100) not null,
  Country nvarchar(50) not null, 
  ProductionCompanyAddress nvarchar(100) not null
)
GO

INSERT INTO ProductionCompany VALUES(N'TE001123', N'Chanel', N'France', N'135 Avenue Charles de Gaulle, 92200 Neuilly-sur-Seine, France')
GO
INSERT INTO ProductionCompany VALUES(N'TE001124', N'Dior', N'France', N'30 Avenue Montaigne, 75008 Paris, France')
GO
INSERT INTO ProductionCompany VALUES(N'TE001125', N'Gucci', N'Italy', N'Via Tornabuoni 17, 50123 Florence, Italy')
GO
INSERT INTO ProductionCompany VALUES(N'TE001126', N'Est e Lauder', N'USA', N'767 Fifth Avenue, New York, NY 10153, USA')
GO
INSERT INTO ProductionCompany VALUES(N'TE001127', N'Yves Saint Laurent (YSL)', N'France', N'5 Avenue George V, 75008 Paris, France')
GO



/*
Perfume Name: The name of the fragrance.
Concentration: Type of fragrance concentration (e.g., Eau de Toilette, Eau de Parfum, Parfum).
Bottle Size: Volume of the bottle (e.g., 30ml, 50ml, 100ml).
ReleaseDate: Year or season when the perfume was launched.
Price: Retail price of the perfume.
Longevity: How long the fragrance typically lasts on the skin.
Ingredients: Key ingredients used in the formulation.
*/
CREATE TABLE PerfumeInformation (
  PerfumeID nvarchar(30) PRIMARY KEY,
  PerfumeName nvarchar(100) not null,
  Ingredients nvarchar(250) not null, 
  ReleaseDate Datetime,
  Concentration nvarchar(100) not null,
  Longevity nvarchar(100) not null, 
  ProductionCompanyID nvarchar(30) FOREIGN KEY references ProductionCompany(ProductionCompanyID) on delete cascade on update cascade
)
GO

INSERT INTO PerfumeInformation VALUES(N'P00011', N'Chanel No. 5', N'Jasmine, Rose, Sandalwood, Vanilla, Aldehydes', CAST(N'2021-3-13' AS DateTime), N'Eau de Parfum', N'6-8 hours', N'TE001123')
GO
INSERT INTO PerfumeInformation VALUES(N'P00012', N'Dior Sauvage', N'Bergamot, Pepper, Ambroxan, Patchouli', CAST(N'2015-4-19' AS DateTime), N'Eau de Toilette', N'8-10 hours', N'TE001124')
GO
INSERT INTO PerfumeInformation VALUES(N'P00013', N'Yves Saint Laurent Black Opium', N'Coffee, Vanilla, White Flowers, Cedarwood', CAST(N'2014-7-10' AS DateTime), N'Eau de Parfum', N'6-8 hours', N'TE001127')
GO
INSERT INTO PerfumeInformation VALUES(N'P00014', N'Gucci Bloom', N'Jasmine Bud, Tuberose, Rangoon Creeper', CAST(N'2017-9-30' AS DateTime), N'Eau de Parfum', N'5-7 hours', N'TE001125')
GO
INSERT INTO PerfumeInformation VALUES(N'P00015', N'Lanc me La Vie Est Belle', N'Iris, Jasmine, Orange Blossom, Patchouli, Vanilla', CAST(N'2012-7-10' AS DateTime), N'Eau de Parfum', N'6-8 hours', N'TE001123')
GO
INSERT INTO PerfumeInformation VALUES(N'P00016', N'Versace Eros', N'Mint, Lemon, Apple, Tonka Bean, Vanilla', CAST(N'2012-4-10' AS DateTime), N'Eau de Toilette', N'7-9 hours', N'TE001123')
GO
INSERT INTO PerfumeInformation VALUES(N'P00017', N'Calvin Klein CK One', N'Green Tea, Bergamot, Papaya, Jasmine, Musk', CAST(N'1994-10-10' AS DateTime), N'Eau de Toilette', N'4-6 hours', N'TE001123')
GO
INSERT INTO PerfumeInformation VALUES(N'P00018', N'Prada Candy', N'Caramel, Musk, Benzoin, Vanilla', CAST(N'2011-3-15' AS DateTime), N'Eau de Parfum', N'5-7 hours', N'TE001123')
GO





