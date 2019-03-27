/****** Object:  StoredProcedure [dbo].[sp_ShowStudentNotRegisterForMaximumCourse]    Script Date: 27-03-2019 10:42:59 AM ******/
DROP PROCEDURE [dbo].[sp_ShowStudentNotRegisterForMaximumCourse]
GO

/****** Object:  StoredProcedure [dbo].[sp_ShowStudentNotRegisterForMaximumCourse]    Script Date: 27-03-2019 10:42:59 AM ******/
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


