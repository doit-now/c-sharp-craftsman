USE master
GO

CREATE DATABASE AirConditionerShopDBAutoKey
GO

USE AirConditionerShopDBAutoKey
GO

CREATE TABLE StaffMember(
  MemberID int primary key,
  Password nvarchar(40) not null,
  FullName nvarchar(60) not null,
  EmailAddress nvarchar(60) unique, 
  Role int
)
GO

INSERT INTO StaffMember VALUES(1982 ,N'@1', N'Administrator', 'admin@AirConditionerShop.com.sg', 1);
INSERT INTO StaffMember VALUES(1983 ,N'@2', N'Staff', 'staff@AirConditionerShop.com.sg', 2);
INSERT INTO StaffMember VALUES(1984 ,N'@3', N'Manager', 'manager@AirConditionerShop.com.sg', 3);

GO


CREATE TABLE SupplierCompany(
  SupplierId nvarchar(20) primary key,
  SupplierName nvarchar(80) not null,
  SupplierDescription nvarchar(250), 
  PlaceOfOrigin nvarchar(60)
)
GO
INSERT INTO SupplierCompany VALUES(N'SC0005',N'Daikin',N'A global leader in air conditioning manufacturing that provides energy-efficient and reliable for both residential and commercial use.', N'Japan')
GO
INSERT INTO SupplierCompany VALUES(N'SC0006',N'Carrier ',N'A well-known brand that offers a variety of air conditioning units, including split systems, window units, and portable systems.', N'Korea')
GO
INSERT INTO SupplierCompany VALUES(N'SC0007',N'Mitsubishi Electric',N'A top supplier of ductless air conditioning units that are ideal for small or confined spaces.', N'Germany')
GO
INSERT INTO SupplierCompany VALUES(N'SC0008',N'Lennox',N'A popular supplier of central air conditioning systems known for its high-quality and energy-efficient units.', N'United Kingdom')
GO
INSERT INTO SupplierCompany VALUES(N'SC0009',N'Trane ',N'A trusted brand that provides a range of air conditioning units, including split systems, heat pumps.', N'Nauy')
GO

CREATE TABLE AirConditioner(
 AirConditionerId int primary key identity,
 AirConditionerName nvarchar(200) not null,
 Warranty nvarchar(60),
 SoundPressureLevel nvarchar(80),
 FeatureFunction nvarchar(250),
 Quantity int,
 DollarPrice float,
 ManufacturedDate datetime,
 SupplierId nvarchar(20) references SupplierCompany(SupplierId) on delete cascade on update cascade
)
GO

INSERT INTO AirConditioner(AirConditionerName, Warranty, SoundPressureLevel, FeatureFunction, Quantity, DollarPrice, SupplierId) VALUES(N'4-16KW A+++ DC Inverter Monoblock Air Source Heat Pump for Hot Water Home Heating Cooling','3 years',N'53dB(A)','House Heating Cooling and Water Heating', 12, 2978,'SC0005')
GO
INSERT INTO AirConditioner(AirConditionerName, Warranty, SoundPressureLevel, FeatureFunction, Quantity, DollarPrice, SupplierId) VALUES(N'Hisense AC 9000btu 12000btu 18000btu 24000btu Cooling Inverter Super Save Energy wall mounted Wifi Home Air Conditioner Factory','5 years',N'18-45dB','Split Wall Mounted Air Conditioners', 10, 4412,'SC0005')
GO
INSERT INTO AirConditioner(AirConditionerName, Warranty, SoundPressureLevel, FeatureFunction, Quantity, DollarPrice, SupplierId) VALUES(N'Gree Air To Water Versati III Split Inverter Heat Pump 380v 10kw 12kw 14kw 16kw 18kw','2 years',N'48dB(A)','House Heating Cooling and Water Heating', 15, 3765,'SC0005')
GO
INSERT INTO AirConditioner(AirConditionerName, Warranty, SoundPressureLevel, FeatureFunction, Quantity, DollarPrice, SupplierId) VALUES(N'Gree 2022 R32 R410a Split Heatpump 10kw 15kw 20kw Germany Warmepumpe Mini Split Inverter Air Source Heat Pump For Sale','1 years',N'49/50dB(A)','Air Source Heat Pump', 18, 2034,'SC0005')
GO
INSERT INTO AirConditioner(AirConditionerName, Warranty, SoundPressureLevel, FeatureFunction, Quantity, DollarPrice, SupplierId) VALUES(N'R290 Monoblock DC EVI Invert Air to Water Heat Pump for Home Central Heating air conditioner Sanitary Hot water','10 years',N'18-60dB','Heating + Hot Water+cooling', 15, 3120,'SC0005')
GO
INSERT INTO AirConditioner(AirConditionerName, Warranty, SoundPressureLevel, FeatureFunction, Quantity, DollarPrice, SupplierId) VALUES(N'Competitive Portable Heat Pump Air Conditioner Hot Water Heating Cooling Heat Pumps','6 years',N'44/45dB','Swimming Pool Heating Cooling', 10, 3600,'SC0005')
GO