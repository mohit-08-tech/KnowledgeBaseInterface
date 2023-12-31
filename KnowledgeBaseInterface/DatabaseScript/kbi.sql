USE [master]
GO
/****** Object:  Database [KBI]    Script Date: 28-Jun-23 12:52:30 PM ******/
CREATE DATABASE [KBI] ON  PRIMARY 
( NAME = N'KBI', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\KBI.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'KBI_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\KBI_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [KBI] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [KBI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KBI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KBI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KBI] SET  MULTI_USER 
GO
ALTER DATABASE [KBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KBI] SET DB_CHAINING OFF 
GO
USE [KBI]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [varchar](50) NULL,
	[PostCategory] [varchar](50) NULL,
	[PostTitle] [varchar](50) NULL,
	[PostDescription] [varchar](50) NULL,
	[PostTags] [varchar](50) NULL,
	[PostAuthor] [varchar](50) NULL,
	[PostAuthorEmail] [varchar](50) NULL,
	[PostDate] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPosts]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPosts](
	[PostId] [uniqueidentifier] NOT NULL,
	[PostCategory] [numeric](18, 0) NOT NULL,
	[PostTitle] [nvarchar](50) NOT NULL,
	[PostDescription] [nvarchar](max) NOT NULL,
	[PostTags] [nvarchar](50) NULL,
	[PostAuthorName] [nvarchar](50) NULL,
	[PostAuthorEmail] [nvarchar](50) NULL,
	[PostDate] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [varchar](30) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[IsAdmin] [varchar](1) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Designation] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20230619-172512]    Script Date: 28-Jun-23 12:52:30 PM ******/
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20230619-172512] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPosts] ADD  DEFAULT (newid()) FOR [PostId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ('N') FOR [IsAdmin]
GO
ALTER TABLE [dbo].[UserPosts]  WITH CHECK ADD  CONSTRAINT [FK_UserPosts_Categories] FOREIGN KEY([PostCategory])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[UserPosts] CHECK CONSTRAINT [FK_UserPosts_Categories]
GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddNewUser]
	@UserId as varchar(30),
	@Email as varchar(100),
	@Password as varchar(max),
	@Phone as nvarchar(20),
	@Designation as nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	insert into Users(UserId,Email,Password,Phone,Designation)
	values(@UserId,@Email,@Password,@Phone,@Designation);
END
GO
/****** Object:  StoredProcedure [dbo].[CreateNewPost]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CreateNewPost]
@PostCateogry as numeric(18,0),
@PostTitle as nvarchar(50),
@PostDescription as nvarchar(max),
@PostTags as nvarchar(50),
@PostAuthorName as nvarchar(50),
@PostAuthorEmail as nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	Insert into UserPosts(PostCategory,PostTitle,PostDescription,PostTags,PostAuthorName,PostAuthorEmail,PostDate)
	values(@PostCateogry,@PostTitle,@PostDescription,@PostTags,@PostAuthorName,@PostAuthorEmail, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCategories] 
AS
BEGIN
	SET NOCOUNT ON;
	select * from Categories order by Name
END
GO
/****** Object:  StoredProcedure [dbo].[GetTopArticles]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetTopArticles] 
AS
BEGIN
	SET NOCOUNT ON;

 SELECT TOP 4 u.PostId, u.PostCategory as PostCategoryId, c.Name as PostCategoryName, u.PostTitle, 
 u.PostDescription, u.PostTags, u.PostAuthorName as PostAuthorName, 
 u.PostAuthorEmail as PostAuthorEmail, u.PostDate
FROM UserPosts u
INNER JOIN Categories c ON
c.Id = u.PostCategory
ORDER BY PostDate DESC;

END
GO
/****** Object:  StoredProcedure [dbo].[GetTopTags]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetTopTags] 
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT DISTINCT TOP 8 PostTags, PostDate
	FROM (
		SELECT PostTags, MAX(PostDate) AS PostDate
		FROM UserPosts
		GROUP BY PostTags
	) AS Subquery
	ORDER BY PostDate DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUserInfo]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetUserInfo]
	@Email as varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT u.UserId,u.Email,u.IsAdmin,u.Phone,u.Designation,COUNT(up.PostAuthorEmail) as PostCount
	FROM Users u LEFT JOIN UserPosts up ON up.PostAuthorEmail = u.Email
	WHERE u.Email = @Email
	GROUP BY u.UserId,u.Email,u.IsAdmin,u.Phone,u.Designation
END
GO
/****** Object:  StoredProcedure [dbo].[IsUserAlreadyExist]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsUserAlreadyExist]
	@Email as varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	select count(*) from Users where Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[SearchPosts]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[SearchPosts]
	@SearchString as nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;

SELECT u.PostId, u.PostCategory as PostCategoryId, c.Name as PostCategoryName, u.PostTitle, 
 u.PostDescription, u.PostTags, u.PostAuthorName as PostAuthorName, 
 u.PostAuthorEmail as PostAuthorEmail, u.PostDate
FROM UserPosts u
INNER JOIN Categories c ON
c.Id = u.PostCategory
WHERE PostTitle like ('%' + @SearchString + '%') OR
	PostDescription like ('%' + @SearchString + '%') OR
	PostTags like ('%' + @SearchString + '%')
	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserProfile]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateUserProfile]
	@Email as varchar(100),
	@UserId as varchar(30),
	@Phone as nvarchar(20),
	@Desgination as nvarchar(50)

AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Users SET UserId = @UserId,
	Phone = @Phone,Designation = @Desgination
	WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[ValidateUserLogin]    Script Date: 28-Jun-23 12:52:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidateUserLogin]
	@Email as varchar(50),
	@Password as varchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	select Top 1 UserId from Users 
	where 
	Email = @Email AND
	Password = @Password
END
GO
USE [master]
GO
ALTER DATABASE [KBI] SET  READ_WRITE 
GO
