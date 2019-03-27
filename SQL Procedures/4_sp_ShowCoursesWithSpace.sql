GO

/****** Object:  StoredProcedure [dbo].[sp_ShowCoursesWithSpace]    Script Date: 27-03-2019 10:41:40 AM ******/
DROP PROCEDURE [dbo].[sp_ShowCoursesWithSpace]
GO

/****** Object:  StoredProcedure [dbo].[sp_ShowCoursesWithSpace]    Script Date: 27-03-2019 10:41:40 AM ******/
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


