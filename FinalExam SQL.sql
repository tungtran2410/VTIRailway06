DROP DATABASE IF EXISTS Exam;
CREATE DATABASE Exam;
USE Exam;

DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
	country_id 		TINYINT PRIMARY KEY AUTO_INCREMENT,
	country_name 	VARCHAR(50)
);

DROP TABLE IF EXISTS Location;
CREATE TABLE Location (
	location_id 	TINYINT PRIMARY KEY AUTO_INCREMENT,
	street_address 	VARCHAR(50),
    postal_code 	INT,
    country_id		TINYINT,
    FOREIGN KEY(country_id) REFERENCES Country(country_id)
);

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
	employee_id 	TINYINT PRIMARY KEY AUTO_INCREMENT,
	full_name	 	VARCHAR(50),
    email		 	VARCHAR(100),
    location_id		TINYINT,
    FOREIGN KEY(location_id) REFERENCES Location(location_id)
);


INSERT INTO Country		(country_name	)
VALUES 					('Vietnam'),
						('Japan'),
						('Usa'),
						('China'),
						('Peru');

INSERT INTO Location	(street_address			, postal_code	, country_id)
VALUES 					('Chealsea'				,   5			,1),
						('ManU'					,   1			,3),
						('ManC'					,   2			,2),
						('Liverpool'			,   3			,4),
						('Asenal'				,   4			,2),
						('Tottenaham'			,   6			,2);

INSERT INTO Employee	(full_name				, email					, location_id)
VALUES 					('Nga My'				,'ngamy@gmail.com'		,1),
						('Cai Bang'				,'caibang@gmail.com'	,2),
						('Thien Vuong'			,'thienvuong@gmail.com'	,3),
						('Thieu Lam'			,'thieulam@gmail.com'	,4),
						('Vo Dang'				,'vodang@gmail.com'		,2),
						('Thien Nhan'			,'thiennhan@gmail.com'	,3),
						('Ngu Doc'				,'ngudoc@gmail.com'		,2),
						('Duong Mon'			,'duongmon@gmail.com'	,1),
                        ('No One'				,'nn03@gmail.com'		,1);
                        

-- Lấy tất cả các nhân viên thuộc Việt nam
SELECT full_name
FROM Employee
where location_id = (	SELECT    location_id
						FROM 	Location
						JOIN	Country USING (country_id)
						where 	country_name = 'Vietnam')
;
                        
-- Lấy ra tên quốc gia của employee có email là "nn03@gmail.com"
SELECT country_name
FROM Country join Location using (country_id)
WHERE location_id = 	(SELECT    	location_id
						FROM 		Location
						JOIN		Employee USING (location_id)
						WHERE 		email = 'nn03@gmail.com');
                        
-- Thống kê mỗi country, mỗi location có bao nhiêu employee đang làm việc
SELECT         location_id, street_address, count(full_name) as number_of_Employee_for_Location
FROM           Employee
RIGHT JOIN     Location USING (location_id)
GROUP BY       location_id;
                         

SELECT         country_id, country_name, count(full_name) as number_of_Employee_for_Country
FROM           Employee
RIGHT JOIN     Location USING (location_id)
RIGHT JOIN     Country USING (country_id)
GROUP BY       country_id;

-- Tạo trigger cho table Employee chỉ cho phép insert mỗi quốc gia có tối đa 10 employee
DROP TRIGGER IF EXISTS Max_Employee_of_Country;
DELIMITER $$
CREATE TRIGGER Max_Employee_of_Country
BEFORE INSERT ON Employee
FOR EACH ROW 
BEGIN 
	IF NEW.location_id IN (	SELECT location_id FROM (	SELECT country_id, COUNT(full_name) AS number_of_Employee
														FROM Employee
														RIGHT JOIN     Location USING (location_id)
														RIGHT JOIN     Country USING (country_id)
														GROUP BY country_id
														HAVING number_of_Employee = 10) AS temp) THEN
		SIGNAL SQLSTATE '12345' -- disallow insert this record
		SET MESSAGE_TEXT = 'Qua gioi han nhan vien cho 1 quoc gia';
    END IF;
END$$
DELIMITER ;

-- Hãy cấu hình table sao cho khi xóa 1 location nào đó thì tất cả employee ở location đó sẽ có location_id = null
DROP TRIGGER IF EXISTS Delete_Location;
DELIMITER $$
CREATE TRIGGER Delete_Location 
AFTER DELETE ON Location
FOR EACH ROW
BEGIN
 		DELETE FROM Location WHERE location_id = OLD.location_id;
        UPDATE Employee SET location_id = NULL WHERE location_id = OLD.location_id;
    
END$$
DELIMITER ;


