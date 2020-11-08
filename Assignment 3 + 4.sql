
DROP DATABASE IF EXISTS TestingSystem3;
CREATE DATABASE TestingSystem3;
USE TestingSystem3;


DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
          DepartmentID        TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          DepartmentName 	NVARCHAR(30) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
          PositionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          PositionName		NVARCHAR(50) NULL UNIQUE KEY
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
          AccountID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          Email			VARCHAR(50) NOT NULL UNIQUE KEY,
          Username			VARCHAR(50) NOT NULL UNIQUE KEY,
          FullName			NVARCHAR(50) NOT NULL,
          DepartmentID 		TINYINT UNSIGNED NOT NULL,
          PositionID		TINYINT UNSIGNED NOT NULL,
          CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);


DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
          GroupID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          GroupName			NVARCHAR(50) NOT NULL UNIQUE KEY,
          CreatorID			TINYINT UNSIGNED NOT NULL,
          CreateDate		DATETIME DEFAULT NOW()
);


DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
          GroupID			TINYINT UNSIGNED NOT NULL,
          AccountID			TINYINT UNSIGNED NOT NULL,
          JoinDate			DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
          TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          TypeName 		     ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
          CategoryID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          CategoryName		NVARCHAR(50) NOT NULL UNIQUE KEY
);


DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
          QuestionID		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          Content			NVARCHAR(100) NOT NULL,
          CategoryID		TINYINT UNSIGNED NOT NULL,
          TypeID			TINYINT UNSIGNED NOT NULL,
          CreatorID			TINYINT UNSIGNED NOT NULL UNIQUE KEY,
          CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId)
);


DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
          Answers			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          Content			NVARCHAR(100) NOT NULL,
          QuestionID		TINYINT UNSIGNED NOT NULL,
          isCorrect			BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);


DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
          ExamID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          `Code`			CHAR(10) NOT NULL,
          Title			NVARCHAR(50) NOT NULL,
          CategoryID		TINYINT UNSIGNED NOT NULL,
          Duration			TINYINT UNSIGNED NOT NULL,
          CreatorID			TINYINT UNSIGNED NOT NULL,
          CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountId)
);


DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
          ExamID			TINYINT UNSIGNED NOT NULL,
          QuestionID		TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    PRIMARY KEY (ExamID,QuestionID)
);


INSERT INTO Department(DepartmentName) 
VALUES
						(N'Marketing'),
						(N'Sale'),
						(N'Bao ve'),
						(N'Nhan su'),
						(N'Ky thuat'),
						(N'Tai chinh'),
						(N'Ban giam doc'),
						(N'Hoi dong quan tri'),
						(N'Thu ki'),
						(N'Hanh chinh'),
						(N'To chuc');
    
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'),
						('Test'),
						('Scrum Master'),
						('Manager'),
						('Present'),
						('Sides'),
						('Officer'),
						('PM'); 


INSERT INTO `Account`(Email                       ,Username           , FullName               , DepartmentID      , PositionID   , CreateDate)
VALUES 		('haidang29productions@gmail.com'	, 'dangblack'		,'Nguyen Hai Dang'		,   '5'			,   '1'		,'2020-03-05'),
               ('account1@gmail.com'			, 'quanganh'		,'Tong Quang Anh'		,   '1'			,   '2'		,'2020-03-05'),
               ('account2@gmail.com'			, 'vanchien'		,'Nguyen Van Chien'		,   '1'			,   '3'		,'2020-03-07'),
               ('account3@gmail.com'			, 'cocoduongqua'	,'Duong Do'			,   '2'			,   '4'		,'2020-03-08'),
               ('account4@gmail.com'			, 'doccocaubai'	,'Nguyen Chien Thang'	,   '2'			,   '4'		,'2020-03-10'),
               ('dapphatchetngay@gmail.com'		, 'khabanh'		,'Ngo Ba Kha'			,   '8'			,   '3'		,'2020-04-05'),
               ('songcodaoly@gmail.com'			, 'huanhoahong'	,'Bui Xuan Huan'		,   '7'			,   '2'		,'2020-04-05'),
               ('sontungmtp@gmail.com'			, 'tungnui'		,'Nguyen Thanh Tung'	,   '6'			,   '1'		,'2020-06-07'),
               ('duongghuu@gmail.com'			, 'duongghuu'		,'Duong Van Huu'		,   '4'			,   '2'		,'2020-07-07'),
               ('phuongnguyen@gmail.com'		, 'phuongnguyen'	,'Nguyen Thi Phuong'	,   '9'			,   '5'		,'2020-05-07'),
               ('duonggtran@gmail.com'			, 'duonggtran'		,'Tran Van Duong'		,   '6'			,   '6'		,'2020-09-07'),
               ('baovu@gmail.com'	     		, 'baovu' 		,'Vu Van Bao'  		,   '4'			,   '7'		,'2020-01-07'),
               ('thienvuong@gmail.com'			, 'thienvuong'		,'Thien Vuong'		     ,   '3'			,   '6'		,'2020-03-07'),
               ('thieulam@gmail.com'			, 'thieulam'		,'Thieu Lam'		     ,   '7'			,   '2'		,'2020-02-07'),
               ('caibang@gmail.com'			, 'caibang'		,'Cai Bang'	     	,   '5'			,   '6'		,'2020-07-07'),
               ('ngamy@gmail.com'			     , 'ngamy'	     	,'Nga My'		          ,   '7'			,   '2'		,'2020-10-07'),
               ('duongmon@gmail.com'			, 'duongmon'		,'Duong Mon'		     ,   '7'			,   '2'		,'2020-11-07'),
               ('vtiaccademy@gmail.com'			, 'vtiaccademy'	,'Vi Ti Ai'			,   '6'		     ,   '1'		,'2020-04-09');

INSERT INTO `Group`	(  GroupName        , CreatorID         , CreateDate)
VALUES 		(N'Testing System'		,   5			,'2019-03-05'),
               (N'Developement'		,   1			,'2020-03-07'),
               (N'VTI Sale 01'		,   2			,'2020-03-09'),
               (N'VTI Sale 02'		,   3			,'2020-03-10'),
               (N'VTI Sale 03'		,   4			,'2020-03-28'),
               (N'VTI Creator'		,   6			,'2020-04-06'),
               (N'VTI Marketing 01'	,   7			,'2020-04-07'),
               (N'Management'			,   8			,'2020-04-08'),
               (N'Chat with love'		,   9			,'2020-04-09'),
               (N'Vi Ti Ai'			,   10			,'2020-04-10');

INSERT INTO `GroupAccount`	(GroupID, AccountID, JoinDate)
VALUES 		(	1		,    1		,'2019-03-05'),
               (	1		,    2		,'2020-03-07'),
               (	3		,    3		,'2020-03-09'),
               (	3		,    4		,'2020-03-10'),
               (	5		,    5		,'2020-03-28'),
               (	1		,    3		,'2020-04-06'),
               (	1		,    7		,'2020-04-07'),
               (	8		,    3		,'2020-04-08'),
               (	1		,    9		,'2020-04-09'),
               (	10		,    10		,'2020-04-10');


INSERT INTO TypeQuestion	(TypeName) 
VALUES 		('Essay'), 
               ('Multiple-Choice'); 


INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 		('Java'),
               ('ASP.NET'),
               ('ADO.NET'),
               ('SQL'),
               ('Postman'),
               ('Ruby'),
               ('Python'),
               ('C++'),
               ('C Sharp'),
               ('PHP');
													
INSERT INTO Question	(Content	, CategoryID   , TypeID		     , CreatorID	, CreateDate )
VALUES 		(N'Câu hỏi về Java'	,	1		,   '1'			,   '1'		,'2020-04-05'),
               (N'Câu Hỏi về PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
               (N'Hỏi về C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
               (N'Hỏi về Ruby'	,	6		,   '1'			,   '4'		,'2020-04-06'),
               (N'Hỏi về Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
               (N'Hỏi về ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
               (N'Hỏi về ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
               (N'Hỏi về C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
               (N'Hỏi về SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
               (N'Hỏi về Pascal'	,	5		,   '1'			,   '10'		,'2020-04-07'),
               (N'Hỏi về NetBean'	,	2		,   '1'			,   '11'		,'2020-04-07'),
               (N'Hỏi về Visual'	,	4		,   '1'			,   '12'		,'2020-04-07'),
               (N'Hỏi về Brackets'	,	6		,   '2'			,   '13'		,'2020-04-07'),
               (N'Hỏi về IDE'		,	4		,   '2'			,   '14'		,'2020-04-07'),
               (N'Hỏi về Python'	,	7		,   '1'			,   '15'	     ,'2020-04-07');

INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 		(N'Trả lời 01'	,   1			,	0		),
               (N'Trả lời 02'	,   1			,	1		),
               (N'Trả lời 03'	,   1			,	0		),
               (N'Trả lời 04'	,   1			,	1		),
               (N'Trả lời 05'	,   2			,	1		),
               (N'Trả lời 06'	,   3			,	1		),
               (N'Trả lời 07'	,   4			,	0		),
               (N'Trả lời 08'	,   8			,	0		),
               (N'Trả lời 09'	,   2			,	1		),
               (N'Trả lời 10'	,   4			,	1		),
               (N'Trả lời 11'	,   3			,	1		),
               (N'Trả lời 12'	,   2			,	1		),
               (N'Trả lời 13'	,   9			,	1		),
               (N'Trả lời 14'	,   5			,	1		),
               (N'Trả lời 15'	,   5			,	1		),
               (N'Trả lời 16'	,   6			,	1		),
               (N'Trả lời 17'	,   8			,	1		),
               (N'Trả lời 18'	,   9			,	1		),
               (N'Trả lời 19'	,   9			,	1		),
               (N'Trả lời 20'	,   10			,	1		);
	
INSERT INTO Exam (`Code`           , Title                  , CategoryID        , Duration         , CreatorID     , CreateDate )
VALUES 		('VTIQ001'		, N'Đề thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
               ('VTIQ002'		, N'Đề thi PHP'		,	10			,	60		,   '1'			,'2019-04-05'),
               ('VTIQ003'		, N'Đề thi C++'		,	9			,	120		,   '2'			,'2019-04-07'),
               ('VTIQ004'		, N'Đề thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
               ('VTIQ005'		, N'Đề thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
               ('VTIQ006'		, N'Đề thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
               ('VTIQ007'		, N'Đề thi SQL'		,	2			,	60		,   '7'			,'2020-04-05'),
               ('VTIQ008'		, N'Đề thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
               ('VTIQ009'		, N'Đề thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
               ('VTIQ010'		, N'Đề thi ASP.NET'		,	7			,	90		,   '10'		     ,'2020-04-08');
                    
                    
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 		(	1	,		5		),
               (	2	,		10		),     
               (	3	,		4		),     
               (	4	,		3		),     
               (	5	,		7		),     
               (	6	,		10		),     
               (	7	,		2		),     
               (	8	,		10		),     
               (	9	,		9		),     
               (	10	,		8		);     
               


-- Assignment3               
-- Question 2: lấy ra tất cả các phòng ban 
SELECT DepartmentName
FROM Department;
-- Question 3: lấy ra id của phòng ban "Sale" 
SELECT *,DepartmentID AS 'MUC TIEU'
FROM Department
WHERE DepartmentName LIKE 'Sale';
-- Question 4: lấy ra thông tin account có full name dài nhất 
SELECT *,length(FullName) AS 'DO DAI TEN'
FROM `Account`
ORDER BY length(FullName) DESC
LIMIT 1;
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id   = 7 
SELECT *,length(FullName) AS 'DO DAI TEN'
FROM `Account`
WHERE DepartmentID = 7
ORDER BY length(FullName) DESC
LIMIT 1;
-- Question 6: Lấy ra tên group đã tham gia trước ngày 10/04/2020 
SELECT *,GroupName
FROM `Group`
WHERE CreateDate < '2020-04-10'
;
-- Question 7: Lấy ra ID của question có >= 4 câu trả lời 
SELECT    *,QuestionID, COUNT(QuestionID) AS 'so luong cau tra loi'
FROM      Answer                                                      -- lay data tu bang Answer
GROUP BY  QuestionID                                                  -- Nhom chung data voi cot QuestionID
HAVING    COUNT(QuestionID) >= 4                                         -- them dieu kien so cau tra loi >=4 (dem so luong QuestionID tai Answer)
;
-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày   20/12/2019 
SELECT    `Code` AS "ma de thi"
FROM      Exam
WHERE     Duration >= 60 AND CreateDate < '2020-04-05'
;
-- Question 9: Lấy ra 5 group được tạo gần đây nhất 
SELECT    *,GroupName
FROM      `Group`
ORDER BY  CreateDate DESC
LIMIT     5
;
-- Question 10: Đếm số nhân viên thuộc department có id = 2 
SELECT    count(DepartmentID)
FROM      `Account`
WHERE     DepartmentID = 2
;
-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o" 
SELECT    FullName
FROM      `Account`
WHERE     FullName LIKE 'D%o'
;
-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE FROM    Exam
WHERE          CreateDate < '2020-12-20' 
;            
-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi" 
DELETE FROM    Question
WHERE          Content  LIKE 'câu hỏi%'
;    
-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và   email thành loc.nguyenba@vti.com.vn 
UPDATE    `Account`      
SET       FullName = 'Nguyen Ba Loc' AND Email = 'loc.nguyenba@vti.com.vn'           --  loi trung ten
WHERE     AccountID = 5
;
SELECT *
FROM `Account`;
-- Question 15: update account có id = 5 sẽ thuộc group có id = 4 
UPDATE    `Account`
SET       DepartmentID = 4
WHERE     AccountID = 5
;
SELECT *
FROM `Account`;

-- Assignment4
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ 
SELECT         FullName,DepartmentName
FROM           `Account`
LEFT JOIN      Department USING (DepartmentID);
-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010  
SELECT    *
FROM      `Account`
WHERE     CreateDate > '2010-12-20';
-- Question 3: Viết lệnh để lấy ra tất cả các developer  
SELECT    *
FROM      `Account`
WHERE     PositionID = 1;
-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên 
SELECT    DepartmentName, COUNT(Username), GROUP_CONCAT(FullName) 
FROM      `Account`
JOIN      Department USING (DepartmentID)
GROUP BY  DepartmentID
HAVING    COUNT(Username) > 2
;
-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều   nhất 
SELECT *, count(1), GROUP_CONCAT(QuestionID)
FROM           ExamQuestion
JOIN           Question USING (QuestionID)
GROUP BY       QuestionID
HAVING         count(1) =     (SELECT count(1)
                              FROM           ExamQuestion
                              GROUP BY       QuestionID
                              ORDER BY       count(1) DESC
                              LIMIT          1
);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu 
SELECT    CategoryID, CategoryName, COUNT(CategoryID)
FROM      CategoryQuestion
LEFT JOIN Question USING (CategoryID)
GROUP BY  CategoryID;
-- Question Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam 
SELECT    QuestionID, COUNT(ExamID), GROUP_CONCAT(ExamID)
FROM      ExamQuestion
RIGHT JOIN Question USING (QuestionID)
GROUP BY QuestionID
;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT         QuestionID
FROM           Answer                                                          --  sai group ???
Where          COUNT(QuestionID) = ( SELECT COUNT(QuestionID)
                                   FROM Answer
                                   GROUP BY QuestionID
                                   ORDER BY COUNT(QuestionID) DESC
                                   LIMIT 1
); 
-- Question 9: Thống kê số lượng account trong mỗi group  
SELECT         count(AccountID), GroupID, GroupName
FROM           GroupAccount
RIGHT JOIN     `Group` USING (GroupID)
GROUP BY       GroupID;
-- Question 10: Tìm chức vụ có ít người nhất 
SELECT *,count(1)
FROM           `Account`      
GROUP BY       PositionID
HAVING count(1) = 2;
-- Question 11: Thống kê mỗi phòng ban có thuoc 1 trong 4 chuc vu : dev, test, scrum master, PM 
SELECT    *,count(DepartmentID)
FROM      `Account`
JOIN      Position USING (PositionID)
WHERE     PositionID = 1 || 2 || 3 || 4
GROUP BY  DepartmentID
;
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của   question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, … 
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm 
SELECT TypeID, TypeName, count(TypeName) as 'so luong'
FROM TypeQuestion
JOIN Question using (TypeID)
GROUP BY TypeID;
-- Question 14:Lấy ra group không có account nào 
SELECT    GroupID, GroupName, COUNT(AccountID)
FROM      `Group`
LEFT JOIN `GroupAccount` USING (GroupID)
GROUP BY  GroupID
HAVING COUNT(AccountID) = 0
; 
-- Question 15: Lấy ra group không có account nào 
-- Question 16: Lấy ra question không có answer nào 
SELECT    QuestionID, COUNT(QuestionID)
FROM      Answer
LEFT JOIN Question USING (QuestionID)
GROUP BY  QuestionID
HAVING    COUNT(QuestionID) = 0
;

-- Exercise 2: Union 
-- Question 17:  
-- a) Lấy các account thuộc nhóm thứ 1 
-- b) Lấy các account thuộc nhóm thứ 2 
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau 
-- Question 18:  
-- a) Lấy các group có lớn hơn 5 thành viên 
-- b) Lấy các group có nhỏ hơn 7 thành viên 
-- c) Ghép 2 kết quả từ câu a) và câu b)/ 
