DROP VIEW IF EXISTS dbo.BORROW_WITH_EMPLOYEE;
GO
CREATE VIEW BORROW_WITH_EMPLOYEE AS
SELECT person.email, borrow.date_of_borrow, borrow.date_of_return
from dbo.Borrow borrow
inner join dbo.Employee employee on employee.EMPLOYEE_ID = borrow.EMPLOYEE_ID
inner join dbo.Person person on employee.PERSON_ID = person.PERSON_ID;