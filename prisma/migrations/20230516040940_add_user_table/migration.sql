BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Users] (
    [userId] UNIQUEIDENTIFIER NOT NULL,
    [userName] NVARCHAR(100) NOT NULL,
    [userPassword] NVARCHAR(100) NOT NULL,
    [userEmail] NVARCHAR(1000) NOT NULL,
    [profileFirstName] NVARCHAR(100) NOT NULL,
    [profileLastName] NVARCHAR(100) NOT NULL,
    [profileImage] NVARCHAR(max) NOT NULL,
    [userRole] NVARCHAR(100) NOT NULL,
    [createBy] NVARCHAR(100) NOT NULL,
    [createAt] DATETIME NOT NULL,
    [editBy] NVARCHAR(100),
    [editAt] DATETIME,
    [deleteAt] DATETIME,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([userId]),
    CONSTRAINT [Users_userEmail_key] UNIQUE NONCLUSTERED ([userEmail])
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
