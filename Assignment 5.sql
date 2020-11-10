USE `testingsystem3`;

-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale

CREATE OR REPLACE VIEW question_1 AS
SELECT *
FROM `Account`
WHERE DepartmentID = (
			SELECT DepartmentID 
			FROM Department
			WHERE Department_name = 'sale' );

-- Question 2: Tạo view có chứa thông tin các Account tham gia vào nhiều Group nhất
CREATE OR REPLACE VIEW Question_2 AS
SELECT AccountID, COUNT(GroupID), Group_CONCAT(GroupID)
FROM `Group_Account`
Group BY AccountID
HAVING COUNT(GroupID) = (
		SELECT COUNT(GroupID)
		FROM Group_Account
		GROUP BY AccountID
		ORDER BY COUNT(GroupID) DESC
        LIMIT 1); 

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 10 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW Question3 AS
SELECT *
FROM Question
WHERE LENGTH(Content) > 10;

DELETE
FROM Question3;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW Question4 AS
SELECT DepartmentID, COUNT(AccountID)
FROM `Account`
Group BY DepartmentID
HAVING COUNT(AccountID) = (
		SELECT COUNT(AccountID)
		FROM `Account`
		Group BY DepartmentID
		ORDER BY COUNT(AccountID) DESC
		LIMIT 1);
        
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE OR REPLACE VIEW question_5 AS
SELECT Question.questionID, Question.content, Question.creatorID, a.full_name, a.email
FROM Question
JOIN `Account` ON `Account`.AccountID = Question.creatorID
WHERE `Account`.full_name LIKE ('Nguyen%');