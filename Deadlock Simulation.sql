--First we create our demo tables
CREATE TABLE Empleados (
    EmpId INT IDENTITY,
    EmpNombre VARCHAR(16),
    Telefono VARCHAR(16)
)
GO

INSERT INTO Empleados (EmpNombre, Telefono)
VALUES ('Maria', '555-1212'), ('Claudia', '555-8080')
GO

CREATE TABLE Proveedor(
    ProveedorId INT IDENTITY,
    ProvNombre VARCHAR(64),
    Fax VARCHAR(16)
)
GO

INSERT INTO Proveedor (ProvNombre, Fax)
VALUES ('Basa', '555-6060'), ('Metro', '257-1234')
GO

--Run this in query window #1
--First run this part, then run step two
BEGIN TRAN;                
select @@SPID
UPDATE Empleados
SET EmpNombre = 'Mary'
WHERE EmpId = 1
--Step three, then run step four
UPDATE Proveedor
SET Fax = N'555-1212'
WHERE ProveedorId = 1

--Run this in query window #2
--Step two, then run step three
BEGIN TRAN;
select @@SPID
UPDATE Proveedor
SET Fax = N'555-1212'
WHERE ProveedorId = 1
--Step four. After a few seconds, you will see a deadlock victim message
UPDATE Empleados
SET Telefono = N'555-9999'
WHERE EmpId = 1