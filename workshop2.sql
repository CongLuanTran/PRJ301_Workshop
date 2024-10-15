USE [workshop01]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/15/2024 2:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cat_id] [varchar](10) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
	[cat_description] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/15/2024 2:54:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[pro_id] [varchar](10) NOT NULL,
	[pro_name] [varchar](50) NOT NULL,
	[pro_price] [bigint] NOT NULL,
	[pro_quantity] [int] NOT NULL,
	[pro_description] [nvarchar](500) NOT NULL,
	[cat_id] [varchar](10) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'1', N'Apple', N' ')
GO
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'2', N'Samsung', N' ')
GO
INSERT [dbo].[category] ([cat_id], [cat_name], [cat_description]) VALUES (N'3', N'Xiaomi', N' ')
GO
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_description], [cat_id]) VALUES (N'1', N'IPhone 15 ', 22000000, 20, N'New', N'1')
GO
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_description], [cat_id]) VALUES (N'2', N'IPhone 14', 17000000, 10, N'Like New', N'1')
GO
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_description], [cat_id]) VALUES (N'3', N'Samsung S24', 22000000, 15, N'New', N'2')
GO
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_description], [cat_id]) VALUES (N'4', N'Redmi K30 5G', 5500000, 30, N'China', N'3')
GO
INSERT [dbo].[product] ([pro_id], [pro_name], [pro_price], [pro_quantity], [pro_description], [cat_id]) VALUES (N'5', N'Redmi Note 14', 13000000, 12, N'China', N'3')
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_category] FOREIGN KEY([cat_id])
REFERENCES [dbo].[category] ([cat_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_category]
GO
