/*
  Warnings:

  - You are about to drop the column `userRole` on the `Users` table. All the data in the column will be lost.

*/
BEGIN TRY

BEGIN TRAN;

-- AlterTable
ALTER TABLE [dbo].[Users] ALTER COLUMN [profileImage] NVARCHAR(max) NULL;
ALTER TABLE [dbo].[Users] DROP COLUMN [userRole];

-- CreateTable
CREATE TABLE [dbo].[rolePermissions] (
    [roleId] UNIQUEIDENTIFIER NOT NULL,
    [roleName] NVARCHAR(1000) NOT NULL,
    [canView] BIT NOT NULL,
    [canEdit] BIT NOT NULL,
    [canDelete] BIT NOT NULL,
    [canCreate] BIT NOT NULL,
    [createAt] DATETIME NOT NULL,
    [updateAt] DATETIME,
    CONSTRAINT [PK_PermissionLevel] PRIMARY KEY CLUSTERED ([roleId]),
    CONSTRAINT [rolePermissions_roleName_key] UNIQUE NONCLUSTERED ([roleName])
);

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
