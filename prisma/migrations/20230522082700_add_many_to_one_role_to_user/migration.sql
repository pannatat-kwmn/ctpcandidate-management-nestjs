/*
  Warnings:

  - Added the required column `permissionId` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Users] ADD [permissionId] UNIQUEIDENTIFIER NOT NULL;

-- AddForeignKey
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [Users_permissionId_fkey] FOREIGN KEY ([permissionId]) REFERENCES [dbo].[rolePermissions]([roleId]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
