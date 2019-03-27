/****** Object:  StoredProcedure [dbo].[sp_ShowRegisterCoursesForEachStudent]    Script Date: 27-03-2019 10:42:48 AM ******/
DROP PROCEDURE [dbo].[sp_ShowRegisterCoursesForEachStudent]
GO

/****** Object:  StoredProcedure [dbo].[sp_ShowRegisterCoursesForEachStudent]    Script Date: 27-03-2019 10:42:48 AM ******/
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


