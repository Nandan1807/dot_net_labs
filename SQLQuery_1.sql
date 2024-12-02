-- CREATE DATABASE ProcedureLab

-- CREATE TABLE Country(
--     CountryId INT IDENTITY(1,1) PRIMARY KEY, 
--     CountryName VARCHAR(50),
--     CountryCode int
-- )




CREATE PROC dbo.PR_COUNRTY_INSERT
@CountryName VARCHAR(50),
@CountryCode INT
AS
BEGIN
    INSERT INTO DBO.Country
    (
        CountryName,
        CountryCode
    )
    VALUES
    (
        @CountryName,
        @CountryCode
    )
END

EXEC PR_COUNRTY_INSERT 'INDIA',91

CREATE PROC dbo.PR_COUNRTY_UPDATE
@CountryId INT,
@CountryName VARCHAR(50),
@CountryCode INT
AS
BEGIN
    UPDATE DBO.Country
    SET 
        CountryName =  @CountryName,
        CountryCode =  @CountryCode
    WHERE
        CountryId = @CountryId
END

EXEC PR_COUNRTY_UPDATE 1,'Bharat',91

CREATE PROC dbo.PR_COUNRTY_DELETE
@CountryId INT
AS
BEGIN
    DELETE FROM DBO.Country
    WHERE CountryId = @CountryId
END

EXEC PR_COUNRTY_DELETE 2

CREATE PROC dbo.PR_COUNRTY_SELECT_ALL
AS
BEGIN
    SELECT COUNTRYID,COUNTRYNAME,COUNTRYCODE FROM dbo.COUNTRY
END

EXEC PR_COUNRTY_SELECT_ALL

CREATE PROC dbo.PR_COUNRTY_SELECT_BY_ID
@CountryId INT
AS
BEGIN
    SELECT COUNTRYID,COUNTRYNAME,COUNTRYCODE FROM dbo.COUNTRY
    WHERE COUNTRYID = @CountryId
END

EXEC PR_COUNRTY_SELECT_BY_ID 1

------------------------------------------------------------------------------------
--CREATE TABLE State(
--     StateId INT IDENTITY(1,1) PRIMARY KEY, 
--     StateName VARCHAR(50),
--     StateCode INT,
--     CountryId INT FOREIGN KEY REFERENCES Country(CountryId)
-- )

CREATE PROC dbo.PR_STATE_INSERT
@StateName VARCHAR(50),
@StateCode INT,
@CountryId INT
AS
BEGIN
    INSERT INTO DBO.State
    (
        StateName,
        StateCode,
        CountryId
    )
    VALUES
    (
        @StateName,
        @StateCode,
        @CountryId
    )
END

EXEC PR_STATE_INSERT 'GUJRAT',20,1

CREATE PROC dbo.PR_STATE_UPDATE
@StateId INT,
@StateName VARCHAR(50),
@StateCode INT,
@CountryId INT
AS
BEGIN
    UPDATE DBO.State
    SET 
        StateName =  @StateName,
        StateCode =  @StateCode,
        CountryId = @CountryId
    WHERE
        StateId = @StateId
END

EXEC PR_STATE_UPDATE 1,'GUJRAT STATE',20,1

CREATE PROC dbo.PR_STATE_DELETE
@StateId INT
AS
BEGIN
    DELETE FROM DBO.STATE
    WHERE StateId = @StateId
END

EXEC PR_STATE_DELETE 1

CREATE PROC dbo.PR_STATE_SELECT_ALL
AS
BEGIN
    SELECT STATEID,STATENAME,STATECODE,COUNTRYID FROM dbo.STATE
END

EXEC PR_STATE_SELECT_ALL

CREATE PROC dbo.PR_STATE_SELECT_BY_ID
@STATEId INT
AS
BEGIN
    SELECT STATEID,STATENAME,STATECODE,COUNTRYID FROM dbo.STATE
    WHERE STATEId = @STATEId
END

EXEC PR_STATE_SELECT_BY_ID 1

CREATE PROC DBO.PR_SELECT_STATE_BY_COUNTRY_ID 
@COUNTRYId INT
AS
BEGIN
    SELECT C.COUNTRYID,C.COUNTRYNAME,C.COUNTRYCODE,S.STATEID,S.STATENAME,S.STATECODE
    FROM DBO.COUNTRY C
    INNER JOIN DBO.STATE S 
    ON C.COUNTRYID = S.COUNTRYID
    WHERE C.COUNTRYID = @COUNTRYId
    ORDER BY C.COUNTRYNAME
END

EXEC PR_SELECT_STATE_BY_COUNTRY_ID 1

CREATE PROC DBO.PR_SELECT_COUNTRY_BY_STATE_ID 
@STATEId INT
AS
BEGIN
    SELECT C.COUNTRYID,C.COUNTRYNAME,C.COUNTRYCODE,S.STATEID,S.STATENAME,S.STATECODE
    FROM DBO.COUNTRY C
    INNER JOIN DBO.STATE S 
    ON C.COUNTRYID = S.COUNTRYID
    WHERE S.STATEId = @STATEId
    ORDER BY S.STATENAME
END

EXEC PR_SELECT_COUNTRY_BY_STATE_ID 1


------------------------------------------------------------------------------------

CREATE TABLE City(
    CityId INT IDENTITY(1,1) PRIMARY KEY, 
    CityName VARCHAR(50),
    CityCode INT,
    StateId INT FOREIGN KEY REFERENCES State(StateId)
)

CREATE PROC dbo.PR_City_INSERT
@CityName VARCHAR(50),
@CityCode INT,
@StateId INT
AS
BEGIN
    INSERT INTO DBO.City
    (
        CityName,
        CityCode,
        StateId
    )
    VALUES
    (
        @CityName,
        @CityCode,
        @StateId
    )
END

CREATE PROC dbo.PR_CITY_UPDATE
@CityId INT,
@CityName VARCHAR(50),
@CityCode INT,
@StateId INT
AS
BEGIN
    UPDATE DBO.City
    SET 
        CityName =  @CityName,
        CityCode =  @CityCode,
        StateId = @StateId
    WHERE
        CityId = @CityId
END

CREATE PROC dbo.PR_City_DELETE
@CityId INT
AS
BEGIN
    DELETE FROM DBO.City
    WHERE CityId = @CityId
END

CREATE PROC dbo.PR_CITY_SELECT_ALL
AS
BEGIN
    SELECT * FROM dbo.City
END


CREATE PROC dbo.PR_City_SELECT_BY_ID
@CityId INT
AS
BEGIN
    SELECT * FROM dbo.City
    WHERE CityId = @CityId
END


CREATE PROC DBO.PR_SELECT_City_Join_Select_All
AS
BEGIN
    SELECT *
    FROM DBO.City C
    INNER JOIN DBO.STATE S 
    ON C.StateId = S.StateId
    INNER JOIN DBO.Country Co
    ON Co.CountryId = S.CountryId
END

CREATE PROC DBO.PR_SELECT_City_Join_Select_By_Id
@CityId INT
AS
BEGIN
    SELECT *
    FROM DBO.City C
    INNER JOIN DBO.STATE S 
    ON C.StateId = S.StateId
    INNER JOIN DBO.Country Co
    ON Co.CountryId = S.CountryId
    WHERE CityId = @CityId
END

------------------------------------------------------------------------------------

CREATE TABLE Department(
    Department_Id INT IDENTITY(1,1) PRIMARY KEY, 
    Department_Name VARCHAR(50),
    Department_Code INT,
    Created DATETIME DEFAULT GETDATE(),
    Modified DATETIME DEFAULT GETDATE()
)

CREATE PROC dbo.PR_Department_INSERT
@Department_Name VARCHAR(50),
@Department_Code INT
AS
BEGIN
    INSERT INTO DBO.Department
    (
        Department_Name,
        Department_Code
    )
    VALUES
    (
        @Department_Name,
        @Department_Code
    )
END

Create PROC dbo.PR_Department_UPDATE
@Department_Id INT,
@Department_Name VARCHAR(50),
@Department_Code INT
AS
BEGIN
    UPDATE DBO.Department
    SET 
        Department_Name = @Department_Name,
        Department_Code = @Department_Code,
        Modified = GETDATE()
    WHERE
        Department_Id = @Department_Id
END

CREATE PROC dbo.PR_Department_DELETE
@Department_Id INT
AS
BEGIN
    DELETE FROM DBO.Department
    WHERE Department_Id = @Department_Id
END

CREATE PROC dbo.PR_Department_SELECT_ALL
AS
BEGIN
    SELECT * FROM dbo.Department
END


CREATE PROC dbo.PR_Department_SELECT_BY_ID
@Department_Id INT
AS
BEGIN
    SELECT * FROM dbo.Department
    WHERE Department_Id = @Department_Id
END

------------------------------------------------------------------------------------

CREATE TABLE Designation(
    Designation_Id INT IDENTITY(1,1) PRIMARY KEY, 
    Designation_Name VARCHAR(50),
    Designation_Code INT,
    Created DATETIME DEFAULT GETDATE(),
    Modified DATETIME DEFAULT GETDATE()
)

CREATE PROC dbo.PR_Designation_INSERT
@Designation_Name VARCHAR(50),
@Designation_Code INT
AS
BEGIN
    INSERT INTO DBO.Designation
    (
        Designation_Name,
        Designation_Code
    )
    VALUES
    (
        @Designation_Name,
        @Designation_Code
    )
END

Create PROC dbo.PR_Designation_UPDATE
@Designation_Id INT,
@Designation_Name VARCHAR(50),
@Designation_Code INT
AS
BEGIN
    UPDATE DBO.Designation
    SET 
        Designation_Name = @Designation_Name,
        Designation_Code = @Designation_Code,
        Modified = GETDATE()
    WHERE
        Designation_Id = @Designation_Id
END

CREATE PROC dbo.PR_Designation_DELETE
@Designation_Id INT
AS
BEGIN
    DELETE FROM DBO.Designation
    WHERE Designation_Id = @Designation_Id
END

CREATE PROC dbo.PR_Designation_SELECT_ALL
AS
BEGIN
    SELECT * FROM dbo.Designation
END


CREATE PROC dbo.PR_Designation_SELECT_BY_ID
@Designation_Id INT
AS
BEGIN
    SELECT * FROM dbo.Designation
    WHERE Designation_Id = @Designation_Id
END

------------------------------------------------------------------------------------

CREATE TABLE Employee(
    Employee_Id INT IDENTITY(1,1) PRIMARY KEY, 
    Employee_Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(18,0),
    Address VARCHAR(100),
    Email VARCHAR(50),
    ContactNumber DECIMAL(10,0),
    JoiningDate DATETIME DEFAULT GETDATE(),
    CityId INT FOREIGN KEY REFERENCES City(CityId),
    Department_Id INT FOREIGN KEY REFERENCES Department(Department_Id),
    Designation_Id INT FOREIGN KEY REFERENCES Designation(Designation_Id),
)

CREATE PROC PR_EMPLOYEE_INSERT
@Employee_Name VARCHAR(50),
@Age INT,
@Salary DECIMAL(18,0),
@Address VARCHAR(100),
@Email VARCHAR(50),
@ContactNumber DECIMAL(10,0),
@CityId INT,
@Department_Id INT,
@Designation_Id INT
AS
BEGIN
    INSERT INTO EMPLOYEE
    (
        Employee_Name,
        Age,
        Salary,
        Address,
        Email,
        ContactNumber,
        CityId,
        Department_Id ,
        Designation_Id
    )
    VALUES
    (
        @Employee_Name,
        @Age,
        @Salary,
        @Address,
        @Email,
        @ContactNumber,
        @CityId,
        @Department_Id ,
        @Designation_Id 
    )
END

CREATE proc PR_EMPLOYEE_UPDATE
@Employee_Id INT,
@Employee_Name VARCHAR(50),
@Age INT,
@Salary DECIMAL(18,0),
@Address VARCHAR(100),
@Email VARCHAR(50),
@ContactNumber DECIMAL(10,0),
@CityId INT,
@Department_Id INT,
@Designation_Id INT
AS
BEGIN
    UPDATE EMPLOYEE
    SET
        Employee_Name = @Employee_Name,
        Age = @Age,
        Salary = @Salary,
        Address = @Address,
        Email = @Email,
        ContactNumber = @ContactNumber,
        CityId = @CityId,
        Department_Id = @Department_Id,
        Designation_Id = @Designation_Id
    WHERE Employee_Id = @Employee_Id;
END

CREATE PROC PR_EMPLOYEE_DELETE
@Employee_Id INT
AS
BEGIN
    DELETE FROM Employee
    WHERE Employee_Id = @Employee_Id
END

CREATE PROC PR_EMPLOYEE_SELECT_BY_ID
@Employee_Id INT
AS
BEGIN
    SELECT * FROM Employee
    WHERE Employee_Id = @Employee_Id
END

CREATE PROC PR_EMPLOYEE_SELECT_ALL
AS
BEGIN
    SELECT * FROM Employee
END

CREATE PROC PR_EMPLOYEE_SELECT_ALL_JOIN
AS
BEGIN
    SELECT * FROM Employee E
    INNER JOIN Department DP ON E.Department_Id = DP.Department_Id
    INNER JOIN Designation DS ON E.Designation_Id = E.Designation_Id
END

CREATE PROC PR_EMPLOYEE_SELECT_BY_ID_JOIN
@Employee_Id INT
AS
BEGIN
    SELECT * FROM Employee E
    INNER JOIN Department DP ON E.Department_Id = DP.Department_Id
    INNER JOIN Designation DS ON E.Designation_Id = E.Designation_Id
    WHERE Employee_Id = @Employee_Id
END