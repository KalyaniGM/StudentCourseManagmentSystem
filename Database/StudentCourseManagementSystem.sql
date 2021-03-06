USE [CourseManagementSystem]
GO
/****** Object:  Table [dbo].[tbl_Course]    Script Date: 27-03-2019 11:07:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseCode] [nvarchar](20) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[TeacherName] [nvarchar](20) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_tbl_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CourseRegistration]    Script Date: 27-03-2019 11:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CourseRegistration](
	[RegistrationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_CourseRegistration] PRIMARY KEY CLUSTERED 
(
	[RegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Login]    Script Date: 27-03-2019 11:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Login](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 27-03-2019 11:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Student]    Script Date: 27-03-2019 11:07:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[Surname] [nvarchar](20) NULL,
	[Gender] [nchar](10) NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Address1] [nvarchar](30) NULL,
	[Address2] [nvarchar](30) NULL,
	[Address3] [nvarchar](30) NULL,
 CONSTRAINT [PK_tbl_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_Course] ON 

INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (3, N'100A', N'TestA', N'John', CAST(N'2019-03-16 00:00:00.000' AS DateTime), CAST(N'2019-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (4, N'100B', N'TestB', N'Cena', CAST(N'2019-03-02 00:00:00.000' AS DateTime), CAST(N'2019-03-22 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (5, N'100C', N'TestC', N'Nik', CAST(N'2019-04-02 00:00:00.000' AS DateTime), CAST(N'2019-04-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (6, N'100D', N'TestD', N'Angela', CAST(N'2019-04-10 00:00:00.000' AS DateTime), CAST(N'2019-04-20 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (7, N'100E', N'TestE', N'Nik', CAST(N'2019-04-06 00:00:00.000' AS DateTime), CAST(N'2019-04-10 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (8, N'100F', N'TestF', N'Pol', CAST(N'2019-04-02 00:00:00.000' AS DateTime), CAST(N'2019-04-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (9, N'100G', N'TestG', N'Nik', CAST(N'2019-05-03 00:00:00.000' AS DateTime), CAST(N'2019-05-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (10, N'100H', N'TestH', N'Cena', CAST(N'2019-06-02 00:00:00.000' AS DateTime), CAST(N'2019-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Course] ([CourseID], [CourseCode], [CourseName], [TeacherName], [StartDate], [EndDate]) VALUES (11, N'100I', N'TestI', N'Angela', CAST(N'2019-08-01 00:00:00.000' AS DateTime), CAST(N'2019-08-10 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Course] OFF
SET IDENTITY_INSERT [dbo].[tbl_CourseRegistration] ON 

INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (1, 1, 3)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (2, 1, 5)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (3, 1, 7)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (4, 3, 4)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (5, 3, 6)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (6, 3, 10)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (7, 5, 3)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (8, 5, 5)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (9, 5, 7)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (10, 1, 9)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (11, 1, 10)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (12, 3, 3)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (13, 5, 3)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (14, 10, 3)
INSERT [dbo].[tbl_CourseRegistration] ([RegistrationID], [StudentID], [CourseID]) VALUES (15, 11, 5)
SET IDENTITY_INSERT [dbo].[tbl_CourseRegistration] OFF
SET IDENTITY_INSERT [dbo].[tbl_Login] ON 

INSERT [dbo].[tbl_Login] ([UserID], [UserName], [RoleID]) VALUES (1, N'KalyaniGaikwad', 1)
INSERT [dbo].[tbl_Login] ([UserID], [UserName], [RoleID]) VALUES (2, N'John', 2)
INSERT [dbo].[tbl_Login] ([UserID], [UserName], [RoleID]) VALUES (3, N'Nick', 2)
SET IDENTITY_INSERT [dbo].[tbl_Login] OFF
SET IDENTITY_INSERT [dbo].[tbl_Roles] ON 

INSERT [dbo].[tbl_Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_Roles] ([RoleID], [RoleName]) VALUES (2, N'Student')
SET IDENTITY_INSERT [dbo].[tbl_Roles] OFF
SET IDENTITY_INSERT [dbo].[tbl_Student] ON 

INSERT [dbo].[tbl_Student] ([StudentID], [FirstName], [Surname], [Gender], [DateOfBirth], [Address1], [Address2], [Address3]) VALUES (1, N'Kalyani', N'Gaikwad', N'Female    ', CAST(N'1989-01-01 00:00:00.000' AS DateTime), N'Address11', N'Address12', N'Address13')
INSERT [dbo].[tbl_Student] ([StudentID], [FirstName], [Surname], [Gender], [DateOfBirth], [Address1], [Address2], [Address3]) VALUES (3, N'Ron', N'Marie', N'Male      ', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'Address31', N'Address32', N'')
INSERT [dbo].[tbl_Student] ([StudentID], [FirstName], [Surname], [Gender], [DateOfBirth], [Address1], [Address2], [Address3]) VALUES (5, N'Anne', N'Marko', N'Female    ', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'Address41', N'Address42', N'Address43')
INSERT [dbo].[tbl_Student] ([StudentID], [FirstName], [Surname], [Gender], [DateOfBirth], [Address1], [Address2], [Address3]) VALUES (9, N'Joe', N'Sa', N'Male      ', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'Address71', N'Address72', N'')
INSERT [dbo].[tbl_Student] ([StudentID], [FirstName], [Surname], [Gender], [DateOfBirth], [Address1], [Address2], [Address3]) VALUES (10, N'Tom', N'Cruise', N'Male      ', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'Address51', N'Address52', N'')
INSERT [dbo].[tbl_Student] ([StudentID], [FirstName], [Surname], [Gender], [DateOfBirth], [Address1], [Address2], [Address3]) VALUES (11, N'Kate', N'Amato', N'Female    ', CAST(N'1995-01-01 00:00:00.000' AS DateTime), N'Address61', N'Address62', N'')
SET IDENTITY_INSERT [dbo].[tbl_Student] OFF
ALTER TABLE [dbo].[tbl_CourseRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CourseRegistration_tbl_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[tbl_Course] ([CourseID])
GO
ALTER TABLE [dbo].[tbl_CourseRegistration] CHECK CONSTRAINT [FK_tbl_CourseRegistration_tbl_Course]
GO
ALTER TABLE [dbo].[tbl_CourseRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CourseRegistration_tbl_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[tbl_Student] ([StudentID])
GO
ALTER TABLE [dbo].[tbl_CourseRegistration] CHECK CONSTRAINT [FK_tbl_CourseRegistration_tbl_Student]
GO
ALTER TABLE [dbo].[tbl_Login]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Login_tbl_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[tbl_Login] CHECK CONSTRAINT [FK_tbl_Login_tbl_Roles]
GO
/****** Object:  StoredProcedure [dbo].[sp_ShowCoursesWithSpace]    Script Date: 27-03-2019 11:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Author:		Kalyani Gaikwad
-- Create date: 27 MAR 2019
-- Description: Show how many courses still have the space
-- exec sp_ShowCoursesWithSpace
-- ====================================================
CREATE PROCEDURE [dbo].[sp_ShowCoursesWithSpace]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	WITH RESULT AS
	(
	SELECT Course.CourseID,Course.CourseName,COUNT(Registration.StudentID) AS StudentCount
    FROM [dbo].[tbl_Course] Course 
	INNER JOIN [dbo].[tbl_CourseRegistration] Registration ON Registration.CourseID=Course.CourseID	
    GROUP BY Course.CourseID,course.coursename
	)
	SELECT CourseID,CourseName, StudentCount FROM RESULT WHERE StudentCount<5;

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ShowRegisterCoursesForEachStudent]    Script Date: 27-03-2019 11:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Author:		Kalyani Gaikwad
-- Create date: 27 MAR 2019
-- Description: Show registered courses for each student
-- exec sp_ShowRegisterCoursesForEachStudent
-- ====================================================
CREATE PROCEDURE [dbo].[sp_ShowRegisterCoursesForEachStudent]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT CourseCode,CourseName,StartDate,EndDate
	FROM [dbo].[tbl_Course] Course
    INNER JOIN [dbo].[tbl_CourseRegistration] Registration ON Course.CourseID=Registration.CourseID
	GROUP BY CourseCode,CourseName,StartDate,EndDate
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ShowStudentListForEachCourse]    Script Date: 27-03-2019 11:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Author:		Kalyani Gaikwad
-- Create date: 27 MAR 2019
-- Description: Show student list for each courses
-- exec sp_ShowStudentListForEachCourse
-- ====================================================
CREATE PROCEDURE [dbo].[sp_ShowStudentListForEachCourse]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT Student.StudentID,FirstName,Surname,CourseCode,CourseName,StartDate,EndDate
	FROM [dbo].[tbl_Student] Student 
    INNER JOIN [dbo].[tbl_CourseRegistration] Registration ON Registration.StudentID=Student.StudentID 
	INNER JOIN [dbo].[tbl_Course] Course ON Registration.CourseID=Course.CourseID

END

GO
/****** Object:  StoredProcedure [dbo].[sp_ShowStudentNotRegisterForMaximumCourse]    Script Date: 27-03-2019 11:07:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- Author:		Kalyani Gaikwad
-- Create date: 27 MAR 2019
-- Description: Show how many students didn’t register max course
-- exec sp_ShowStudentNotRegisterForMaximumCourse
-- ====================================================
CREATE PROCEDURE [dbo].[sp_ShowStudentNotRegisterForMaximumCourse]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
	WITH RESULT AS
	(
	SELECT Student.StudentID,FirstName,Surname,COUNT(Registration.CourseID) AS CourseCount
    FROM [dbo].[tbl_Student] Student
	INNER JOIN [dbo].[tbl_CourseRegistration] Registration ON Registration.StudentID=Student.StudentID 
    GROUP BY Student.StudentID,FirstName,Surname
	)
	SELECT StudentID,FirstName,Surname,CourseCount FROM RESULT WHERE CourseCount<5;


END

GO
