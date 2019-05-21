DROP VIEW IF EXISTS dbo.PERSON_WITH_ADDRESS;
GO
CREATE VIEW PERSON_WITH_ADDRESS AS
SELECT person.EMAIL, person.LOGIN,
	address.FIRST_NAME, address.LAST_NAME, address.STREET, address.CITY, address.ZIP_CODE, address.COUNTRY, address.TEL_NUMBER
FROM dbo.Person person
INNER JOIN dbo.Address address on person.PERSON_ID = address.PERSON_ID;