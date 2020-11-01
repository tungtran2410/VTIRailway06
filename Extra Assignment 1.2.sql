CREATE DATABASE LEARNING3;

USE LEARNING3;

DROP TABLE IF EXISTS TRAINEE;
CREATE TABLE TRAINEE(
        trainer_id		  INT,
        full_name			  TEXT,
        birth_day			  DATE,
        gender				  ENUM('MALE','FAMALE','UNKNOWN'),
        et_iq				    SMALLINT UNSIGNED,
        et_gmath        SMALLINT UNSIGNED,
        et_english      SMALLINT UNSIGNED,
        CHECK(et_iq <= 20),
        check(et_gmath <= 20),
        check(et_english <= 50),
        training_class  varchar(50),
        evaluation_note TEXT,
        PRIMARY KEY (trainer_id,full_name,gender)
        );
        