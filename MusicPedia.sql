CREATE TABLE [Musician] (
  [MusicianID] INT NOT NULL,
  [FmlID] INT NOT NULL,
  [Description] NVARCHAR(4000) DEFAULT 'Not information',
  [DateOfBirth] DATE,
  [PlaceOfBirth] NVARCHAR(255),
  [YearsActive] NVARCHAR(255),
  PRIMARY KEY ([MusicianID])
)
GO

CREATE TABLE [FML] (
  [FmlID] INT NOT NULL,
  [LastName] NVARCHAR(50) NOT NULL,
  [Name] NVARCHAR(20) NOT NULL,
  [MiddleName] NVARCHAR(50) DEFAULT 'Not information',
  [MusicianID] INT NOT NULL,
  PRIMARY KEY ([FmlID])
)
GO

CREATE TABLE [Band] (
  [BandID] INT NOT NULL,
  [Name] NVARCHAR(30) NOT NULL,
  [Description] NVARCHAR(2000),
  [Origin] NVARCHAR(100) DEFAULT 'Not information',
  [YearsActive] DATE,
  [Website] NVARCHAR(255),
  PRIMARY KEY ([BandID])
)
GO

CREATE TABLE [Genre] (
  [GenreID] INT NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  [Description] NVARCHAR(255) DEFAULT 'Not information',
  PRIMARY KEY ([GenreID])
)
GO

CREATE TABLE [Instrument] (
  [InstrumentID] INT NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  [Description] NVARCHAR(255) DEFAULT 'Not information',
  [Developed] DATE NOT NULL,
  [BrandID] INT,
  [ClassificationID] INT NOT NULL,
  PRIMARY KEY ([InstrumentID])
)
GO

CREATE TABLE [Album] (
  [AlbumID] INT NOT NULL,
  [Name] NVARCHAR(50) NOT NULL,
  [Description] NVARCHAR(255) DEFAULT 'Not information',
  [Released] DATE NOT NULL,
  [StudioID] INT NOT NULL,
  [Length] INT NOT NULL,
  PRIMARY KEY ([AlbumID])
)
GO

CREATE TABLE [BandAlbum] (
  [BandID] INT NOT NULL,
  [AlbumID] INT NOT NULL,
  PRIMARY KEY ([AlbumID], [BandID])
)
GO

CREATE TABLE [MusicianAlbum] (
  [MusicianID] INT NOT NULL,
  [AlbumID] INT NOT NULL,
  PRIMARY KEY ([AlbumID],[MusicianID])
)
GO

CREATE TABLE [Song] (
  [SongID] INT NOT NULL,
  [Name] NVARCHAR(30) NOT NULL,
  [Description] NVARCHAR(255),
  [Length] INT,
  [AlbumID] INT NOT NULL,
  PRIMARY KEY ([SongID])
)
GO


CREATE TABLE [SongGenre] (
  [SongID] INT NOT NULL,
  [GenreID] INT NOT NULL,
  PRIMARY KEY ([SongID],[GenreID])
)
GO

CREATE TABLE [SongMusican] (
  [SongID] INT NOT NULL,
  [MusicianID] INT NOT NULL,
  PRIMARY KEY ([SongID],[MusicianID])
)
GO

CREATE TABLE [MarkPublication] (
  [Value] INT NOT NULL,
  [UserID] INT NOT NULL,
  [PublicationID] INT NOT NULL,
  PRIMARY KEY ([UserID],[PublicationID])
)
GO

CREATE TABLE [MarkReview] (
  [Value] INT NOT NULL,
  [UserID] INT NOT NULL,
  [ReviewID] INT NOT NULL,
  PRIMARY KEY ([UserID],[ReviewID])
)
GO

CREATE TABLE [Publication] (
  [PublicationID] INT NOT NULL,
  [Title] NVARCHAR(30) NOT NULL,
  [Description] NVARCHAR(255) DEFAULT 'Not information',
  PRIMARY KEY ([PublicationID])
)
GO

CREATE TABLE [Review] (
  [ReviewID] INT NOT NULL,
  [Title] NVARCHAR(30) NOT NULL,
  [Text] NVARCHAR(255),
  [UserID] INT NOT NULL,
  [AlbumID] INT NOT NULL,
  PRIMARY KEY ([ReviewID])
)
GO

CREATE TABLE [Comment] (
  [CommentID] INT NOT NULL,
  [Title] NVARCHAR(30) NOT NULL,
  [Text] NVARCHAR(255),
  [UserID] INT NOT NULL,
  [PublicationID] INT NOT NULL,
  [DateAdd] DATETIME NOT NULL,
  PRIMARY KEY ([CommentID])
)
GO

CREATE TABLE [Label] (
  [LabelsID] INT NOT NULL,
  [Name] NVARCHAR(30) NOT NULL,
  [Description] NVARCHAR(255) DEFAULT 'Not information',
  PRIMARY KEY ([LabelsID])
)
GO

CREATE TABLE [Studio] (
  [StudioID] INT NOT NULL,
  [Name] NVARCHAR(30) NOT NULL,
  [Description] NVARCHAR(255) DEFAULT 'Not information',
  [CountryID] INT NOT NULL,
  PRIMARY KEY ([StudioID])
)
GO

CREATE TABLE [Country] (
  [CountryID] INT NOT NULL,
  [Name] NVARCHAR(30) NOT NULL,
  PRIMARY KEY ([CountryID])
)
GO

CREATE TABLE [LogReview] (
  [LogReviewID] INT NOT NULL,
  [ReviewID] INT NOT NULL,
  [UserID] INT NOT NULL,
  [DateReview] DATETIME NOT NULL,
  PRIMARY KEY ([ReviewID])
)
GO

CREATE TABLE [LogComment] (
  [LogCommentID] INT NOT NULL,
  [CommentID] INT NOT NULL,
  [UserID] INT NOT NULL,
  [DateReview] DATETIME NOT NULL,
  PRIMARY KEY ([LogCommentID])
)
GO

CREATE TABLE [LogUpdatePubliction] (
  [LogUpdateID] INT NOT NULL,
  [FmlID] INT NOT NULL,
  [Date] DATE NOT NULL,
  [PublicationID] INT NOT NULL,
  PRIMARY KEY ([LogUpdateID])
)
GO

CREATE TABLE [User] (
  [UserID] INT NOT NULL,
  [UserDataID] INT,
  [Email] NVARCHAR(30) NOT NULL,
  [NormalizedEmail] NVARCHAR(30) NOT NULL,
  [EmailConfirmed] BIT NOT NULL,
  [PasswordHash] NVARCHAR(20) NOT NULL,
  [PhoneNumber] NVARCHAR(20),
  [PhoneNumberConfirmed] BIT NOT NULL,
  PRIMARY KEY ([UserID])
)
GO


CREATE TABLE [Author] (
  [AuthorID] INT NOT NULL,
  [Email] NVARCHAR NOT NULL,
  [Password] NVARCHAR(20) NOT NULL,
  PRIMARY KEY ([AuthorID])
)
GO

CREATE TABLE [Role] (
  [RoleID] INT NOT NULL,
  [Name] NVARCHAR(10) NOT NULL,
  PRIMARY KEY ([RoleID])
)
GO

CREATE TABLE [UserData] (
  [UserDataID] INT NOT NULL,
  [NickName] NVARCHAR(30) NOT NULL,
  [Date] DATETIME NOT NULL,
  [Description] NVARCHAR(50),
  PRIMARY KEY ([UserDataID])
)
GO

CREATE TABLE [BandGenre] (
  [BandGenreID] INT NOT NULL,
  [GenreID] INT NOT NULL,
  [BandID] INT NOT NULL,
  PRIMARY KEY ([BandGenreID])
)
GO

CREATE TABLE [AlbumGenre] (
  [AlbumGenreID] INT NOT NULL,
  [GenreID] INT NOT NULL,
  [AlbumID] INT NOT NULL,
  PRIMARY KEY ([AlbumGenreID])
)
GO

CREATE TABLE [BandLabel] (
  [BandLabelID] INT NOT NULL,
  [LabelID] INT NOT NULL,
  [BandID] INT NOT NULL,
  PRIMARY KEY ([BandLabelID])
)
GO

CREATE TABLE [MusicianInstrument] (
  [MusicianInstrumentID] INT NOT NULL,
  [MusicianID] INT NOT NULL,
  [InstrumentID] INT NOT NULL,
  PRIMARY KEY ([MusicianInstrumentID])
)
GO

CREATE TABLE [MusicianBand] (
  [MusicianBandID] INT NOT NULL,
  [MusicianID] INT NOT NULL,
  [BandID] INT NOT NULL,
  PRIMARY KEY ([MusicianBandID])
)
GO

CREATE TABLE [MusicianLabel] (
  [MusicianLabelID] INT NOT NULL,
  [MusicianID] INT NOT NULL,
  [LabelID] INT NOT NULL,
  PRIMARY KEY ([MusicianLabelID])
)
GO

CREATE TABLE [UserRoles] (
  [UserID] INT NOT NULL,
  [RoleID] INT NOT NULL,
  [DateUp] DATETIME NOT NULL,
  PRIMARY KEY ([UserID],[RoleID])
)
GO

CREATE TABLE [MusicianGenre] (
  [MusicianGenreID] INT NOT NULL,
  [MusicianID] INT NOT NULL,
  [GenreID] INT NOT NULL,
  PRIMARY KEY ([MusicianGenreID])
)
GO

CREATE TABLE [Classification] (
  [ClassificationID] INT NOT NULL,
  [Name] NVARCHAR(40) NOT NULL,
  PRIMARY KEY ([ClassificationID])
)
GO

CREATE TABLE [InstrumentClassification] (
  [ClassificationID] INT NOT NULL,
  [InstrumentID] INT NOT NULL,
  PRIMARY KEY ([ClassificationID],[InstrumentID])
)
GO

CREATE TABLE [Brand] (
  [BrandID] INT NOT NULL,
  [Name] NVARCHAR(40) NOT NULL,
  PRIMARY KEY ([BrandID])
)
GO

ALTER TABLE [Musician] ADD FOREIGN KEY ([FmlID]) REFERENCES [FML] ([FmlID])
GO

ALTER TABLE [FML] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [User] ADD FOREIGN KEY ([UserDataID]) REFERENCES [UserData] ([UserDataID])
GO

ALTER TABLE [Album] ADD FOREIGN KEY ([StudioID]) REFERENCES [Studio] ([StudioID])
GO

ALTER TABLE [Song] ADD FOREIGN KEY ([AlbumID]) REFERENCES [Album] ([AlbumID])
GO

ALTER TABLE [LogReview] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [LogReview] ADD FOREIGN KEY ([ReviewID]) REFERENCES [Review] ([ReviewID])
GO

ALTER TABLE [LogUpdatePubliction] ADD FOREIGN KEY ([PublicationID]) REFERENCES [Publication] ([PublicationID])
GO

ALTER TABLE [LogUpdatePubliction] ADD FOREIGN KEY ([FmlID]) REFERENCES [FML] ([FmlID])
GO

ALTER TABLE [BandGenre] ADD FOREIGN KEY ([BandID]) REFERENCES [Band] ([BandID])
GO

ALTER TABLE [BandGenre] ADD FOREIGN KEY ([GenreID]) REFERENCES [Genre] ([GenreID])
GO

ALTER TABLE [BandLabel] ADD FOREIGN KEY ([BandID]) REFERENCES [Band] ([BandID])
GO

ALTER TABLE [BandLabel] ADD FOREIGN KEY ([LabelID]) REFERENCES [Label] ([LabelsID])
GO

ALTER TABLE [MusicianInstrument] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [MusicianInstrument] ADD FOREIGN KEY ([InstrumentID]) REFERENCES [Instrument] ([InstrumentID])
GO

ALTER TABLE [MusicianBand] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [MusicianBand] ADD FOREIGN KEY ([BandID]) REFERENCES [Band] ([BandID])
GO

ALTER TABLE [MusicianLabel] ADD FOREIGN KEY ([LabelID]) REFERENCES [Label] ([LabelsID])
GO

ALTER TABLE [MusicianLabel] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [MusicianGenre] ADD FOREIGN KEY ([GenreID]) REFERENCES [Genre] ([GenreID])
GO

ALTER TABLE [MusicianGenre] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [MarkPublication] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Review] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [AlbumGenre] ADD FOREIGN KEY ([AlbumID]) REFERENCES [Album] ([AlbumID])
GO

ALTER TABLE [AlbumGenre] ADD FOREIGN KEY ([GenreID]) REFERENCES [Genre] ([GenreID])
GO

ALTER TABLE [UserRoles] ADD FOREIGN KEY ([RoleID]) REFERENCES [Role] ([RoleID])
GO

ALTER TABLE [UserRoles] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Review] ADD FOREIGN KEY ([AlbumID]) REFERENCES [Album] ([AlbumID])
GO

ALTER TABLE [MarkPublication] ADD FOREIGN KEY ([PublicationID]) REFERENCES [Publication] ([PublicationID])
GO

ALTER TABLE [Instrument] ADD FOREIGN KEY ([BrandID]) REFERENCES [Brand] ([BrandID])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [Comment] ADD FOREIGN KEY ([PublicationID]) REFERENCES [Publication] ([PublicationID])
GO

ALTER TABLE [LogComment] ADD FOREIGN KEY ([CommentID]) REFERENCES [Comment] ([CommentID])
GO

ALTER TABLE [LogComment] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [MarkReview] ADD FOREIGN KEY ([ReviewID]) REFERENCES [Review] ([ReviewID])
GO

ALTER TABLE [MarkReview] ADD FOREIGN KEY ([UserID]) REFERENCES [User] ([UserID])
GO

ALTER TABLE [InstrumentClassification] ADD FOREIGN KEY ([ClassificationID]) REFERENCES [Classification] ([ClassificationID])
GO

ALTER TABLE [InstrumentClassification] ADD FOREIGN KEY ([InstrumentID]) REFERENCES [Instrument] ([InstrumentID])
GO

ALTER TABLE [SongGenre] ADD FOREIGN KEY ([SongID]) REFERENCES [Song] ([SongID])
GO

ALTER TABLE [SongGenre] ADD FOREIGN KEY ([SongID]) REFERENCES [Song] ([SongID])
GO

ALTER TABLE [SongMusican] ADD FOREIGN KEY ([SongID]) REFERENCES [Song] ([SongID])
GO

ALTER TABLE [SongMusican] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [Studio] ADD FOREIGN KEY ([CountryID]) REFERENCES [Country] ([CountryID])
GO

ALTER TABLE [BandAlbum] ADD FOREIGN KEY ([BandID]) REFERENCES [Band] ([BandID])
GO

ALTER TABLE [BandAlbum] ADD FOREIGN KEY ([AlbumID]) REFERENCES [Album] ([AlbumID])
GO

ALTER TABLE [MusicianAlbum] ADD FOREIGN KEY ([MusicianID]) REFERENCES [Musician] ([MusicianID])
GO

ALTER TABLE [MusicianAlbum] ADD FOREIGN KEY ([AlbumID]) REFERENCES [Album] ([AlbumID])
GO
