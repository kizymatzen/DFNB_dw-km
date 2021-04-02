USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountCustomerRoleDim]    Script Date: 4/2/2021 11:50:52 AM ******/
DROP PROCEDURE [dbo].[usp_LoadAccountCustomerRoleDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadAccountCustomerRoleDim]    Script Date: 4/2/2021 11:50:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_LoadAccountCustomerRoleDim] 
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadAccountCustomerRoleDim 
PURPOSE: Create and Load the dbo.usp_LoadAccountCustomerRoleDim procedure

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

EXEC dbo.usp_LoadAccountCustomerRoleDim 
   
******************************************************************************************************************/
TRUNCATE TABLE dbo.tblAccountCustomerRoleDim;

INSERT INTO dbo.tblAccountCustomerRoleDim
SELECT DISTINCT 
       s.acct_cust_role_id
     , CASE
           WHEN s.acct_cust_role_id = 1
           THEN 'Primary'
           WHEN s.acct_cust_role_id = 2
           THEN 'Secondary'
           ELSE 'Unknown'
       END AS acct_cust_role_desc
  FROM dbo.stg_p1 AS s
 ORDER BY 1
        , 2;
GO

