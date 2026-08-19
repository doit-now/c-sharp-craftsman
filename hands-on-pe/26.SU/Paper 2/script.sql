IF DB_ID(N'PRN212_3') IS NOT NULL
BEGIN
    ALTER DATABASE [PRN212_3] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [PRN212_3];
END
GO
CREATE DATABASE [PRN212_3];
GO
USE [PRN212_3];
GO
CREATE TABLE Genres (
    GenreId INT IDENTITY(1,1) PRIMARY KEY,
    GenreName NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE Studios (
    StudioId INT IDENTITY(1,1) PRIMARY KEY,
    StudioName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL
);
GO
CREATE TABLE Movies (
    MovieId INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    RatingCode NVARCHAR(20) NOT NULL,
    ReleaseYear INT NOT NULL,
    DurationMinutes INT NOT NULL,
    GenreId INT NOT NULL,
    StudioId INT NOT NULL,
    CONSTRAINT FK_Movies_Genres FOREIGN KEY (GenreId) REFERENCES Genres(GenreId),
    CONSTRAINT FK_Movies_Studios FOREIGN KEY (StudioId) REFERENCES Studios(StudioId)
);
GO
INSERT INTO Genres (GenreName) VALUES
(N'Action'),
(N'Comedy'),
(N'Drama'),
(N'Documentary'),
(N'Animation');
GO
INSERT INTO Studios (StudioName, Email) VALUES
(N'Sky Studio', N'sky@studio.vn'),
(N'Blue Media', N'blue@studio.vn'),
(N'Green Pictures', N'green@studio.vn'),
(N'Sun Film', N'sun@studio.vn'),
(N'Moon Entertainment', N'moon@studio.vn');
GO
INSERT INTO Movies (Title, RatingCode, ReleaseYear, DurationMinutes, GenreId, StudioId) VALUES
(N'Fast Route', N'PG13', 2021, 110, 1, 1),
(N'Funny Day', N'PG', 2020, 95, 2, 2),
(N'Silent Road', N'R', 2019, 120, 3, 3),
(N'Ocean Life', N'G', 2022, 80, 4, 4),
(N'Robot Friends', N'G', 2023, 90, 5, 5),
(N'City Hero', N'PG13', 2024, 115, 1, 1),
(N'Family Trip', N'PG', 2021, 100, 2, 2),
(N'Deep Story', N'PG13', 2022, 125, 3, 3);
GO
SELECT * FROM Genres;
SELECT * FROM Studios;
SELECT * FROM Movies;
GO