/*
  Warnings:

  - You are about to alter the column `userName` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `NVarChar(100)` to `NVarChar(50)`.
  - You are about to alter the column `userEmail` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `NVarChar(1000)` to `NVarChar(128)`.
  - A unique constraint covering the columns `[userName]` on the table `Users` will be added. If there are existing duplicate values, this will fail.

*/
BEGIN TRY

BEGIN TRAN;

-- DropIndex
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [Users_userEmail_key];

-- AlterTable
ALTER TABLE [dbo].[Users] ALTER COLUMN [userName] NVARCHAR(50) NOT NULL;
ALTER TABLE [dbo].[Users] ALTER COLUMN [userPassword] NVARCHAR(256) NOT NULL;
ALTER TABLE [dbo].[Users] ALTER COLUMN [userEmail] NVARCHAR(128) NOT NULL;

-- CreateIndex
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [Users_userEmail_key] UNIQUE NONCLUSTERED ([userEmail]);

-- CreateIndex
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [Users_userName_key] UNIQUE NONCLUSTERED ([userName]);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
