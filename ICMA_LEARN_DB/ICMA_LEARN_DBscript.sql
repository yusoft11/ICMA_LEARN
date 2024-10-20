USE [master]
GO
/****** Object:  Database [ICMA_LEARN]    Script Date: 10/20/2024 11:53:42 PM ******/
CREATE DATABASE [ICMA_LEARN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ICMA_LEARN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ICMA_LEARN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ICMA_LEARN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ICMA_LEARN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ICMA_LEARN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ICMA_LEARN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ARITHABORT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ICMA_LEARN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ICMA_LEARN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ICMA_LEARN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ICMA_LEARN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ICMA_LEARN] SET  MULTI_USER 
GO
ALTER DATABASE [ICMA_LEARN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ICMA_LEARN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ICMA_LEARN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ICMA_LEARN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ICMA_LEARN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ICMA_LEARN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ICMA_LEARN] SET QUERY_STORE = OFF
GO
USE [ICMA_LEARN]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryDescription] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Categori__19093A2B3668B72E] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[CourseDescription] [varchar](200) NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [PK__Courses__C92D7187ECD340F8] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[CourseID] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[EnrollemntDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Enrollme__7F6877FBD2C9D1DF] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[Amount] [money] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentMethod] [varchar](20) NULL,
 CONSTRAINT [PK__Payment__9B556A586C06F291] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[CourseID] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[QuizName] [varchar](50) NOT NULL,
	[QuizDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Quiz__8B42AE6E46A031A6] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizScores]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizScores](
	[QuizScoreID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[CourseID] [bigint] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[QuizID] [bigint] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK__QuizScor__3BC1FA9F8E222998] PRIMARY KEY CLUSTERED 
(
	[QuizScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/20/2024 11:53:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Users__1788CCAC47F6FA0E] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (1, N'Accounting and Finance')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (2, N'Customer Service')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (3, N'Communication')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (4, N'Business')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (5, N'Data Analytics')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (6, N'Entrepreneurship')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (7, N'Education')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (8, N'E-Commerce')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (9, N'Health and Fitness')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (10, N'Digital Marketing')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (11, N'Humanities')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (12, N'Human Resources')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (13, N'IT')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (14, N'Marketing')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (15, N'Law')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (16, N'Office Productivity')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (17, N'Leadership and Management')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (18, N'Nutrition')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (19, N'Occupational Health and Safety')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (20, N'Sales Management')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (21, N'Personal Development')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (22, N'Psychology')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (23, N'Project Management')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (24, N'Science')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (25, N'Sociology')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (26, N'Supply Chain Management')
INSERT [dbo].[Categories] ([CategoryID], [CategoryDescription]) VALUES (27, N'Soft Skills')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (1, 1, N'Microsoft Excel – Excel from Beginner to Advanced', 15.7100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (2, 1, N'Creative Accounting', 12.7200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (3, 1, N'Introduction to Accounting and Finance', 19.2100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (4, 1, N'Introduction to Public Revenue', 12.5100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (5, 1, N'Basic Principles Of Public Sector Accounting', 12.2700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (6, 1, N'Time Value Of Money: Future Value, Present Value, And Interest Rates', 18.3700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (7, 1, N'Risk and Return In Finance', 10.8700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (8, 1, N'Corporate Capital Structure', 14.4000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (9, 1, N'Introduction To Corporate Finance', 18.8500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (10, 1, N'Introduction to Financial Accounting', 14.1900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (11, 1, N'Capital Budgeting Techniques', 18.4500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (12, 1, N'Cost Management', 15.4800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (13, 1, N'Understanding Financial Contracts', 18.6800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (14, 1, N'Guide To Financial Marketing, Investing And Trading', 13.8100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (15, 1, N'Learn To Analyze Real Estate Investment', 14.8900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (16, 1, N'Business Analysis Fundamentals', 12.0600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (17, 1, N'Becoming A Product Manager', 15.5200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (18, 1, N'Learn Investment Banking', 16.8500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (19, 1, N'Introduction to Investment and Taxation', 13.9000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (20, 1, N'Introduction to Investment and Taxation', 11.1300)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (21, 1, N'Introduction to Balance sheets', 16.4000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (22, 1, N'Financial Literacy', 13.6400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (23, 1, N'Financial Freedom: A beginner’s guide', 18.0100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (24, 4, N'Sales Funnel Authority', 19.6700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (25, 4, N'How to Build and Grow A Profitable Email List', 12.7000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (26, 4, N'Boosting the Value of Customer Service', 11.9200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (27, 4, N'Building Emotional Intelligence', 12.8200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (28, 3, N'Customer Service Career', 11.6700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (29, 2, N'Diploma in Hospitality Management', 18.3000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (30, 4, N'Group Communication in Business', 18.4800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (31, 4, N'Consumer Behaviour Psychology', 13.4100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (32, 3, N'Effective Organizational Communication', 18.9000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (33, 4, N'Corporate Communication', 17.2500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (34, 2, N'Advanced Diploma in Customer Service', 12.5000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (35, 4, N'Advanced Diploma in Business Communication', 11.0900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (36, 4, N'Customer Service Skills Sets', 17.3400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (37, 4, N'Customer Service Duties', 14.1800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (38, 4, N'Creating A Visual Impression In Business', 13.3700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (39, 4, N'The Art And Science Of Dialogues In Business', 13.9500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (40, 4, N'The Customer Service Workplace', 13.2600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (41, 4, N'Providing Information For Customers', 15.0500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (42, 4, N'Understanding Your Clients', 15.5000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (43, 4, N'Understanding Business Communication', 19.0800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (44, 4, N'Listening To Your Customers', 19.5100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (45, 4, N'Customer Service Training', 19.8500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (46, 4, N'Customer Relationship Management in Business Services', 17.2900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (47, 4, N'Characteristics of A Successful Entrepreneur', 19.7400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (48, 4, N'Diploma In Telemarketing', 15.6800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (49, 3, N'Diploma In Customer Service', 16.9700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (50, 4, N'Diploma In Service Management', 11.6600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (51, 4, N'Diploma in Business Communication Skills', 19.5700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (52, 3, N'Advanced Communication Skills', 18.8100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (53, 4, N'Sales Training: Practice and Sales Techniques', 17.0900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (54, 4, N'Improving Personal Productivity', 19.2600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (55, 4, N'Effective Communication and Sales Techniques', 10.5600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (56, 3, N'Building Assertiveness', 16.6400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (57, 4, N'Building an Online Business', 18.8800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (58, 4, N'Administrative Support', 14.3900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (59, 7, N'Coaching Leadership and Creativity', 13.2600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (60, 7, N'Introduction to Developmental Psychology II', 15.9300)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (61, 7, N'Introduction to Developmental Psychology I', 12.2000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (62, 7, N'Becoming A Successful Teaching Assistant', 15.2500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (63, 7, N'Learning To Learn', 17.6800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (64, 7, N'Working with Students with Special Educational Needs', 14.5100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (65, 7, N'Simple Approach On Study Skills', 13.9500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (66, 7, N'Effective Teaching Skills', 13.8700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (67, 7, N'Speaking and Writing Effectively', 17.4400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (68, 7, N'Basic Learning Process', 14.8700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (69, 7, N'Active Learning', 11.0000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (70, 7, N'Presentation Skills', 18.0100)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (71, 7, N'Conscious Listening', 11.3700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (72, 7, N'Applying Innovation', 16.2500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (73, 7, N'Security Awareness Training', 12.8200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (74, 7, N'Instructional Planning for Successful Teaching', 13.3400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (75, 9, N'Stress Extinguisher', 19.5200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (76, 9, N'Overcoming Anxiety with a Formula', 16.5500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (77, 9, N'Absolute Yoga', 17.8800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (78, 9, N'Diploma In Stress Management', 18.9500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (79, 9, N'Diploma In Human Nutrition', 10.3500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (80, 9, N'Food Safety And Hygiene For Food Handlers', 10.6500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (81, 9, N'Balancing Work And Life', 18.2900)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (82, 9, N'Physical Health and Fitness', 12.9000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (83, 9, N'Human Health – Diet and Nutrition', 18.2600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (84, 10, N'Facebook Ads And Facebook Marketing Masterclass', 16.7600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (85, 10, N'Instagram Marketing: Account Growth And Monetization', 12.2400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (86, 10, N'Newsletter Marketing For Authors And Bloggers', 17.9400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (87, 10, N'Profitable Tools For Online Business', 14.1200)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (88, 10, N'LinkedIn Ads: Paid And Content Marketing', 17.2000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (89, 10, N'Digital Marketing Basics', 13.4500)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (90, 10, N'Build High Conversion Landing Page For Affiliate Marketing', 11.8800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (91, 10, N'Digital Marketing For Local Business', 16.1400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (92, 10, N'Instagram Marketing Masterclass', 17.3600)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (93, 10, N'Cryptocurrency Trading', 17.2000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (94, 10, N'Digital Marketing Ultimate', 18.4400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (95, 10, N'Advanced Video Marketing Made Easy', 18.6800)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (96, 10, N'Content Syndication', 10.9400)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (97, 10, N'Becoming A Social Success', 18.0300)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (98, 10, N'Smashing Affiliate Marketing with High Commission', 10.9700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (99, 10, N'Ultimate Guide to Blockchain Secrets', 13.6700)
GO
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (100, 10, N'Getting Free Traffic on Facebook', 10.9700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (101, 10, N'Gaining Profitable Blog Post Authority', 16.9700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (102, 10, N'The Personal Branding Blueprint', 14.4700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (103, 10, N'Facebook Ads Tracking', 11.4700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (104, 10, N'Facebook Ad Secrets – Advanced Level', 13.5000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (105, 10, N'Email Marketing with Amazon SES', 19.5000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (106, 10, N'Artificial Intelligence in Digital Marketing', 13.4000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (107, 10, N'Driving High Quality Visitors to your Website', 11.4000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (108, 10, N'Becoming a Successful Affiliate Marketer', 12.6000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (109, 10, N'Automated Viral List Building', 10.3000)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (110, 10, N'The Beginners Guide to Bitcoin Profits', 13.4700)
INSERT [dbo].[Courses] ([CourseID], [CategoryID], [CourseDescription], [Price]) VALUES (111, 10, N'FaceBook ads', 100.0000)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizScores] ON 

INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (1, 44, 34, 8, 5, 91)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (2, 27, 42, 2, 28, 65)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (3, 36, 41, 7, 8, 39)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (4, 13, 40, 4, 4, 32)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (5, 26, 63, 5, 14, 58)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (6, 4, 48, 5, 26, 94)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (7, 40, 66, 6, 1, 14)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (8, 36, 65, 10, 21, 57)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (9, 17, 34, 6, 5, 63)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (10, 38, 67, 3, 9, 16)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (11, 31, 2, 2, 5, 78)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (12, 42, 70, 1, 10, 4)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (13, 20, 14, 6, 8, 54)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (14, 1, 70, 4, 30, 93)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (15, 16, 45, 4, 1, 6)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (16, 46, 70, 3, 7, 77)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (17, 38, 52, 8, 8, 33)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (18, 29, 3, 4, 30, 26)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (19, 13, 29, 4, 18, 20)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (20, 44, 7, 1, 7, 87)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (21, 40, 32, 4, 2, 4)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (22, 34, 21, 5, 6, 16)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (23, 36, 51, 2, 9, 72)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (24, 5, 63, 10, 24, 12)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (25, 21, 4, 3, 21, 40)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (26, 32, 53, 7, 27, 55)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (27, 18, 22, 4, 8, 40)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (28, 20, 17, 4, 11, 86)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (29, 21, 43, 9, 5, 55)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (30, 29, 3, 5, 23, 70)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (31, 41, 16, 6, 6, 11)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (32, 15, 14, 8, 3, 39)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (33, 28, 57, 1, 9, 61)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (34, 43, 33, 3, 5, 35)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (35, 17, 66, 6, 17, 37)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (36, 9, 8, 10, 28, 34)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (37, 44, 23, 10, 5, 29)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (38, 23, 17, 4, 21, 72)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (39, 8, 38, 5, 8, 12)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (40, 11, 10, 3, 15, 99)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (41, 39, 59, 6, 28, 20)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (42, 41, 49, 4, 26, 38)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (43, 9, 33, 3, 19, 67)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (44, 30, 41, 8, 15, 55)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (45, 3, 31, 6, 6, 84)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (46, 8, 52, 1, 11, 63)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (47, 46, 22, 9, 25, 8)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (48, 27, 45, 8, 15, 19)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (49, 14, 53, 3, 23, 94)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (50, 8, 29, 1, 11, 63)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (51, 36, 17, 6, 30, 18)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (52, 30, 27, 10, 26, 43)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (53, 45, 12, 6, 4, 66)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (54, 24, 41, 3, 15, 67)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (55, 22, 41, 9, 11, 14)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (56, 12, 49, 5, 27, 9)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (57, 10, 53, 1, 2, 40)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (58, 12, 35, 9, 21, 30)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (59, 12, 21, 3, 26, 17)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (60, 24, 32, 5, 26, 73)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (61, 39, 48, 1, 23, 77)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (62, 10, 14, 6, 1, 1)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (63, 3, 68, 2, 26, 64)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (64, 17, 30, 5, 16, 100)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (65, 5, 38, 9, 4, 55)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (66, 15, 19, 7, 4, 79)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (67, 30, 50, 5, 24, 80)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (68, 47, 37, 6, 23, 42)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (69, 33, 18, 7, 27, 5)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (70, 7, 50, 10, 19, 77)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (71, 1, 62, 6, 1, 35)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (72, 19, 37, 7, 29, 11)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (73, 45, 8, 7, 7, 17)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (74, 37, 27, 8, 16, 66)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (75, 1, 29, 4, 29, 35)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (76, 20, 60, 9, 28, 71)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (77, 47, 51, 8, 22, 79)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (78, 8, 4, 2, 2, 94)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (79, 47, 65, 4, 7, 80)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (80, 43, 69, 6, 3, 3)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (81, 39, 67, 4, 30, 78)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (82, 47, 28, 5, 3, 96)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (83, 26, 47, 10, 18, 39)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (84, 15, 26, 5, 2, 85)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (85, 19, 47, 1, 23, 85)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (86, 37, 47, 1, 8, 58)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (87, 13, 1, 5, 30, 17)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (88, 8, 54, 3, 2, 24)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (89, 45, 48, 3, 20, 11)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (90, 9, 63, 8, 3, 15)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (91, 29, 33, 9, 24, 87)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (92, 3, 35, 9, 13, 59)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (93, 38, 46, 10, 13, 3)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (94, 8, 64, 10, 21, 36)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (95, 19, 4, 1, 13, 2)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (96, 1, 38, 6, 12, 11)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (97, 20, 1, 2, 19, 15)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (98, 33, 24, 10, 15, 56)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (99, 20, 5, 1, 29, 33)
GO
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (100, 30, 22, 2, 3, 17)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (101, 27, 57, 1, 8, 45)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (102, 44, 48, 10, 18, 84)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (103, 46, 62, 8, 23, 45)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (104, 36, 4, 10, 6, 69)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (105, 15, 18, 10, 1, 77)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (106, 2, 63, 9, 27, 73)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (107, 12, 62, 10, 25, 54)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (108, 10, 24, 6, 22, 56)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (109, 19, 14, 10, 4, 71)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (110, 37, 55, 3, 29, 74)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (111, 19, 61, 3, 12, 18)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (112, 32, 51, 2, 20, 79)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (113, 12, 59, 9, 27, 6)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (114, 30, 22, 3, 24, 84)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (115, 43, 10, 5, 30, 80)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (116, 3, 51, 10, 17, 96)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (117, 36, 11, 3, 10, 52)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (118, 17, 30, 6, 24, 41)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (119, 41, 41, 2, 1, 63)
INSERT [dbo].[QuizScores] ([QuizScoreID], [UserID], [CourseID], [CategoryID], [QuizID], [Score]) VALUES (120, 13, 7, 2, 4, 71)
SET IDENTITY_INSERT [dbo].[QuizScores] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (1, N'Trace Coolbear', N'tcoolbear0@booking.com', N'$2a$04$.S9Aawy6nmrdbJ5D/DjExecKxejPNY8pZIWpJlVRV8vdC/zR.7etK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (2, N'Angela Hobgen', N'ahobgen1@cbsnews.com', N'$2a$04$vNRfl1aIUKtlxX7g.hvXAOw03XFn8/LmmxxCYlElgGCcFHvl90GXm')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (3, N'Clerkclaude Lambrook', N'clambrook2@last.fm', N'$2a$04$weGvV.0fdMts7VN5Al9AdevnpOR7V8eqHPptRF9dZTJKO5dRt6qde')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (4, N'Shawna Hentzer', N'shentzer3@baidu.com', N'$2a$04$2WyAvMA71/lWLrdXHdTgNOT5lygMhiTTHyV6LBFidnl6K.IEPmVHy')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (5, N'Rowan Simenel', N'rsimenel4@studiopress.com', N'$2a$04$MDPtoLGhJXyiE4hQrr6WC.nLmKK8Vwg0DR28fVKXCCYcI29FwF/Ai')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (6, N'Amabelle Stennes', N'astennes5@skype.com', N'$2a$04$HpBslRO5eBlPl26tF8ZN4eXZGB0oJccQbX/RLD50TsUYvTR3uVa76')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (7, N'Bree Cuppleditch', N'bcuppleditch6@yolasite.com', N'$2a$04$EHuBq3h1bcRChTVlYJ5fbOMe/./0Er0hEEpEagTWmh.0nPcJIlxUi')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (8, N'Rogerio Rickasse', N'rrickasse7@opensource.org', N'$2a$04$7mL5OdBhfMw91NZ08VUWMekS66PRssvRAYKIl4a8e7dFq3iq8G9Ca')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (9, N'Hurley McKelvie', N'hmckelvie8@telegraph.co.uk', N'$2a$04$Zx.5eil79KtWXYmHTxH1quBp6nOV0g6.HLtYsIPISa5coyUk5/y6y')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (10, N'Bernete Rothchild', N'brothchild9@google.com.au', N'$2a$04$toC2xzPISjsBSURgMA38EeiTA3hfefS8W1lE6J.GxzEk3Yu9fZLAC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (11, N'Genna Glanfield', N'gglanfielda@wunderground.com', N'$2a$04$TB0CtsEemwzoghvN4OfNHeXYHRZNC3rCM7UJvEfWgnAPelaNbCaqm')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (12, N'Patty McKeurtan', N'pmckeurtanb@biglobe.ne.jp', N'$2a$04$nhfKEZjw/DQn6CmNNsBREOB59HjLEXtjG5fDYXRdmRcEPcvmzA/Ra')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (13, N'Jeramey Stittle', N'jstittlec@nih.gov', N'$2a$04$WR.tpUsgVhtRU9hx/KwtG.G.LppTy5cCZK9E7KmxhSGDoni4xVT2y')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (14, N'Nelson Walford', N'nwalfordd@qq.com', N'$2a$04$u8dZLbsPd5S7J7toT90YNuAq.5F./EBQ.gDqskSqq/VxPzwN55Uti')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (15, N'Lisbeth Drewes', N'ldrewese@fc2.com', N'$2a$04$z.2kgNMQBXWtqrbGSc5WJuNf0xVWnfHIQNtc0k0DmC/OWjSCAQa4m')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (16, N'Ursuline Blofeld', N'ublofeldf@bloglovin.com', N'$2a$04$eEePrzuQEU5gY4ZvrypldOaNT5lqOyl5dApewV4K8lWUXWM9yaIvO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (17, N'Madelaine Soff', N'msoffg@nih.gov', N'$2a$04$AKit9SZix2xwF3A4nfGk2eTukqjgcZY9d.g0C..gDjm.tPVEGFoW2')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (18, N'Shirlee Pavitt', N'spavitth@1688.com', N'$2a$04$Pgdoc2ONF89FRTnGU0Mq3.yPZdJDf5Cra.a3v/OzAH6gXeK/cLSE6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (19, N'Vally Mithun', N'vmithuni@opera.com', N'$2a$04$IH4g7J9.AEy5s2vlv8T05eoScLgUQ6zIKYqrG/.4aGXqm5Q85pj0O')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (20, N'Lorie Schruurs', N'lschruursj@senate.gov', N'$2a$04$mOQLXJLA1ikrFsIXn5Eq8uLYuIeX8S9oBRKFW8Y.D40jtACl4473O')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (21, N'Clemmie Velez', N'cvelezk@nsw.gov.au', N'$2a$04$fXOcNBrmVtQi2NLitfi0v.dAF005q1Xgpf3Vpga9uf6ff7uDPWpEq')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (22, N'Zahara Haffner', N'zhaffnerl@liveinternet.ru', N'$2a$04$sCCU.17wknk1xYSXyh1HUe/G8VvnOMcmcm.RnVh8RvJOoXw8R0TQO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (23, N'Lanae Bainbridge', N'lbainbridgem@nifty.com', N'$2a$04$eZOjfO0J1kI8o.699OPlDOUB5G6Al.4iBP.PKESo2tfz2xFOg20qq')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (24, N'Elwyn Linzee', N'elinzeen@t.co', N'$2a$04$Rh1ZGjw/Q.74XQNmn4lMWuDIf2Qo5HKfxysM/stknm3511j8oN8ky')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (25, N'Deb Bilyard', N'dbilyardo@cornell.edu', N'$2a$04$RaDp33r5LSocXuoL2pjjUuMGChiuV.Iyi9fCftVWjVTfe/SxVyvWm')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (26, N'Adda Pogue', N'apoguep@youtu.be', N'$2a$04$Pj4CIQdAiyEBfU0K8sPCeeZqE/6tXdQX7N4SqZHwEemyEVq0QPVlm')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (27, N'Christin Cattrell', N'ccattrellq@wordpress.org', N'$2a$04$m./We5zzJfyvj/HOauxLku2b/PVQOQTwS1gNcv2Vxfq/RdFE7eGFC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (28, N'Nissie Sally', N'nsallyr@craigslist.org', N'$2a$04$tdnwaKc1jTlOE61mQZOJYuEo2INsHeOHA.SfxXBXtfdSFBqJZC0ye')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (29, N'Cosme Dady', N'cdadys@nsw.gov.au', N'$2a$04$THgQ.TdNqSh79AWVFZle9eH/5ojhZvJmV97H7HN5kJh.NVqQF95YW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (30, N'Ginger McGavigan', N'gmcgavigant@live.com', N'$2a$04$3rKl8nkdJJRRdbnQU1/hm.Gmz5pFJvsZfaqr5ztZGDQTxVPTNFMZC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (31, N'Keefer Pretorius', N'kpretoriusu@goo.gl', N'$2a$04$2Z7ih385GfFeqPjNXMIATO4FwnkdUsupENlEBOBx1I4VhQ.gHVK22')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (32, N'Christean Lammiman', N'clammimanv@nps.gov', N'$2a$04$TOCMofyGGdF8N3D4N7460eyW4HUc8291m9CiKgUhc9DNCsOTbdl0m')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (33, N'Becca Wilcocke', N'bwilcockew@shinystat.com', N'$2a$04$vXwzGQtS6/Kvqym2Fi0yReIyNcIaKQAOwSqXQ6MT0HzCnQZzvRY/O')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (34, N'Carlo Mathan', N'cmathanx@marriott.com', N'$2a$04$N207u55EpTqN32T.0eki2.5x4P678O0WGzrZjocj/LGcnvx94O4oe')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (35, N'Ferrel Gritten', N'fgritteny@independent.co.uk', N'$2a$04$jteVjkyTKp7i733r3ys/kOQpMOFebuBLjCqJK0lM/FeLw5BkQ9WXC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (36, N'Elyssa Bernollet', N'ebernolletz@economist.com', N'$2a$04$v732s/XFX0elCKaEn25LeOwS43mX6YnAvjHk86Nz9dq9nekE3hdk6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (37, N'Katina Couldwell', N'kcouldwell10@com.com', N'$2a$04$HopefLw/xKrSu1LpWEWWn.XeSLfDYMpLkQuUUGKCskuUhVm0gAgpW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (38, N'Dominique Pinor', N'dpinor11@webeden.co.uk', N'$2a$04$bMFUqaxq.zsUhRRMp6TNouWjedQu1C2Ombr35R.AV.y2IPydudHz.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (39, N'Tait Matuszynski', N'tmatuszynski12@nih.gov', N'$2a$04$5tRaPonrqBDu5smAe.ix/eNOJr6xy5QvC5zzhZ4.oWnMIGqzWQFLi')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (40, N'Zachary Mattei', N'zmattei13@imageshack.us', N'$2a$04$S/dIe/MlHsRfVuGh1FSuleXqn/mLXRT9Qcel3oA9d9ybuNRbwEzsy')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (41, N'Ajay Sneaker', N'asneaker14@ftc.gov', N'$2a$04$FKdGl.j6/WDKtdxyfILsx.NcKmtz.wjdi5TOVpz4oRgxEiWAmREpO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (42, N'Shantee Grogan', N'sgrogan15@bbc.co.uk', N'$2a$04$u7XB.O4kmAu3vaAvAUpCGuRHPSGsOex86XeDtMYf8FjddxbXojt42')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (43, N'Cash Izkoveski', N'cizkoveski16@microsoft.com', N'$2a$04$F/Fmf/hXDpva3prrQ..I7uSGdQQtXRWSl.JY6ZFbNLu1ddqQTGQs.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (44, N'Quinta Dymond', N'qdymond17@addthis.com', N'$2a$04$cDr77qsbpb15V5eEZbHsfeJVuXFhqTJYAwLz9hyycOFQSXYONwziS')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (45, N'Albertine Tinman', N'atinman18@marriott.com', N'$2a$04$3JedXJkH4NE0SN1QlJOeReSy/6creEGtDwh9lpfXUHctR6Wds/CDy')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (46, N'Arel Surby', N'asurby19@disqus.com', N'$2a$04$9tX.pOKfJeHTGMlG8vWDLusjAB2odGp05EURPBysQa1M6xJn8fGAa')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (47, N'Marj Instock', N'minstock1a@jigsy.com', N'$2a$04$w160Sbr8UMrYO1e/L6VIiuiUJMporEEja.RwtgIU6wNQ9IBmXfl5e')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (48, N'Nissie Maskrey', N'nmaskrey1b@people.com.cn', N'$2a$04$3HcsFRxFniRaa9uTLxybiu9QZsYofhz8loKF//.67u2liV/P668um')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (49, N'Davie Marvelley', N'dmarvelley1c@foxnews.com', N'$2a$04$gkgJQF9vsnzFMelK0aBO6uPAGjKWnN2VQPy8Auj9GDxUWfMqUZBt6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (50, N'Chrysa De Malchar', N'cde1d@soup.io', N'$2a$04$m0mWjQgkQuiQ0E0XVN9RKeiXqj5R62BrkNBpvjnLS4TEGNEgju0hO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (51, N'Nils Smitherham', N'nsmitherham1e@mozilla.org', N'$2a$04$pFVhgt.rsByMuuMOdf/pZOW/D8pUOTbF2aSCWbVAknpXR4j1.V78.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (52, N'Ignatius Ilyasov', N'iilyasov1f@xinhuanet.com', N'$2a$04$Itnd1SHM34QUAFkR72Mi8eO0kaIQaCLLD.QWY7XY5uuAQLmg6k0cW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (53, N'Nell Lacasa', N'nlacasa1g@shop-pro.jp', N'$2a$04$nptCF0gUOCpeqLyFK8kjH.qP37E4/5GDycUOrReWwjIy4qrtUKwsu')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (54, N'Nissy Tolputt', N'ntolputt1h@cnet.com', N'$2a$04$TEwWVloBGPvL7g2CPcjUvew12mQFBXHOEkx58BPnfgue9tayL4mKa')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (55, N'Betta Ducarne', N'bducarne1i@biblegateway.com', N'$2a$04$Lxv50LPMRRTr0IANz73IVOGQDow3rTtlb1gFbw455Jt0AiN0EwM5m')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (56, N'Rosalinde McCann', N'rmccann1j@craigslist.org', N'$2a$04$qIrUtgv3ksi5gWzfbY3Dze1SPdgZYAuJhkUbXYu5Gti4qcuZ/p87G')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (57, N'Morie Tiesman', N'mtiesman1k@over-blog.com', N'$2a$04$ejywvtCI.8lVZGcOvm5Uy.70vsXh2F/WljcOxQ3jIvUI4wATK6WvO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (58, N'Bryant Courtney', N'bcourtney1l@chronoengine.com', N'$2a$04$lRagHwYDSXTn4jMp30R55e/mXrAVbdaU7spLMTdJoaPNKIB5FDpaS')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (59, N'Grady aManger', N'gamanger1m@youtu.be', N'$2a$04$JclQtDweDQAAG2fwiwwBkuMNvKr9D2yCQEhSxsm/VwXix/BZLOavi')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (60, N'Corney Lemerle', N'clemerle1n@google.de', N'$2a$04$UtsVfgbYr9XlSDBDgKtE5u9cZsJLnvcQzrVw.vuYvPwAT4pLXfw8u')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (61, N'Edee Roussel', N'eroussel1o@elpais.com', N'$2a$04$uFy6btDTbAuziwB90xw3w.zZC0kGQJNxN/P8.yo3zm5F8wGRmEJki')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (62, N'Trevor Hopkyns', N'thopkyns1p@technorati.com', N'$2a$04$L9WfGIrNplj2P/Rts.xrRepmaFGfAOtrxjxAzH8ns9FqRGRXkDaJW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (63, N'Denys Pfeifer', N'dpfeifer1q@issuu.com', N'$2a$04$5Mc7DP.AFQo1crIuDa81oOy7dTeLof1YT3cXzkcdqcgNHM/TSnjCq')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (64, N'Belvia Minnis', N'bminnis1r@unc.edu', N'$2a$04$SkuA2lWveESukGcAOgXFIeJ4RY6JBXWouhwW2qda60bVwMy9YPTZu')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (65, N'Stavros Garland', N'sgarland1s@phoca.cz', N'$2a$04$T/hRh022B8GAAWxZOeuVz.ZkCi57XyO1PbCTr3J4Ycy5fd1Os3WZ.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (66, N'Netta Popley', N'npopley1t@4shared.com', N'$2a$04$Sxr/faXVjC2Ce10i/UNt/uA5wZVLzf56cDxC8mntUin8Ecs1iDOSq')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (67, N'Rodge Pember', N'rpember1u@foxnews.com', N'$2a$04$wY50AVa30Enkh039MyAE/.YSU/Yo4BkONXhXhCo3JN1vlpNL17ema')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (68, N'Andra Giller', N'agiller1v@reddit.com', N'$2a$04$ChzVY6c2wrf1kYK2cSfrfOCDZMQyzRroT2beXBpFK2tBuOXIDzTEK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (69, N'Willard Mion', N'wmion1w@rambler.ru', N'$2a$04$Tw3xzmOBSHhuZ0eoWd6YfeeeIe2FC1bCK/0qvOWx9bfsnACeVmWNG')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (70, N'Killie Yackiminie', N'kyackiminie1x@smugmug.com', N'$2a$04$e.CvymdcCrKgSkSQPdcmJ.Rd70LqfS7UwIYHAYui7vITPrn5zmXl6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (71, N'Aprilette Bercher', N'abercher1y@baidu.com', N'$2a$04$W9SkYICSz1r6/jNzvbzYseC3w/LoZ2ZuyUEYmOG.JdRClkLYMN6S6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (72, N'Avie Eadmead', N'aeadmead1z@hostgator.com', N'$2a$04$wN1w7/tAwUxARIjdkehKC.ORW499BLIUjO4Y4ChwQcX3dG59KwpE.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (73, N'Evanne Eldered', N'eeldered20@deviantart.com', N'$2a$04$09MIwXBoj8/KZ8DgmzR9ZeY8zgQHXmD/OeMCTSqNmCR0Kad3ncn2a')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (74, N'Nariko Kort', N'nkort21@livejournal.com', N'$2a$04$ssLmRfH0K0JantGqyvb15u/CASHd3JTV2qpM3oBhOLGXNInDr7gzu')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (75, N'Dominick Bonde', N'dbonde22@paginegialle.it', N'$2a$04$ytoH36FaTRfp.dGKah/LXeT4s8TYIeiUIZL8ztl7Usebh8C0dK3Hu')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (76, N'Galen Pharaoh', N'gpharaoh23@google.it', N'$2a$04$WceIfvuxI1BcNcJAq7WcXObgSuxubb8KJ0msqeZwWfoERaP1YlAQy')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (77, N'Farlie Nand', N'fnand24@ovh.net', N'$2a$04$vDlUZZmdhHDjjwhMwthJw.7/PIPs2hofFUYgt/IFsAsGrZP/4I.22')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (78, N'Zaccaria McNirlan', N'zmcnirlan25@topsy.com', N'$2a$04$uqmCSjRSf5cFzhX.K72/LupfxuHKZ5D/TlUE91C7H7cLbKhaQ2tF2')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (79, N'Fair Braban', N'fbraban26@github.com', N'$2a$04$TPWeewRwfsSPCM7TPiC16OB9f3JKwSqF9XYyxKLn.uaRhy8rwXGAS')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (80, N'Christina Cropper', N'ccropper27@bbb.org', N'$2a$04$fl6MVoSfC2pAhZtyaeiafekAgR1kYo9QhPno35R15pz4HuqAVDqCG')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (81, N'Alidia Twinbourne', N'atwinbourne28@addthis.com', N'$2a$04$ADmq3OljZ.PJjiwsm0F41e8RHkd77e9NymjNaiI2S2JQ/cUT.sl9.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (82, N'Kimball Yackiminie', N'kyackiminie29@hubpages.com', N'$2a$04$a1a3lPmTY3cbJgDhLZh4BuS9ZoGH6MO3aXyxfJaNMYtej6WBDLKri')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (83, N'Anastasie Felmingham', N'afelmingham2a@discuz.net', N'$2a$04$fWvsVuFTkcu3HVffUt.sQ.TqHJ4kJFhsh7V8etPl.LiIQYgGFzlhG')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (84, N'Malanie Rablin', N'mrablin2b@indiegogo.com', N'$2a$04$PGhqHH2DXI/U/283sAp0.uvXY0Ix0n7oEoy.y0IuYNQr48AVbuIVe')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (85, N'Chris Riddle', N'criddle2c@barnesandnoble.com', N'$2a$04$apqozfPSxRf2ekVVAOVSSewoKmNR.3qnGgdZ/M0G1YAe69uSA8ZzW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (86, N'Norbert Seath', N'nseath2d@webs.com', N'$2a$04$sPr8GO8DzR5/qETwkr3WAeo5n9jSZjVOcsMM2HFh2He/Is5pX.ofi')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (87, N'Eunice Sarten', N'esarten2e@usa.gov', N'$2a$04$Mj0DCzjZct/Pcbk3MRcV3u0hl5xG0Lq50.kNLjLO6apfqiV.fi.x6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (88, N'Lennie Cramer', N'lcramer2f@hugedomains.com', N'$2a$04$Hf1VSExZk6YuttDpV68bJeLzF5qdU97CHCF8PXX7AaI8GtDzkXSTm')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (89, N'Jecho Yuryshev', N'jyuryshev2g@omniture.com', N'$2a$04$K6Rp74WbsmkzgA3Xw2MFB.snOVatitNZVFOkszFdo8gb6PnHBd7xi')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (90, N'Lorilee Cunniff', N'lcunniff2h@soundcloud.com', N'$2a$04$T9MrJ1UM4YAz1eg8kXho..aJAz2V5oDQpsxR16Qdmd0Obz9M6MRjC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (91, N'Mick Weedenburg', N'mweedenburg2i@plala.or.jp', N'$2a$04$5pHxbs9gDQINKBgbApquk.t4uFCA9uRtyDR2L/n7zodNuJ8en1PxC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (92, N'Svend MacAughtrie', N'smacaughtrie2j@yellowbook.com', N'$2a$04$6cvAYqsNvbkmv8.jSgMlgeiFwT/Lcjc3ZuN6B4sPhXcdPEB/N1uum')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (93, N'Antonino Peck', N'apeck2k@cbslocal.com', N'$2a$04$CyHh.qKZL2MKtg1jgSSO5OpnjpgEfdhFDMMlsO92JXelAfO6zskpq')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (94, N'Richmound Malan', N'rmalan2l@businessweek.com', N'$2a$04$vJ8JZl183zRhNzHRdgYTn.aMnppjrYWv6MQRCqgpAHDBTjp8rTHte')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (95, N'Allis Schrei', N'aschrei2m@state.gov', N'$2a$04$dI1RgRnbTPVQFrC6tfjSfuEkrnpGKLGe.PUfCKvA5nQc3NNpCeCdy')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (96, N'Kath Gauvain', N'kgauvain2n@lulu.com', N'$2a$04$jfJrbIWZwVtReZrIk/daV.MeFLrfwI1PyJ7Ybdpej7gCfMkKJ46X6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (97, N'Willi Aronovich', N'waronovich2o@smugmug.com', N'$2a$04$ChzYwb.OBLSmf/0hncf6VODab8vwhlPMeKvlbPXr4H9b5a60c3mtO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (98, N'Gilli Hurburt', N'ghurburt2p@mediafire.com', N'$2a$04$nrdzoAlr35HID3r9Y6YXUOoQTTvc9bRyB7wL27LQCYH1axr5NGHzW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (99, N'Leodora Scawen', N'lscawen2q@telegraph.co.uk', N'$2a$04$AkIy3JnawlrkabxkTfs05e193aFX2pywPcV4lop/1laOZjH4rOXNS')
GO
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (100, N'Loren Bingley', N'lbingley2r@cnbc.com', N'$2a$04$/hTxU1jSSy2GvWqh6rCt2e1VSL2Ab4dg.9aAYdJWbLumfImg8Iq.q')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (101, N'Jodie Glusby', N'jglusby2s@about.me', N'$2a$04$szd7Jf61wYpVKzcISgorBu3LM.RJjN1sYkbPvJ.MN45hbQOJ5Hzie')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (102, N'Brade Raddish', N'braddish2t@webeden.co.uk', N'$2a$04$TaZS8Gwha4IysILMxxNZguNVDhvt5w279Uooyms4ldKgaazTP/rQW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (103, N'Brittany Ferbrache', N'bferbrache2u@mayoclinic.com', N'$2a$04$/zRCl3X/jm/GrwEhnl5JjudsjoNJwsdnpMRbvBS9Z9iaSKyjA4Sji')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (104, N'Ramsey Bending', N'rbending2v@altervista.org', N'$2a$04$y2EIF6ZnKuoNMmYbBbbAB.i1/LmxglnW9LQPNQyGgUBzccINwxDOe')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (105, N'Helenka Postlewhite', N'hpostlewhite2w@360.cn', N'$2a$04$dr/qtG2tVlWwfNEpgiLwO.e0kPhNQl.L4OA1Sen7mgiiWT6s.y7Pe')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (106, N'Lyndsey Cornewell', N'lcornewell2x@cmu.edu', N'$2a$04$z1//Cm9YOVySJvm9J5R34eYMDg3djB1Ut3aAEnOOTidYkN9Itl42i')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (107, N'Bev Le Quesne', N'ble2y@abc.net.au', N'$2a$04$cDXsKoYOPWZtK8SW3Mzr.uUKbq85fhjCVmslIyQdh9zxE0NqtGt5e')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (108, N'Stafani Di Carlo', N'sdi2z@discuz.net', N'$2a$04$VfI0AnWOqVVa/goYkXEi4eoTej79UbkKRw4GjgimQv17yq/EhWjMK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (109, N'Kial Parsand', N'kparsand30@list-manage.com', N'$2a$04$DPQNHhZv2T9RGayJxQ/VuO7TBjBk4ftApnT.Vuy86gi.wOBB7LZ3S')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (110, N'Mort Westcot', N'mwestcot31@bbc.co.uk', N'$2a$04$rcPCDIooEroqAAWFHsLvGOtjd5DNnlsZtFUbTuJfsiZKgMbrkYKSG')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (111, N'Blake Keerl', N'bkeerl32@mysql.com', N'$2a$04$Ob8OfPLvYn5HAJXw213KM.M5uJcC5CJg1h5gcFQ.P6Y7Yw2g24Jx6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (112, N'Nanon Benyon', N'nbenyon33@loc.gov', N'$2a$04$aE3f3E.WbH2bIiKevS2mqOKhnX2hZ1EeQyWlsFNyEzleMI.eVJafa')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (113, N'Dewain Emmins', N'demmins34@deviantart.com', N'$2a$04$.wtFCn1PkJtWg/v.NG.i1O3fNupBVVCwi.mvIcfy65tamSe6exkUO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (114, N'Christel Mattis', N'cmattis35@senate.gov', N'$2a$04$lghDAyKuQIXNgt6YbADmL.hws1OZaPA4R9o9mHM62/5xpFtM0rqIq')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (115, N'Alfons Weed', N'aweed36@altervista.org', N'$2a$04$gHjF7INxrdwytwCvw1yLOOb2V.L.PZQoL4ZngBi38gQiQFE/M8hkW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (116, N'Jonah Blackster', N'jblackster37@t.co', N'$2a$04$AdDc120.vPsbP8oM6zGgWueo6LkaR6V8/1PVu2oREuX2CV2/5zlkO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (117, N'Marline Spyer', N'mspyer38@europa.eu', N'$2a$04$o5L87tu4cDK7Tud7oQnQfuLa1H1ro6RnsWM9H6V2saKp48V2jZVlK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (118, N'Richard Petrie', N'rpetrie39@1688.com', N'$2a$04$aec4W4sRMIgux0Y/8pl9Iuf0mAul03xv6As5nMBsK47FXMM73c9d.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (119, N'Mariette Kinner', N'mkinner3a@is.gd', N'$2a$04$IRwg5eWFP1aL0hOqiJm2A.oWmjyoI0Kwd/Cun.McI8Ov279OXtDQe')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (120, N'Jodie Timbrell', N'jtimbrell3b@imdb.com', N'$2a$04$ezxwEFuYUpWpeAukRiZMQOXu6ag2oLKpwr8SRYHa4bOXRqfPactPK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (121, N'Lon Paramore', N'lparamore3c@ftc.gov', N'$2a$04$Lgw8sQ6MSO0ejcdiz7Ti8.1yAKPNRTYZl9iVaLN6dM5f6r5bj3ZzC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (122, N'Delphine Sperwell', N'dsperwell3d@si.edu', N'$2a$04$0Ad1oftdBN.tsHGIO3j1Ouwu71b.hwFabyPVbZPSphcKbuF1IuAyO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (123, N'Adams Barbier', N'abarbier3e@gov.uk', N'$2a$04$SGtHBceW1R0k.3R9XbO.vuPKUojLjB4A9fZtViacvX1eb/pmuIjNO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (124, N'Aeriell Suttle', N'asuttle3f@bloglines.com', N'$2a$04$BEXhh59FrFs4ea9Emqegku7L3kXesUbz5BfFxO.9iZk0tE/ub9xPK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (125, N'Janie Noli', N'jnoli3g@amazon.co.jp', N'$2a$04$sWJd39IddydX1czof5u4keZm9.8QuP.lIM56qHxZpnCbh//Keyf6.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (126, N'Janice Drance', N'jdrance3h@nps.gov', N'$2a$04$uquO./F7DP.9Sc/XoJ4aUehSmWMwK2GYT/bB9fph/dtLygsrGKEVK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (127, N'Yasmeen Kemmett', N'ykemmett3i@wired.com', N'$2a$04$xiXd986zA1XgvBFOu1gb2.nTghOBCFxyxJmL6ad9dv2bMOkvlPbN6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (128, N'Modesty Kitchinham', N'mkitchinham3j@mac.com', N'$2a$04$K1OxvpMYQyGC.7X1Kxywou6R6TOU1gheKmR8VThq8WZ5t3AqyMRIW')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (129, N'Kellyann Barrus', N'kbarrus3k@webnode.com', N'$2a$04$MOlXWg.dSqfLT0F8snTJKuADyEw/6RWuxS/dTZ92SUDZWi7ga.1Tm')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (130, N'Terry Beringer', N'tberinger3l@usgs.gov', N'$2a$04$rZWZTzLrNEz01U0kJhiwm.C7MTWNU4VNGZtklAcbZ9tSWIiWmr8za')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (131, N'Bale L'' Estrange', N'bl3m@time.com', N'$2a$04$0e/EBLgu258f.XM7rE7wq.sqMAp6yfofpRrZOrYnhIEu.mzg1Oura')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (132, N'Ellswerth Raspison', N'eraspison3n@dell.com', N'$2a$04$o8XLQxtG/XG8Io05Y4G2KevO/AtqGK6.BcRU4PjKmNIsa8refOTMK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (133, N'Barrie Barthot', N'bbarthot3o@skyrock.com', N'$2a$04$jK5A3MGeUzZTPjnIK6LfOeQf6UdLiQdzZYFVgwrB44uoRi0mr2kKu')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (134, N'Gwenni Farnall', N'gfarnall3p@topsy.com', N'$2a$04$WjkKoZVte/A2yXV/pJx2cOvrtRxtaOvngLPpulYcFxGxZviAjUvay')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (135, N'Fee MacDonell', N'fmacdonell3q@cbslocal.com', N'$2a$04$Z.ijRdbgvsjiaKHSstrVduRfhMTWV43j4qAuFbI81n93uSohT5e96')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (136, N'Crissy Macknish', N'cmacknish3r@webmd.com', N'$2a$04$Q.rY1kE0H6UOaa.Dz2UqoOGgdtfrr9CwsTXrBajCS69EMNVGnUAM6')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (137, N'Harrietta Goudman', N'hgoudman3s@newyorker.com', N'$2a$04$UQTZihRurflGxawhD3PTEuncB46YzWXCek3bmWDpdk07EKnpG4BPK')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (138, N'Evelyn Seger', N'eseger3t@paginegialle.it', N'$2a$04$WTcrUMU9McMiQO.LcITJ1eaeawe6l9BhYmJ47de.d/KkUpFLgtjjO')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (139, N'Bobinette Klasen', N'bklasen3u@seattletimes.com', N'$2a$04$E0ab3PNVcB5V2aPppqKJaOw0f3g4PKO8nrvFILD1JrY9OQ/8Cuctu')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (140, N'Clair Povah', N'cpovah3v@soundcloud.com', N'$2a$04$MYijgyF.iHvQ6c4pdBW3JupX/6CN2t5U72GcPvyBN20oSfQpDBJw.')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (141, N'Cordula Norssister', N'cnorssister3w@ovh.net', N'$2a$04$heXTZQugoZ9vi6qWZJQXvuvYracJyRas/FVyuletwDdpsGAk2xAie')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (142, N'Nolana Steinhammer', N'nsteinhammer3x@nih.gov', N'$2a$04$PWtwcNKd39pxGBb92HHpaOLYnA2XT7WP3WgBfHsf416PcLhtoX0Si')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (143, N'Elsbeth Delgaty', N'edelgaty3y@ed.gov', N'$2a$04$AQJ05aqWRCPAmI9TpblVqeqanalYZN72aVK1cOuaMEY1Wih/3Tq5u')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (144, N'Evangelina Burdfield', N'eburdfield3z@fastcompany.com', N'$2a$04$otaP9ALg.9BSRNChpI8nM.RoCQcYDTRwoyKo6zEGoBKAR2iNJUFi2')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (145, N'Clemence Gibbins', N'cgibbins40@amazon.co.jp', N'$2a$04$1GnkQlxN2WXGUB5wuFkVPO4U9Vyu7X.kG0nVHKavVB20rVpoMsyve')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (146, N'Bradford Phillipp', N'bphillipp41@google.co.uk', N'$2a$04$MOJ5IGgNDUlzmetrsoEequNJkal8Dzw3RrooUUBx5PTNdbpsRWuwe')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (147, N'Milzie Hyslop', N'mhyslop42@list-manage.com', N'$2a$04$oBxNyBcwbqF2TB/ThfrljO8zkNQ8RtWm.24dxwenZAgcl7T3lOAaC')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (148, N'Cortie Trayes', N'ctrayes43@engadget.com', N'$2a$04$q2odHOu1XjVi3NAD8oAWUuMGMKl3sgQT4G2.nM4OE4gmTVCcm2166')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (149, N'Wyndham Worswick', N'wworswick44@state.gov', N'$2a$04$LYAzoHxEpN2P1M2Rfp1y5u2l3NMS2jfHvuVr.QKrg0nL8rNMif5gG')
INSERT [dbo].[Users] ([UserID], [FullName], [Email], [Password]) VALUES (150, N'Collen Cripwell', N'ccripwell45@about.com', N'$2a$04$RQuLl/lPLmB5JhbZbF8YMuaSzl8CPcxTwzCmJYUaIJYJZs6Hk/q6m')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Enrollment] ADD  CONSTRAINT [DF__Enrollmen__Enrol__2A4B4B5E]  DEFAULT (getdate()) FOR [EnrollemntDate]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF__Payment__Payment__31EC6D26]  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Quiz] ADD  CONSTRAINT [DF__Quiz__QuizDate__2D27B809]  DEFAULT (getdate()) FOR [QuizDate]
GO
USE [master]
GO
ALTER DATABASE [ICMA_LEARN] SET  READ_WRITE 
GO
