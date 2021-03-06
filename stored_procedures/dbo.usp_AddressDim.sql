USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAddressDim]    Script Date: 4/2/2021 1:11:04 PM ******/
DROP PROCEDURE [dbo].[usp_LoadAddressDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAddressDim]    Script Date: 4/2/2021 1:11:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadAddressDim]
AS

/*****************************************************************************************************************
NAME:   dbo.usp_AddressDim
PURPOSE: Create and Load dbo.usp_LoadAddressDim procedure

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

EXEC dbo.usp_LoadAddressDim
   
******************************************************************************************************************/
BEGIN

TRUNCATE TABLE dbo.tblAddressDim;

INSERT INTO dbo.tblAddressDim
SELECT s.acct_branch_add_id AS add_id
     , s.acct_branch_add_lat AS add_lat
     , s.acct_branch_add_lon AS add_lon
     , s.acct_branch_add_type AS add_type
  FROM dbo.stg_p1 AS s
UNION
SELECT s.cust_add_id AS add_id
     , s.cust_add_lat AS add_lat
     , s.cust_add_lon AS add_lon
     , s.cust_add_type AS add_type
  FROM dbo.stg_p1 AS s;

   END;


GO

