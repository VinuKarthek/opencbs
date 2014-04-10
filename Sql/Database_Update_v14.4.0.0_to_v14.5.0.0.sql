INSERT INTO [GeneralParameters]([key], [value]) VALUES('NUMBER_GROUP_SEPARATOR', ' ')
INSERT INTO [GeneralParameters]([key], [value]) VALUES('NUMBER_DECIMAL_SEPARATOR', ',')
GO

ALTER TABLE Packages
ADD script_name NVARCHAR(255) NULL
GO

IF  NOT EXISTS(SELECT *  FROM  INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'WriteOffEvents'  AND COLUMN_NAME = 'comment') 
BEGIN
ALTER TABLE  WriteOffEvents ADD  comment NVARCHAR(255) 
END
GO

IF  NOT EXISTS(SELECT *  FROM  INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'WriteOffOptions') 
BEGIN
CREATE TABLE WriteOffOptions
(
Id INT IDENTITY(1,1),
Name NVARCHAR(255)
)
END
GO

INSERT INTO dbo.WriteOffOptions VALUES('Standard')
GO

UPDATE  [TechnicalParameters]
SET     [value] = 'v14.5.0.0'
WHERE   [name] = 'VERSION'
GO