BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[Candidates] (
    [candidateId] UNIQUEIDENTIFIER NOT NULL,
    [email] NVARCHAR(1000) NOT NULL,
    [firstName] NVARCHAR(50) NOT NULL,
    [lastName] NVARCHAR(50) NOT NULL,
    [birthDate] DATE,
    [minSalary] DECIMAL(18,2),
    [maxSalary] DECIMAL(18,2),
    [workExperience] NVARCHAR(50),
    [phoneNumber] NVARCHAR(max) NOT NULL,
    [candidateAddress] NTEXT,
    [candidateImage] NVARCHAR(256),
    [candidateJob] NVARCHAR(100) NOT NULL,
    [jobCategory] NVARCHAR(100) NOT NULL,
    [status] NVARCHAR(50),
    [createBy] NVARCHAR(100) NOT NULL,
    [createAt] DATETIME NOT NULL,
    [editBy] NVARCHAR(100),
    [editAt] DATETIME,
    [deleteAt] DATETIME,
    CONSTRAINT [PK_Candidates] PRIMARY KEY CLUSTERED ([candidateId]),
    CONSTRAINT [Candidates_Email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[Projects] (
    [projectId] UNIQUEIDENTIFIER NOT NULL,
    [projectName] NVARCHAR(100) NOT NULL,
    [projectDescription] NVARCHAR(500) NOT NULL,
    CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED ([projectId])
);

-- CreateTable
CREATE TABLE [dbo].[_ProjectCandidate] (
    [candidateId] UNIQUEIDENTIFIER NOT NULL,
    [projectId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [_ProjectCandidate_AB_unique] UNIQUE NONCLUSTERED ([candidateId],[projectId])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [_ProjectCandidate_B_index] ON [dbo].[_ProjectCandidate]([projectId]);

-- AddForeignKey
ALTER TABLE [dbo].[_ProjectCandidate] ADD CONSTRAINT [_ProjectCandidate_A_fkey] FOREIGN KEY ([candidateId]) REFERENCES [dbo].[Candidates]([candidateId]) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[_ProjectCandidate] ADD CONSTRAINT [_ProjectCandidate_B_fkey] FOREIGN KEY ([projectId]) REFERENCES [dbo].[Projects]([projectId]) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH

