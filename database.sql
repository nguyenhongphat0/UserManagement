CREATE DATABASE UserManagement
USE UserManagement

CREATE TABLE Roles(
    RoleID INT NOT NULL PRIMARY KEY,
    RoleName VARCHAR(100)
)

CREATE TABLE Users(
    Username VARCHAR(100) NOT NULL PRIMARY KEY,
    Password VARCHAR(100) NOT NULL,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    SendNotification BIT,
    RoleID int foreign KEY references Roles(RoleID)
)

