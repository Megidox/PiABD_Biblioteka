DROP INDEX IF EXISTS Author.person_Name
GO
CREATE INDEX person_Name
ON Author (LAST_NAME, FIRST_NAME)
GO

DROP INDEX IF EXISTS Category.categoryName
GO
CREATE INDEX categoryName
ON Category (NAME)
GO

DROP INDEX IF EXISTS Address.addressTelNumber
GO
CREATE INDEX addressTelNumber
ON Address (TEL_NUMBER)
GO