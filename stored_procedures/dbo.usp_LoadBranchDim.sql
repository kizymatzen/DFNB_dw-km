USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[LoadBranchDim]    Script Date: 4/2/2021 12:32:07 PM ******/
DROP PROCEDURE [dbo].[LoadBranchDim]
GO

/****** Object:  StoredProcedure [dbo].[LoadBranchDim]    Script Date: 4/2/2021 12:32:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadBranchDim]
AS

/*****************************************************************************************************************
NAME:   dbo.usp_LoadBranchDim
PURPOSE: Create and Load dbo.tblAccountDim procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/02/2021   KMATZEN       1. Built this table for LDS BC IT243



RUNTIME: 
Approx. 1 sec

NOTES: 



LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 

Example usage...

EXEC dbo.usp_LoadBranchDim
   
******************************************************************************************************************/
BEGIN

TRUNCATE TABLE dbo.tblBranchDim;

INSERT INTO dbo.tblBranchDim
SELECT DISTINCT 
       s.acct_branch_id AS branch_id
     , s.acct_branch_code AS branch_code
     , s.acct_branch_desc AS branch_desc
     , s.acct_branch_add_id AS branch_add_id
     , s.acct_region_id AS region_id
     , s.acct_area_id AS area_id
  FROM dbo.stg_p1 AS s
 ORDER BY 1;

   END;


GO


