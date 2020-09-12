USE master;
GO
/*建立空的MyPetShop数据库*/
/*请根据实际环境更改数据库文件和日志文件的存放路径*/
GO
USE TaskManagePro
/*分别建立Users等数据表的结构*/

CREATE TABLE [Users](
    [UserId] int identity PRIMARY KEY,
    [Name] [nvarchar](80) NOT NULL,
    [Password] [nvarchar](80) NOT NULL,
    [Email] [nvarchar](80) NOT NULL,
    [StuNumber] [nvarchar](80) NOT NULL)

/*在Users表中插入示例数据*/
INSERT INTO [Users] ([Name], [Password],[Email],[StuNumber]) VALUES ('xq17', '12334', 'kk@qq.com', '20174390113')
GO

CREATE TABLE [Person](
    [PersonId] int identity PRIMARY KEY,
    [Name] [nvarchar](80) NOT NULL,
    [NickName] [nvarchar](80),
    [Email] [nvarchar](80) NOT NULL,
    [StuNumber] [nvarchar](80) NOT NULL,
    [Introduce] [text],
    [Sex] [varchar](2)
    )
GO

INSERT INTO [Person] ([Name], [NickName],[Email],[StuNumber],[Introduce], [Sex]) VALUES ('xq17', 'hackerboy', 'kk@qq.com', '20174390113', '我是个大帅B！', '女');
GO

CREATE TABLE [Board](
    [BoardId] int identity PRIMARY KEY,
    [Info] text NOT NULL,
    [CreateTime] DATETIME DEFAULT(GETDATE()),
    )
Go
INSERT INTO [Board] ([Info]) VALUES('路人甲开启了他的页面展示:http://111.2301.97.23/');
GO

CREATE TABLE [Ecs](
    [EcsId] int identity PRIMARY KEY,
    [User] [nvarchar](80) default 'root',
	[Password] [nvarchar](255) default 'root',
	[Host] [nvarchar](80) default '127.0.0.1',
	[Owner] [nvarchar](80) NOT NULL,
	[Url] [nvarchar](200) default '',
	[Status] [varchar](20) default 'close'
    )
Go
INSERT INTO [Ecs] ( [Owner] )  VALUES ('xq17');
USE master;
GO