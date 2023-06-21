/*
  Warnings:

  - Added the required column `createAt` to the `Projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `createBy` to the `Projects` table without a default value. This is not possible if the table is not empty.
  - Added the required column `projectStatus` to the `Projects` table without a default value. This is not possible if the table is not empty.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Projects] ADD [createAt] DATETIME NOT NULL,
[createBy] NVARCHAR(100) NOT NULL,
[editAt] DATETIME,
[editBy] NVARCHAR(100),
[projectStatus] NVARCHAR(50) NOT NULL;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
