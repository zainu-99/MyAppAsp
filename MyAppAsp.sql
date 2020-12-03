/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4259)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [MYAPPASP.MDF]
GO
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[ErrorReport]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[GroupLevel]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[Groups]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[LogApp]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[MenuApp]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[RoleGroupLevel]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleGroupLevel](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_role] [bigint] NULL,
	[id_group_level] [bigint] NULL,
	[isView] [bit] NOT NULL,
	[isAdd] [bit] NOT NULL,
	[isEdit] [bit] NOT NULL,
	[isDelete] [bit] NOT NULL,
	[isPrint] [bit] NOT NULL,
	[isCustom] [bit] NOT NULL,
 CONSTRAINT [PK_GroupRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[note] [varchar](250) NULL,
	[url] [varchar](250) NULL,
	[controller] [varchar](250) NULL,
	[AccessView] [bit] NOT NULL,
	[AccessAdd] [bit] NOT NULL,
	[AccessEdit] [bit] NOT NULL,
	[AccessDelete] [bit] NOT NULL,
	[AccessPrint] [bit] NOT NULL,
	[AccessCustom] [bit] NOT NULL,
 CONSTRAINT [PK_Auth] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SettingApp]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[UserGroupLevel]    Script Date: 03/12/2020 14:50:13 ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[id_user] [bigint] NULL,
	[id_role] [bigint] NULL,
	[allow_view] [bit] NULL,
	[allow_add] [bit] NULL,
	[allow_edit] [bit] NULL,
	[allow_delete] [bit] NULL,
	[allow_print] [bit] NULL,
	[allow_custom] [bit] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/12/2020 14:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[status] [bit] NOT NULL,
	[online_offline] [bit] NOT NULL,
	[password_noencrypt] [varchar](50) NULL,
	[password] [varchar](250) NULL,
	[token] [varchar](250) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[GroupLevel] ON 

INSERT [dbo].[GroupLevel] ([id], [id_group], [id_parent], [remark]) VALUES (18, 2, NULL, N'Group Admin')
SET IDENTITY_INSERT [dbo].[GroupLevel] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (2, N'Admin', N'Admin', NULL, CAST(N'2020-11-21T01:34:42.000' AS DateTime))
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (3, N'Staff', N'Staff', CAST(N'2020-11-21T07:23:00.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (4, N'Leader', N'Leader', CAST(N'2020-11-21T07:23:11.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (5, N'Supervisor', N'Supervisor', CAST(N'2020-11-21T07:23:20.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (6, N'Manager', N'Manager', CAST(N'2020-11-21T07:23:30.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (7, N'Director', N'Director', CAST(N'2020-11-21T07:23:54.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (8, N'HR', N'Department', CAST(N'2020-11-21T07:24:32.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (9, N'GA', N'Department', CAST(N'2020-11-21T07:25:17.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (10, N'IT', N'Department', CAST(N'2020-11-21T07:25:27.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (11, N'Finance', N'Department', CAST(N'2020-11-21T07:25:44.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (12, N'Sales', N'Department', CAST(N'2020-11-21T07:25:57.000' AS DateTime), NULL)
INSERT [dbo].[Groups] ([id], [name], [remark], [created_at], [updated_at]) VALUES (13, N'RnD', N'Department', CAST(N'2020-11-21T07:26:17.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[MenuApp] ON 

INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (1, 7, N'Sistem Admin', NULL, N'<i class="nav-icon fas fa-users-cog"></i>', 0)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (10, 15, N'Master Data', NULL, N'<i class="nav-icon fas fa-database"></i>', 1)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (11, 8, N'User', 1, N'<i class="nav-icon far fas fa-users"></i>', 1)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (12, 9, N'Group', 10, N'<i class="nav-icon fas fa-layer-group"></i>', 1)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (13, 11, N'Role', 10, N'<i class="nav-icon fas fa-tag"></i>', 3)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (15, 33, N'Menu', 10, N'<i class="nav-icon fas fa-tag"></i>', 2)
INSERT [dbo].[MenuApp] ([ID], [RoleID], [MenuText], [IDParentMenu], [IconMenu], [OrderSort]) VALUES (16, 13, N'Group', 1, N'<i class="nav-icon fas fa-circle"></i>', 2)
SET IDENTITY_INSERT [dbo].[MenuApp] OFF
SET IDENTITY_INSERT [dbo].[RoleGroupLevel] ON 

INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (34, 9, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (35, 13, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (36, 15, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (50, 10, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (52, 11, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (53, 7, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (54, 8, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (87, 33, 18, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (101, 38, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[RoleGroupLevel] ([id], [id_role], [id_group_level], [isView], [isAdd], [isEdit], [isDelete], [isPrint], [isCustom]) VALUES (102, 41, 18, 1, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[RoleGroupLevel] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (7, N'Sistem Admin', N'Akses Menu Sistem Admin', N'', N'', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (8, N'User', N'Akses Menu Sistem Admin>User', N'appdashboard/adminsystem', N'User', 1, 1, 1, 1, 1, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (9, N'Master Group', N'Akses Menu Master Data>Group', N'appdashboard/masterdata/group', N'Group', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (10, N'User Access', N'Akses Menu Sistem Admin>User Access', N'appdashboard/adminsystem/user', N'UserRole', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (11, N'Role', N'Akses Menu Master Data>Role', N'appdashboard/masterdata/role', N'Role', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (13, N'Group', N'Akses Menu Sistem Admin>Group', N'appdashboard/adminsystem/grouplevel', N'GroupLevel', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (15, N'Master Data', N'Akses Menu Master Data', N'', N'', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (33, N'Menu', N'Akses Menu Master Data>Menu', N'appdashboard/masterdata/menu', N'Menu', 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (38, N'Role Group', N'Akses Menu Sistem Admin>Group>Role Group', N'appdashboard/adminsystem/grouplevel/rolegrouplevel', N'RoleGroupLevel', 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Roles] ([id], [name], [note], [url], [controller], [AccessView], [AccessAdd], [AccessEdit], [AccessDelete], [AccessPrint], [AccessCustom]) VALUES (41, N'User Group', N'Akses Menu Sistem Admin>User>User Group', N'appdashboard/adminsystem/user/usergrouplevel', N'UserGroupLevel', 1, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UserGroupLevel] ON 

INSERT [dbo].[UserGroupLevel] ([id], [id_user], [id_group_level]) VALUES (83, 16, 18)
INSERT [dbo].[UserGroupLevel] ([id], [id_user], [id_group_level]) VALUES (85, 17, 18)
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
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (188, 17, 15, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (189, 17, 9, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (190, 17, 33, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (191, 17, 11, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (196, 17, 7, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (197, 17, 13, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (198, 17, 38, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (199, 17, 8, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (200, 17, 10, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[UserRole] ([id], [id_user], [id_role], [allow_view], [allow_add], [allow_edit], [allow_delete], [allow_print], [allow_custom]) VALUES (201, 17, 41, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [userid], [name], [email], [nohp], [address], [avatar], [gender], [status], [online_offline], [password_noencrypt], [password], [token], [created_at], [updated_at]) VALUES (16, N'Admin', N'Admin', N'-', N'-', NULL, NULL, N'M', 1, 0, N'123', N'202CB962AC59075B964B07152D234B70', N'-', CAST(N'2019-10-02T14:45:55.550' AS DateTime), CAST(N'2019-10-10T13:49:25.800' AS DateTime))
INSERT [dbo].[Users] ([id], [userid], [name], [email], [nohp], [address], [avatar], [gender], [status], [online_offline], [password_noencrypt], [password], [token], [created_at], [updated_at]) VALUES (17, N'IT009', N'Jay', N'-', N'-', N'-', NULL, N'M', 1, 0, N'123', N'202CB962AC59075B964B07152D234B70', N'-', CAST(N'2020-11-21T20:02:57.803' AS DateTime), CAST(N'2020-11-21T20:02:57.803' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_ReadStatus]  DEFAULT ((0)) FOR [ReadStatus]
GO
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_DeleteStatusUserSender]  DEFAULT ((0)) FOR [DeleteStatusUserSender]
GO
ALTER TABLE [dbo].[ChatMessage] ADD  CONSTRAINT [DF_ChatMessage_DeleteStatusUserReciever]  DEFAULT ((0)) FOR [DeleteStatusUserReciever]
GO
ALTER TABLE [dbo].[RoleGroupLevel] ADD  CONSTRAINT [DF_RoleGroupLevel_isView]  DEFAULT ((1)) FOR [isView]
GO
ALTER TABLE [dbo].[RoleGroupLevel] ADD  CONSTRAINT [DF_RoleGroupLevel_isAdd]  DEFAULT ((0)) FOR [isAdd]
GO
ALTER TABLE [dbo].[RoleGroupLevel] ADD  CONSTRAINT [DF_RoleGroupLevel_isEdit]  DEFAULT ((0)) FOR [isEdit]
GO
ALTER TABLE [dbo].[RoleGroupLevel] ADD  CONSTRAINT [DF_RoleGroupLevel_isDelete]  DEFAULT ((0)) FOR [isDelete]
GO
ALTER TABLE [dbo].[RoleGroupLevel] ADD  CONSTRAINT [DF_RoleGroupLevel_isPrint]  DEFAULT ((0)) FOR [isPrint]
GO
ALTER TABLE [dbo].[RoleGroupLevel] ADD  CONSTRAINT [DF_RoleGroupLevel_isCustom]  DEFAULT ((0)) FOR [isCustom]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_AccessView]  DEFAULT ((0)) FOR [AccessView]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_AccessAdd]  DEFAULT ((0)) FOR [AccessAdd]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_AccessEdit]  DEFAULT ((0)) FOR [AccessEdit]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_AccessDelete]  DEFAULT ((0)) FOR [AccessDelete]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_AccessPrint]  DEFAULT ((0)) FOR [AccessPrint]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_AccessCustom]  DEFAULT ((0)) FOR [AccessCustom]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_online_offline]  DEFAULT ((0)) FOR [online_offline]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_myTable_createdat]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_myTable_updatedAt]  DEFAULT (getdate()) FOR [updated_at]
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
