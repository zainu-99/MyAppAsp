USE [master]
GO
/****** Object:  Database [MyAppAsp]    Script Date: 12/9/2020 6:53:04 PM ******/
CREATE DATABASE [MyAppAsp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyAppAsp', FILENAME = N'E:\ProgramFile\SqlServer\MSSQL12.SQLEXPRESS\MSSQL\DATA\MyAppAsp.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyAppAsp_log', FILENAME = N'E:\ProgramFile\SqlServer\MSSQL12.SQLEXPRESS\MSSQL\DATA\MyAppAsp_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyAppAsp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyAppAsp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyAppAsp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyAppAsp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyAppAsp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyAppAsp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyAppAsp] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyAppAsp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyAppAsp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyAppAsp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyAppAsp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyAppAsp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyAppAsp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyAppAsp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyAppAsp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyAppAsp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyAppAsp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyAppAsp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyAppAsp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyAppAsp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyAppAsp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyAppAsp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyAppAsp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyAppAsp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyAppAsp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyAppAsp] SET  MULTI_USER 
GO
ALTER DATABASE [MyAppAsp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyAppAsp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyAppAsp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyAppAsp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MyAppAsp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MyAppAsp]
GO
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChatMessage](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Message] [text] NULL,
	[FileAttached] [varchar](250) NULL,
	[UserID] [bigint] NULL,
	[UserIDReciever] [bigint] NULL,
	[ReadStatus] [bit] NOT NULL,
	[DeleteStatusUserSender] [bit] NOT NULL,
	[DeleteStatusUserReciever] [bit] NOT NULL,
	[Created_At] [datetime] NULL,
 CONSTRAINT [PK_ChatMessage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorReport]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorReport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](50) NULL,
	[MsgError] [text] NULL,
	[Datetime] [datetime] NULL,
	[Note] [text] NULL,
	[UserId] [bigint] NULL,
 CONSTRAINT [PK_ReportError] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupLevel]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupLevel](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_group] [bigint] NULL,
	[id_parent] [bigint] NULL,
	[remark] [varchar](250) NULL,
 CONSTRAINT [PK_GroupLevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[remark] [varchar](250) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogApp]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogApp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [varchar](10) NULL,
	[TableName] [varchar](50) NULL,
	[DataBefore] [text] NULL,
	[DataAfter] [text] NOT NULL,
	[Datetime] [datetime] NULL,
	[UserID] [bigint] NULL,
	[Note] [varchar](250) NULL,
 CONSTRAINT [PK_LogApp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuApp]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuApp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [bigint] NULL,
	[MenuText] [nvarchar](50) NULL,
	[IDParentMenu] [int] NULL,
	[IconMenu] [varchar](50) NULL,
	[OrderSort] [int] NULL,
 CONSTRAINT [PK_MenuApp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleGroupLevel]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleGroupLevel](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_role] [bigint] NULL,
	[id_group_level] [bigint] NULL,
	[isView] [bit] NOT NULL CONSTRAINT [DF_RoleGroupLevel_isView]  DEFAULT ((1)),
	[isAdd] [bit] NOT NULL CONSTRAINT [DF_RoleGroupLevel_isAdd]  DEFAULT ((0)),
	[isEdit] [bit] NOT NULL CONSTRAINT [DF_RoleGroupLevel_isEdit]  DEFAULT ((0)),
	[isDelete] [bit] NOT NULL CONSTRAINT [DF_RoleGroupLevel_isDelete]  DEFAULT ((0)),
	[isPrint] [bit] NOT NULL CONSTRAINT [DF_RoleGroupLevel_isPrint]  DEFAULT ((0)),
	[isCustom] [bit] NOT NULL CONSTRAINT [DF_RoleGroupLevel_isCustom]  DEFAULT ((0)),
 CONSTRAINT [PK_GroupRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[note] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[controller] [varchar](250) NULL,
	[AccessView] [bit] NOT NULL CONSTRAINT [DF_Roles_AccessView]  DEFAULT ((0)),
	[AccessAdd] [bit] NOT NULL CONSTRAINT [DF_Roles_AccessAdd]  DEFAULT ((0)),
	[AccessEdit] [bit] NOT NULL CONSTRAINT [DF_Roles_AccessEdit]  DEFAULT ((0)),
	[AccessDelete] [bit] NOT NULL CONSTRAINT [DF_Roles_AccessDelete]  DEFAULT ((0)),
	[AccessPrint] [bit] NOT NULL CONSTRAINT [DF_Roles_AccessPrint]  DEFAULT ((0)),
	[AccessCustom] [bit] NOT NULL CONSTRAINT [DF_Roles_AccessCustom]  DEFAULT ((0)),
 CONSTRAINT [PK_Auth] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SettingApp]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SettingApp](
	[id] [int] NOT NULL,
	[name] [varchar](50) NULL,
	[remark] [varchar](250) NULL,
	[adjustment] [varchar](250) NULL,
 CONSTRAINT [PK_SettingApp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroupLevel]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupLevel](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_user] [bigint] NULL,
	[id_group_level] [bigint] NULL,
 CONSTRAINT [PK_UserGroupLevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_user] [bigint] NULL,
	[id_role] [bigint] NULL,
	[allow_view] [bit] NOT NULL,
	[allow_add] [bit] NOT NULL,
	[allow_edit] [bit] NOT NULL,
	[allow_delete] [bit] NOT NULL,
	[allow_print] [bit] NOT NULL,
	[allow_custom] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/9/2020 6:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[nohp] [varchar](50) NULL,
	[address] [varchar](250) NULL,
	[avatar] [varchar](250) NULL,
	[gender] [varchar](50) NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF_Users_status]  DEFAULT ((0)),
	[online_offline] [bit] NOT NULL CONSTRAINT [DF_Users_online_offline]  DEFAULT ((0)),
	[password] [varchar](250) NULL,
	[token] [varchar](250) NULL,
	[created_at] [datetime] NULL CONSTRAINT [DF_myTable_createdat]  DEFAULT (getdate()),
	[updated_at] [datetime] NULL CONSTRAINT [DF_myTable_updatedAt]  DEFAULT (getdate()),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GroupLevel] ON 

INSERT [dbo].[GroupLevel] ([id], [id_group], [id_parent], [remark]) VALUES (18, 2, NULL, N'Group Admin')
INSERT [dbo].[GroupLevel] ([id], [id_group], [id_parent], [remark]) VALUES (22, 3, 18, N'Staff')
SET IDENTITY_INSERT [dbo].[GroupLevel] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (2, N'Admin', N'Admin', NULL, CAST(N'2020-11-21 01:34:42.000' AS DateTime))
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (3, N'Staff', N'Staff', CAST(N'2020-11-21 07:23:00.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (4, N'Leader', N'Leader', CAST(N'2020-11-21 07:23:11.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (5, N'Supervisor', N'Supervisor', CAST(N'2020-11-21 07:23:20.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (6, N'Manager', N'Manager', CAST(N'2020-11-21 07:23:30.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (7, N'Director', N'Director', CAST(N'2020-11-21 07:23:54.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (8, N'HR', N'Department', CAST(N'2020-11-21 07:24:32.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (9, N'GA', N'Department', CAST(N'2020-11-21 07:25:17.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (10, N'IT', N'Department', CAST(N'2020-11-21 07:25:27.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (11, N'Finance', N'Department', CAST(N'2020-11-21 07:25:44.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (12, N'Sales', N'Department', CAST(N'2020-11-21 07:25:57.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (13, N'RnD', N'Department', CAST(N'2020-11-21 07:26:17.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[MenuApp] ON 

INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (1, 7, N'Sistem Admin', NULL, N'fas fa-user-cog', 0)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (10, 15, N'Master Data', NULL, N'fa fa-database', 1)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (11, 8, N'User', 1, N'fas fa-users', 1)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (12, 9, N'Group', 10, N'fas fa-layer-group', 1)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (13, 11, N'Role', 10, N'fas fa-tag', 3)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (15, 33, N'Menu', 10, N'fas fa-tag', 2)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (16, 13, N'Group', 1, N'fas fa-circle', 2)
SET IDENTITY_INSERT [dbo].[MenuApp] OFF
SET IDENTITY_INSERT [dbo].[RoleGroupLevel] ON 

INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (110, 15, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (111, 7, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (112, 13, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (113, 38, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (114, 8, 18, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (115, 41, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (116, 10, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (117, 9, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (118, 33, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (119, 11, 18, 1, 1, 1, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[RoleGroupLevel] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (7, N'Sistem Admin', NULL, N' ', N'', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (8, N'User', NULL, N'appdashboard/adminsystem/user', N'User', 1, 1, 1, 1, 1, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (9, N'Master Group', N'', N'appdashboard/masterdata/group', N'Group', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (10, N'User Access', NULL, N'appdashboard/adminsystem/user/userrole/{iduser}', N'UserRole', 1, 0, 1, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (11, N'Role', N'', N'appdashboard/masterdata/role', N'Role', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (13, N'Group', NULL, N'appdashboard/adminsystem/grouplevel', N'GroupLevel', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (15, N'Master Data', N'', N'', N'', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (33, N'Menu', N'', N'appdashboard/masterdata/menu', N'Menu', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (38, N'Role Group', NULL, N'appdashboard/adminsystem/grouplevel/rolegrouplevel/{idgroup}', N'RoleGroupLevel', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (41, N'User Group', NULL, N'appdashboard/adminsystem/user/usergrouplevel/{iduser}', N'UserGroupLevel', 1, 0, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UserGroupLevel] ON 

INSERT [dbo].[UserGroupLevel] ([id], [id_user], [id_group_level]) VALUES (88, 16, 18)
SET IDENTITY_INSERT [dbo].[UserGroupLevel] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (69, 16, 15, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (75, 16, 7, 1, 0, 1, 1, 1, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (76, 16, 10, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (77, 16, 9, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (78, 16, 13, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (79, 16, 11, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (81, 16, 8, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (103, 16, 33, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (183, 16, 38, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (184, 16, 41, 1, 0, 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [userid], [name], [email], [nohp], [address], [avatar], [gender], [status], [online_offline], [password], [token], [created_at], [updated_at]) VALUES (16, N'Admin', N'Admin', N'-', N'-', NULL, NULL, N'M', 1, 0, N'$2a$11$aXaLYLMN.tRTWXcG40ohreiHeND/oMEDAc4mOhX0tH5fyghuyd8LW', N'-', CAST(N'2019-10-02 14:45:55.550' AS DateTime), CAST(N'2019-10-10 13:49:25.800' AS DateTime))
INSERT [dbo].[Users] ([id], [userid], [name], [email], [nohp], [address], [avatar], [gender], [status], [online_offline], [password], [token], [created_at], [updated_at]) VALUES (18, N'User', N'User', N'-', N'-', NULL, NULL, N'M', 1, 0, N'$2a$11$z4HdCUsNh709Lhg4Wy3lKukXWOpSqTc03As5zfjLvwUdBYDE.OrS2', N'-', CAST(N'2020-12-06 13:27:03.923' AS DateTime), CAST(N'2020-12-06 13:27:03.923' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_ReadStatus]  DEFAULT ((0)) FOR [ReadStatus]
GO
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_DeleteStatusUserSender]  DEFAULT ((0)) FOR [DeleteStatusUserSender]
GO
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_DeleteStatusUserReciever]  DEFAULT ((0)) FOR [DeleteStatusUserReciever]
GO
ALTER TABLE [dbo].[ErrorReport]  WITH CHECK ADD  CONSTRAINT [FK_ErrorReport_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ErrorReport] CHECK CONSTRAINT [FK_ErrorReport_Users]
GO
ALTER TABLE [dbo].[GroupLevel]  WITH CHECK ADD  CONSTRAINT [FK_GroupLevel_GroupLevel] FOREIGN KEY([id_parent])
REFERENCES [dbo].[GroupLevel] ([id])
GO
ALTER TABLE [dbo].[GroupLevel] CHECK CONSTRAINT [FK_GroupLevel_GroupLevel]
GO
ALTER TABLE [dbo].[GroupLevel]  WITH CHECK ADD  CONSTRAINT [FK_GroupLevel_Groups2] FOREIGN KEY([id_group])
REFERENCES [dbo].[Groups] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GroupLevel] CHECK CONSTRAINT [FK_GroupLevel_Groups2]
GO
ALTER TABLE [dbo].[LogApp]  WITH CHECK ADD  CONSTRAINT [FK_LogApp_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogApp] CHECK CONSTRAINT [FK_LogApp_Users]
GO
ALTER TABLE [dbo].[MenuApp]  WITH CHECK ADD  CONSTRAINT [FK_MenuApp_MenuApp] FOREIGN KEY([IDParentMenu])
REFERENCES [dbo].[MenuApp] ([ID])
GO
ALTER TABLE [dbo].[MenuApp] CHECK CONSTRAINT [FK_MenuApp_MenuApp]
GO
ALTER TABLE [dbo].[MenuApp]  WITH CHECK ADD  CONSTRAINT [FK_MenuApp_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[MenuApp] CHECK CONSTRAINT [FK_MenuApp_Roles]
GO
ALTER TABLE [dbo].[RoleGroupLevel]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupLevel_GroupLevel] FOREIGN KEY([id_group_level])
REFERENCES [dbo].[GroupLevel] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleGroupLevel] CHECK CONSTRAINT [FK_RoleGroupLevel_GroupLevel]
GO
ALTER TABLE [dbo].[RoleGroupLevel]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupLevel_Roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[Roles] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleGroupLevel] CHECK CONSTRAINT [FK_RoleGroupLevel_Roles]
GO
ALTER TABLE [dbo].[UserGroupLevel]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupLevel_GroupLevel] FOREIGN KEY([id_group_level])
REFERENCES [dbo].[GroupLevel] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserGroupLevel] CHECK CONSTRAINT [FK_UserGroupLevel_GroupLevel]
GO
ALTER TABLE [dbo].[UserGroupLevel]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupLevel_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserGroupLevel] CHECK CONSTRAINT [FK_UserGroupLevel_Users]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([id_role])
REFERENCES [dbo].[Roles] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Users]
GO
USE [master]
GO
ALTER DATABASE [MyAppAsp] SET  READ_WRITE 
GO
