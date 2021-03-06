/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
ALTER TABLE [dbo].[Students] DROP CONSTRAINT IF EXISTS [FK_Students_StudentStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
ALTER TABLE [dbo].[ScheduledClasses] DROP CONSTRAINT IF EXISTS [FK_ScheduledClasses_Courses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_Students]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT IF EXISTS [FK_Enrollments_ScheduledClasses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[UserDetail]
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[StudentStatuses]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[Students]
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClassStatuses]
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[ScheduledClasses]
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[Enrollments]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[Course]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/17/2021 3:17:16 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Course]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[CourseDescription] [nvarchar](max) NULL,
	[CreditHours] [tinyint] NOT NULL,
	[Curriculum] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enrollments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enrollments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ScheduledClassId] [int] NOT NULL,
	[EnrollmentDate] [date] NOT NULL,
 CONSTRAINT [PK_Enrollments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[InstructorName] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[SCSID] [int] NOT NULL,
 CONSTRAINT [PK_ScheduledClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ScheduledClassStatuses]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ScheduledClassStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ScheduledClassStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SCSName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ScheduledClassStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Students]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Major] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [char](2) NULL,
	[ZipCode] [nchar](10) NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhotoUrl] [nvarchar](100) NULL,
	[SSID] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StudentStatuses]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StudentStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SSName] [nvarchar](50) NOT NULL,
	[SSDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_StudentStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 12/17/2021 3:17:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetail](
	[UserID] [nvarchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FavoriteColor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202112151540570_InitialCreate', N'SAT_Pair_Project.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D0FB0FF20E86913382D5F328359A33B81D3B6778D8C2F98B607FB66B025765B1989D248946323C897E5219FB4BFB04589BAF1A24BB7FAE22040302D92A78AC543B2582CFA7F7FFE35FEE9C5F78C671CC56E4026E6D1E8D03430B103C725CB8999D0C5F71FCC9F7EFCC737E30BC77F313EE7F54E583D6849E289F94469786A59B1FD847D148F7CD78E823858D0911DF8167202EBF8F0F05FD6D1918501C2042CC3187F4A08757D9CFE809FD380D838A409F2AE03077B31FF0E25B314D5B8413E8E4364E389393BBB7FBC436EF4781705BF629B8E1EAE46D79FA7A3ACA5699C792E02AD66D85B98062224A08882CEA70F319ED12820CB59081F9077FF1A62A8B7405E8C795F4ECBEA5DBB7578CCBA65950D73283B8969E0F7043C3AE176B2C4E62B59DB2CEC0896BC008BD357D6EBD49A13F3CAC1E9A74F81070610059E4EBD88559E98D78588B338BCC17494371C65909711C0FD16445F4655C403A373BB838257C7A343F6DF81314D3C9A447842704223E41D1877C9DC73ED5FF0EB7DF00593C9C9D17C71F2E1DD7BE49CBCFF019FBCABF614FA0AF56A1FE013B025C411E8861745FF4DC3AAB7B3C48645B34A9BCC2AC0259822A6718D5E3E62B2A44F30798E3F98C6A5FB829DFC0B27D70371614641231A25F0F326F13C34F770516E35CA64FF6F907AFCEEFD20526FD0B3BB4C875E900F13278279F5097B6969FCE486D9F4AA8DF723AF7619053EFB5DE75756FA380B92C8669D09B455EE51B4C4B4AEDDD82AC9DB89D20C6A785AE7A8FB4F6DA6A94C6F6555D6A15566422E62DBB321D777B3723B33EE2C0C61F0526A318B3411AE79E31A0948078658BFE4D251572E11E8E3DF7969BCF091EB0DB0367690022ECAC28D7C5CF4F2E7009888486F9DEF501CC3D2E0FC07C54F0DAAC33F07507D86ED2402C6CE28F2C38D4BBB7B0A08BE49FC399B08DB9335D8D0DCFF165C229B06D10561ADD6C6FB18D85F82845E10E71C51FC40ED1C90FDBC77FDEE0083A87366DB388E2F81CCD89906E081E78057849E1CF78663ABD4AE7D93A9875C5FED9C08EBE9635EB57450D435242745534DE5A834A9FA3158BAA49BAA7955BDAA598D565579B5BEAA32B06E9AF29A7A45D30AAD7A66B50673FDD2111ADEF74B61F7DFF95B6FF3D6AD051533CE6085C4FFC60447B08C397788521C917204BAAC1BBB7016D2E1634237BE37A5923E232F195AD44AB3215D04869F0D29ECFECF86544DF8FCEC3ACC2BE97022CA2B037CA7FAEAC356FB9C1334DBF674A87573DBC2B7B306E8A6CB591C07B69BCE02452C8C4732EAFA830F67B48735B2DE88A111E81810DD655B1E7C81BE9922A96EC939F630C5C6999DC50AA728B691239B113AE4F4502CDF51158A952192BA72DF493281E938628D103B04C530535D42E569E112DB0D91D76A25A165C72D8CF5BD9021969CE3101326B0D5125D84AB23224C81428E30286D161A5B15C6351351E3B5EAC6BCCD852DC75D0A546C85932DBEB38697DC7FDB08319B2DB60572369BA48B02DAE8DE2E08CACF2A5D09201E5CF68DA0C289494350EE526D85A0758BED80A07593BC39826647D4AEE32F9C57F78D9EF583F2F6B7F54673ED809B357BEC193533DF13DA50688123999EE77356885FA8E270067AF2F359CC5D5D91220C7C86693D6453FABB4A3FD46A061149D4045812AD0594DF0B4A40D284EAA15C1ECB6BD48E7B113D60F3B85B232C5FFB05D80A0764ECEAFD68A5A2FE16552467A7D347D1B3820D12C93B1D162A380A42888B57BDE31D8CA28BCBCA86E9E20BF7F1862B1DE383D160A016CF5563A4BC33835B29A766BB95540E591F976C2D2B09EE93C64A796706B712E768BB91144E410FB7602D13D5B7F081265B1EE928769BA26C6C652954FCC3D8D2E45A8DAF5118BA6459C9BDE25F8C59967835FD7ED63F0BC9CF302C3B56242315DA16926810A125164A4134687AE946313D4714CD118BF34C1D5FAAA6DC5B35CB7F2EB2BA7DCA8398EF03796DF66F7EB3DA7C9B5FDB7765C784E35D426F7DE6DDA421750517D4CD0D9617873C1429A2F8D3C04B7CA277B6F4ADB3BBBC6AFBEC8B8C30B604FD25674AB29CE4F2D687A1D320C91364030356F835AB0F9A1E4267FADC2BAD1A5FE7A9EA51F2C055154517CCDAD920EA1C9C95074EF423FB8F5B2BC266E61B4F5EA902F04F3D312AF90F1258A5AC3B6A3D45A58A592FE98E28E4A1542185A21E5A56B34D6A4A560B56C2D358545DA3BB0439BFA48A2E97764756649A54A115C52B602B7416CBBAA32A9251AAC08AE2EED865668AB8A0EEF18EA63DDD0CB2A56587E1F5F6340DC66656C761B6C4CA9D7F15A8F2B92716BFD597C0F8F7BD6496F6443808B3B278C87ACCD260E857A4DACD797D416ABCEED763D6AEC36B8B7E533A801EAF1F7F37CA12E970285629A4178744E13038E607B3F6D739D2492DAB621AB919815BAF31C5FE885518CDBE7A53CFC56C79CF2B5C23E22E704CB31410F3F8F0E85878D4B33F0F6CAC38763CC5C156F7CAA63E665BC8E622CF28B29F5024E756ACF108A50495C2D657C4C12F13F3F7B4D5691A0161FF4A3F1F1857F10371BF2650701F25D8F843CE151D2629BFF920B6A74F28BA5BF5EABF8F59D303E3368219736A1C0AB65C6584EB0F2B7A6993355D439B959F5BBCDD09557BBAA0441526C4EA2F15E62E1DE49542AEE53F7DF4F26D5FD5942F11D64254BC36180A6F1013EA5E13AC82A57D49E0C04F9ABE24E8D759F5CB825554D3BE2A70497F30F14D41F765286FB9C3AD46713EDAC69294DAB935277BAD04CD5DEF4D52EAF65A135D4ECFEE01B7460AF60ACC7863D9CB83ED8E8AE4E4C1B07749ED8D6724EF4B1272991EB2DBDCE36DA61B375C1DFDADB28CF7202F4E91E7B3FB5CE26D734D17D3DDF384CC7E19C37B46369EFDB5FBBCE06D934D17E6DD73B2F5CAFEDD33AEED6AFFDC31D33A6FA13BCFE595D392347733AA58705BAE6E16388713FE3C0012641E65F6C4529D1CD694D8DA22B0ACA217AACF4A13054B1347922BD56816DBAFAF7CC36FEC2CAFD32C5693CBD9249BAFFF8DB2799D66D99A0CC95D64192B73145599DF2DEB5853A2D45BCA2AAEF5A42589BDCD676DBC687F4B49C48318A5367B3477C46F27677810930C39757AE408CBD7BDB07756FE6423ECDFB1BB2C21D81F7024D8AEED9A459D2BB208F2CD5BD028AF224468AE31450E6CA967117517C8A650CC62CCE91BF1346EC76E3AE6D8B922B7090D130A5DC6FEDCAB05BC9813D0243F4D84AEEB3CBE0DD33F77324417404D97C5E66FC9CF89EB3985DE978A9890068279173CA2CBC692B2C8EEF2B540BA094847206EBEC229BAC77EE801587C4B66E819AFA21BD0EF235E22FBB58C00EA40DA07A26EF6F1B98B9611F2638E51B6879FC061C77FF9F1FF2DED54EFB9540000, N'6.1.0-30225')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'e60ab8d7-f960-4fb7-be86-b0738bbe03ae', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Scheduling')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2951693b-efb7-4ea3-9432-4d7ac4d2f77a', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4e26b40b-4096-4ab7-b78b-9492bc2fd95d', N'e60ab8d7-f960-4fb7-be86-b0738bbe03ae')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2951693b-efb7-4ea3-9432-4d7ac4d2f77a', N'Scheduling@none.com', 0, N'AGQo1VrD++8NxfcSi/EfUbJEAruexAyvuGkYeR5ZZf9XrrMJKbNgUHYb2k07DfTs7g==', N'53504c2e-0b60-4042-9aef-7ada55c51f1d', NULL, 0, 0, NULL, 1, 0, N'Scheduling@none.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4e26b40b-4096-4ab7-b78b-9492bc2fd95d', N'admin@none.com', 0, N'ABX/2iJx/fJFaFtycL86VSMYxl0OPPmoCHRrKspBepB5dLZtAJ7BOlRZqXGwuGKLlw==', N'dc915dfa-dd87-43f6-829c-1fb81dc32862', NULL, 0, 0, NULL, 1, 0, N'admin@none.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'efa8fed3-0a2e-4abd-b6f5-5aeacbbe6d9a', N'dfh@gsrd.com', 0, N'AH+eSa3KttaRmH49WZiZjrBTm6/gkXWdRODUNw+SpjFA1eTAdwq+C9Z5qZLUlqdBBg==', N'ec316cad-d1df-452d-9698-190f87e7aab2', NULL, 0, 0, NULL, 1, 0, N'dfh@gsrd.com')
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (1, N'Linkbridge', N'Oth disp fx of third cervcal vert, subs for fx w routn heal', 3, N'Subluxation and dislocation of wrist and hand joints', N'Superficial frostbite of unspecified wrist, sequela', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (2, N'Avavee', N'Displ transverse fx l patella, 7thJ', 2, N'Drown due to oth accident to sailboat, sequela', N'Pseudofolliculitis barbae', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (3, N'Yacero', N'Toxic eff of fluorine gas and hydrogen fluoride, undet, sqla', 5, N'Lac w fb of unsp front wall of thorax w penet thor cavity', N'Driver of hv veh inj pick-up truck, pk-up/van in traf, subs', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (4, N'Zoomdog', N'Poisoning by 4-Aminophenol derivatives, accidental', 5, N'Fracture of shoulder and upper arm', N'Balanced translocation and insertion in normal individual', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (5, N'Oyonder', N'Athscl autol vein bypass of r leg w ulcer of heel and midft', 3, N'Nondisp fx of head of right radius, init for clos fx', N'Wegener''s granulomatosis with renal involvement', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (6, N'Voolia', N'Unspecified physeal fracture of right metatarsal, 7thP', 5, N'Nondisplaced bicondylar fracture of unspecified tibia', N'Weeks of gestation of pregnancy not specified', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (7, N'Vidoo', N'Laceration without foreign body of unsp wrist, init encntr', 4, N'Sprain of metatarsophalangeal joint of unsp toe(s), sequela', N'Unsp fracture of unsp wrist and hand, subs for fx w malunion', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (8, N'Livepath', N'Corrosion of first degree of left toe(s) (nail), subs encntr', 5, N'Person outsd car inj in clsn w nonmtr vehicle nontraf, subs', N'Felty''s syndrome, unspecified site', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (9, N'Photobean', N'Osteochondritis dissecans, unspecified hip', 4, N'Periarthritis, left wrist', N'Laceration of left kidney, unspecified degree, subs encntr', 1)
INSERT [dbo].[Course] ([Id], [CourseName], [CourseDescription], [CreditHours], [Curriculum], [Notes], [IsActive]) VALUES (10, N'Pixoboo', N'Milt op w chemical weapons and oth unconvtl warfare, milt', 5, N'Unsp injury of musc/fasc/tend long head of biceps', N'Poisoning by oth parasympathomimetics, assault, init encntr', 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Enrollments] ON 

INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (1, 31, 23, CAST(N'2020-12-16' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (2, 41, 24, CAST(N'2021-05-09' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (3, 42, 25, CAST(N'2021-02-07' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (4, 45, 26, CAST(N'2021-10-27' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (5, 46, 27, CAST(N'2021-03-09' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (6, 47, 28, CAST(N'2021-12-03' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (7, 48, 29, CAST(N'2021-11-26' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (8, 49, 23, CAST(N'2020-12-14' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (9, 50, 30, CAST(N'2021-11-11' AS Date))
INSERT [dbo].[Enrollments] ([Id], [StudentId], [ScheduledClassId], [EnrollmentDate]) VALUES (10, 51, 31, CAST(N'2021-10-01' AS Date))
SET IDENTITY_INSERT [dbo].[Enrollments] OFF
SET IDENTITY_INSERT [dbo].[ScheduledClasses] ON 

INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (21, 1, CAST(N'2021-03-16' AS Date), CAST(N'2021-04-09' AS Date), N'Good Sense Mucus Relief', N'rsykora0', 2)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (23, 3, CAST(N'2021-07-14' AS Date), CAST(N'2021-02-03' AS Date), N'MULTI PERFECTION MAX', N'kshoosmith2', 1)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (24, 4, CAST(N'2021-03-13' AS Date), CAST(N'2021-01-26' AS Date), N'Colirio Ocusan', N'vortes3', 4)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (25, 5, CAST(N'2021-09-26' AS Date), CAST(N'2021-04-02' AS Date), N'Cephalexin', N'dbriston4', 1)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (26, 6, CAST(N'2021-08-20' AS Date), CAST(N'2021-05-30' AS Date), N'PAUL AND JOE SILKY SMOOTH FOUNDATION UV 201', N'lmonkleigh5', 2)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (27, 7, CAST(N'2021-04-17' AS Date), CAST(N'2021-01-04' AS Date), N'Thioridazine Hydrochloride', N'lwackly6', 4)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (28, 8, CAST(N'2021-06-09' AS Date), CAST(N'2021-06-01' AS Date), N'Sterile Water', N'kchumley7', 3)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (29, 9, CAST(N'2021-11-10' AS Date), CAST(N'2021-06-18' AS Date), N'Premier Value Cold Sore Treatment', N'abodham8', 2)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (30, 10, CAST(N'2020-12-27' AS Date), CAST(N'2021-04-15' AS Date), N'Harmon Face Values Medicated', N'cmacinnes9', 1)
INSERT [dbo].[ScheduledClasses] ([Id], [CourseId], [StartDate], [EndDate], [InstructorName], [Location], [SCSID]) VALUES (31, 2, CAST(N'2021-10-08' AS Date), CAST(N'2021-05-12' AS Date), N'Ceramide Lift', N'bhearn1', 3)
SET IDENTITY_INSERT [dbo].[ScheduledClasses] OFF
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] ON 

INSERT [dbo].[ScheduledClassStatuses] ([Id], [SCSName]) VALUES (1, N'Active')
INSERT [dbo].[ScheduledClassStatuses] ([Id], [SCSName]) VALUES (2, N'Pending')
INSERT [dbo].[ScheduledClassStatuses] ([Id], [SCSName]) VALUES (3, N'Completed')
INSERT [dbo].[ScheduledClassStatuses] ([Id], [SCSName]) VALUES (4, N'Cancelled')
SET IDENTITY_INSERT [dbo].[ScheduledClassStatuses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (31, N'Josh', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', NULL, 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (41, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'73050c63-4daa-4843-b337-6b1c34b6b14a.png', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (42, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (45, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (46, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (47, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (48, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'http://dummyimage.com/238x100.png/dddddd/000000', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (49, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (50, N'Parker', N'Crepin', N'Games', N'54 Lotheville Crossing', N'El Doncello', NULL, N'181019    ', N'774-955-9586', N'pcrepin2@is.gd', N'http://dummyimage.com/238x100.png/dddddd/000000', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (51, N'Tonye', N'Gilbeart', N'Music', N'533 Summerview Pass', N'Oster', NULL, N'216642    ', N'141-945-1893', N'tgilbeart3@feedburner.com', N'http://dummyimage.com/198x100.png/cc0000/ffffff', 4)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (52, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (53, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (54, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (55, N'Berrie', N'Lancastle', N'Beauty', N'9317 Fisk Junction', N'Redziny', NULL, N'42-242    ', N'246-761-7207', N'blancastle7@businesswire.com', N'http://dummyimage.com/186x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (58, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'http://dummyimage.com/238x100.png/dddddd/000000', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (59, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (60, N'Parker', N'Crepin', N'Games', N'54 Lotheville Crossing', N'El Doncello', NULL, N'181019    ', N'774-955-9586', N'pcrepin2@is.gd', N'http://dummyimage.com/238x100.png/dddddd/000000', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (61, N'Tonye', N'Gilbeart', N'Music', N'533 Summerview Pass', N'Oster', NULL, N'216642    ', N'141-945-1893', N'tgilbeart3@feedburner.com', N'http://dummyimage.com/198x100.png/cc0000/ffffff', 4)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (62, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (63, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (64, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (65, N'Berrie', N'Lancastle', N'Beauty', N'9317 Fisk Junction', N'Redziny', NULL, N'42-242    ', N'246-761-7207', N'blancastle7@businesswire.com', N'http://dummyimage.com/186x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (68, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'http://dummyimage.com/238x100.png/dddddd/000000', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (69, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (70, N'Parker', N'Crepin', N'Games', N'54 Lotheville Crossing', N'El Doncello', NULL, N'181019    ', N'774-955-9586', N'pcrepin2@is.gd', N'http://dummyimage.com/238x100.png/dddddd/000000', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (71, N'Tonye', N'Gilbeart', N'Music', N'533 Summerview Pass', N'Oster', NULL, N'216642    ', N'141-945-1893', N'tgilbeart3@feedburner.com', N'http://dummyimage.com/198x100.png/cc0000/ffffff', 4)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (72, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (73, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (74, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (75, N'Berrie', N'Lancastle', N'Beauty', N'9317 Fisk Junction', N'Redziny', NULL, N'42-242    ', N'246-761-7207', N'blancastle7@businesswire.com', N'http://dummyimage.com/186x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (78, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'http://dummyimage.com/238x100.png/dddddd/000000', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (79, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (80, N'Parker', N'Crepin', N'Games', N'54 Lotheville Crossing', N'El Doncello', NULL, N'181019    ', N'774-955-9586', N'pcrepin2@is.gd', N'http://dummyimage.com/238x100.png/dddddd/000000', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (81, N'Tonye', N'Gilbeart', N'Music', N'533 Summerview Pass', N'Oster', NULL, N'216642    ', N'141-945-1893', N'tgilbeart3@feedburner.com', N'http://dummyimage.com/198x100.png/cc0000/ffffff', 4)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (82, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (83, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (84, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (85, N'Berrie', N'Lancastle', N'Beauty', N'9317 Fisk Junction', N'Redziny', NULL, N'42-242    ', N'246-761-7207', N'blancastle7@businesswire.com', N'http://dummyimage.com/186x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (88, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'http://dummyimage.com/238x100.png/dddddd/000000', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (89, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (90, N'Parker', N'Crepin', N'Games', N'54 Lotheville Crossing', N'El Doncello', NULL, N'181019    ', N'774-955-9586', N'pcrepin2@is.gd', N'http://dummyimage.com/238x100.png/dddddd/000000', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (91, N'Tonye', N'Gilbeart', N'Music', N'533 Summerview Pass', N'Oster', NULL, N'216642    ', N'141-945-1893', N'tgilbeart3@feedburner.com', N'http://dummyimage.com/198x100.png/cc0000/ffffff', 4)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (92, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (93, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (94, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (95, N'Berrie', N'Lancastle', N'Beauty', N'9317 Fisk Junction', N'Redziny', NULL, N'42-242    ', N'246-761-7207', N'blancastle7@businesswire.com', N'http://dummyimage.com/186x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (98, N'Kacy', N'Learmont', N'Beauty', N'9362 Ilene Parkway', N'Acolla', NULL, NULL, N'367-849-1920', N'klearmont0@zimbio.com', N'http://dummyimage.com/238x100.png/dddddd/000000', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (99, N'Oriana', N'Eschelle', N'Baby', N'24 Manufacturers Trail', N'Bila Krynytsya', NULL, NULL, N'427-837-5179', N'oeschelle1@go.com', N'http://dummyimage.com/191x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (100, N'Parker', N'Crepin', N'Games', N'54 Lotheville Crossing', N'El Doncello', NULL, N'181019    ', N'774-955-9586', N'pcrepin2@is.gd', N'http://dummyimage.com/238x100.png/dddddd/000000', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (101, N'Tonye', N'Gilbeart', N'Music', N'533 Summerview Pass', N'Oster', NULL, N'216642    ', N'141-945-1893', N'tgilbeart3@feedburner.com', N'http://dummyimage.com/198x100.png/cc0000/ffffff', 4)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (102, N'Lydie', N'Gelly', N'Sports', N'7291 Straubel Point', N'Nova Varoš', NULL, NULL, N'655-729-2219', N'lgelly4@flickr.com', N'http://dummyimage.com/135x100.png/ff4444/ffffff', 5)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (103, N'Pren', N'Summerhayes', N'Computers', N'9 Pierstorff Alley', N'Wu’erqihan', NULL, NULL, N'658-690-3039', N'psummerhayes5@parallels.com', N'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 6)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (104, N'Joice', N'Robert', N'Music', N'823 Grim Road', N'Rosso', NULL, NULL, N'757-846-2330', N'jrobert6@cpanel.net', N'http://dummyimage.com/178x100.png/ff4444/ffffff', 1)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (105, N'Berrie', N'Lancastle', N'Beauty', N'9317 Fisk Junction', N'Redziny', NULL, N'42-242    ', N'246-761-7207', N'blancastle7@businesswire.com', N'http://dummyimage.com/186x100.png/cc0000/ffffff', 2)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (106, N'Erik', N'Laister', N'Clothing', N'1 Meadow Valley Way', N'Kista', N'MO', N'16421     ', N'516-969-9311', N'elaister8@eepurl.com', N'http://dummyimage.com/167x100.png/dddddd', 3)
INSERT [dbo].[Students] ([Id], [FirstName], [LastName], [Major], [Address], [City], [State], [ZipCode], [Phone], [Email], [PhotoUrl], [SSID]) VALUES (107, N'Randall', N'Boardman', N'Health', N'989 Vernon Trail', N'Paris La Defense', N'MO', N'92929     ', N'104-223-8919', N'rboardman9@alibaba.com', N'http://dummyimage.com/128x100.png/cc0000', 4)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[StudentStatuses] ON 

INSERT [dbo].[StudentStatuses] ([Id], [SSName], [SSDescription]) VALUES (1, N'Prospect', N'A student who has inquired about taking classes at the institution.')
INSERT [dbo].[StudentStatuses] ([Id], [SSName], [SSDescription]) VALUES (2, N'Current Student', N'A student who is actively participating in classes.')
INSERT [dbo].[StudentStatuses] ([Id], [SSName], [SSDescription]) VALUES (3, N'Former Student- Withdrawn', N'A student who has left the institution on their own accord.')
INSERT [dbo].[StudentStatuses] ([Id], [SSName], [SSDescription]) VALUES (4, N'Former Student- Dismissed', N'A student who has left the institution at our request.')
INSERT [dbo].[StudentStatuses] ([Id], [SSName], [SSDescription]) VALUES (5, N'Alumni', N'A student who has finished their coursework and left the institution.')
INSERT [dbo].[StudentStatuses] ([Id], [SSName], [SSDescription]) VALUES (6, N'Booted', N'This is what happens when you don''t go to class. ')
SET IDENTITY_INSERT [dbo].[StudentStatuses] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_ScheduledClasses] FOREIGN KEY([ScheduledClassId])
REFERENCES [dbo].[ScheduledClasses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_ScheduledClasses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_ScheduledClasses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [FK_Enrollments_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Enrollments_Students]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enrollments]'))
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [FK_Enrollments_Students]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses] FOREIGN KEY([SCSID])
REFERENCES [dbo].[ScheduledClassStatuses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ScheduledClasses_ScheduledClassStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[ScheduledClasses]'))
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [FK_ScheduledClasses_ScheduledClassStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_StudentStatuses] FOREIGN KEY([SSID])
REFERENCES [dbo].[StudentStatuses] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Students_StudentStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Students]'))
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_StudentStatuses]
GO
