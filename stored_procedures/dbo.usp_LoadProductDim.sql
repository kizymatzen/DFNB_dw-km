USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDim]    Script Date: 4/2/2021 12:51:11 PM ******/
DROP PROCEDURE [dbo].[usp_LoadProductDim]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadProductDim]    Script Date: 4/2/2021 12:51:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadProductDim]
AS

/*****************************************************************************************************************
NAME:   dbo.usp_LoadProductDim
PURPOSE: Create and Load dbo.usp_LoadProductDim procedure

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

EXEC dbo.usp_LoadProductDim
   
******************************************************************************************************************/
BEGIN

TRUNCATE TABLE dbo.tblProductDim;

INSERT INTO dbo.tblProductDim
SELECT DISTINCT 
       s.prod_id
     , 'Unknown' AS prod_desc
  FROM dbo.stg_p1 AS s
 ORDER BY 1;

   END;


GO