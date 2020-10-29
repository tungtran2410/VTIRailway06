create database VTIhomework_no1;

use VTIhomework_no1;
create table Department(
DepartmentID		varchar(50),
DepartmentName		varchar(50)
);

create table Positions(
PositionsID		varchar(50),
PositionsName	varchar(50)
);

create table Account(
AccountID		varchar(50),
Email			varchar(50),
Username		varchar(50),
Fullname		varchar(50),
DepartmentID	varchar(50),
PositionID		varchar(50),
CreateDate		date
);

create table Group1(
GroupID			varchar(50),
GroupName		varchar(50),
CreatorID		varchar(50),
CreateDate		date
);

create table GroupsAccount(
GroupID			varchar(50),
AccountID		varchar(50),
JoinDate		date
);

create table TypeQuestion(
TypeID			varchar(50),
TypeName		varchar(50)
);

create table CategoryQuestion(
CategoryID			varchar(50),
CategoryName		varchar(50)
);

create table Question(
QuestionID			varchar(50),
Content				varchar(50),
CategoryID			varchar(50),
CreatorID			varchar(50),
CreateDate			date
);

create table Answer(
AnswerID			varchar(50),
Content				varchar(50),
QuestionID			varchar(50),
IsCorrect			varchar(50)
);

create table Exam(
ExamID				varchar(50),
Code				varchar(50),
Title				varchar(50),
CategoryID			varchar(50),
Duration			time
);


create table ExamQuestion(
ExamID				varchar(50),
QuestionID			varchar(50)
);

