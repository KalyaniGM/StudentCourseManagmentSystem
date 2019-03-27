/****** Object:  StoredProcedure [dbo].[sp_ShowStudentListForEachCourse]    Script Date: 27-03-2019 10:42:53 AM ******/
DROP PROCEDURE [dbo].[sp_ShowStudentListForEachCourse]
GO

/****** Object:  StoredProcedure [dbo].[sp_ShowStudentListForEachCourse]    Script Date: 27-03-2019 10:42:53 AM ******/
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


