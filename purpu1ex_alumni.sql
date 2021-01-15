-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 10, 2021 at 03:15 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `purpu1ex_alumni`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `add_advisory_body` (IN `p_name` VARCHAR(100), IN `p_advisor_1` VARCHAR(100), IN `p_advisor_2` VARCHAR(100), IN `p_f_yr` VARCHAR(100))  NO SQL
BEGIN
INSERT INTO `directory_advisory_body`
			(patron_name,
             advisor1_name,
             advisor2_name,                       
            f_year)
             
              VALUES (
                        p_name,
                         p_advisor_1,
                         p_advisor_2,                      
                 		 p_f_yr
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `add_executive_body` (IN `p_p_name` VARCHAR(100), IN `p_v_p_name` VARCHAR(100), IN `p_gs_name` VARCHAR(100), IN `p_a_gs_name1` VARCHAR(100), IN `p_a_gs_name2` VARCHAR(100), IN `p_t_name` VARCHAR(100), IN `p_exe_m_name1``` VARCHAR(100), IN `p_exe_m_name2` VARCHAR(100), IN `p_exe_m_name3` VARCHAR(100), IN `p_exe_m_name4` VARCHAR(100), IN `p_exe_m_name5` VARCHAR(100), IN `p_f_yr` VARCHAR(100))  NO SQL
BEGIN
INSERT INTO `directory_executive_body`
			(p_name,
             v_p_name,
             g_secretary_name,            
             a_g_secretary_name1,
             a_g_secretary_name2,
             treasurer_name,
            executive_m_name1,
            executive_m_name2,
            executive_m_name3,
            executive_m_name4,
            executive_m_name5,
            f_year)
             
              VALUES (
                        p_p_name,
                         p_v_p_name,
                         p_gs_name,
                         p_a_gs_name1,
                         p_a_gs_name2,
                  		p_t_name,
                  		p_exe_m_name1,
                  		p_exe_m_name2,
                  		p_exe_m_name3,
                  		p_exe_m_name4,
                  		p_exe_m_name5,
                 		 p_f_yr
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `admin_auth` (IN `u_id` VARCHAR(20), IN `pwd` VARCHAR(20))  NO SQL
BEGIN
    IF EXISTS
        (
        SELECT
            *
        FROM
            admin_login al
        WHERE
            al.mail = u_id
    ) THEN IF EXISTS(
    SELECT
        *
    FROM
        admin_login al
    WHERE
        al.mail = u_id AND al.password = pwd
) THEN
SELECT
    1 AS output,
    al.user_id,
    al.mail AS user_email,
    al.user_name
FROM
    admin_login al
WHERE
    al.mail = u_id AND al.password = pwd; ELSE
SELECT
    u_id,
    -1 AS output;
END IF; ELSE
SELECT
    u_id,
    -2 AS output;
END IF;
END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `advisory_body_edit` (IN `p_adv_id` INT)  NO SQL
SELECT * FROM  directory_advisory_body a
WHERE a.d_a_id=p_adv_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `advisory_body_update` (IN `p_p_name` VARCHAR(100), IN `p_advisor_1` VARCHAR(100), IN `p_advisor_2` VARCHAR(100), IN `p_f_yr` VARCHAR(100), IN `p_adv_id` INT)  NO SQL
BEGIN
UPDATE directory_advisory_body a
SET  		
			a.patron_name=p_p_name,
             a.advisor1_name=p_advisor_1,
             a.advisor2_name=p_advisor_2,               
              a.f_year=p_f_yr
             WHERE a.d_a_id=p_adv_id;
             END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `alumni_aims_and_objective_list` ()  NO SQL
SELECT * FROM `alumni_aim` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `alumni_history_list` ()  NO SQL
SELECT * FROM `alumni_history_details` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `check_phone_no` (IN `p_ph_no` VARCHAR(10))  NO SQL
SELECT COUNT(*) AS num FROM member_login a WHERE 
a.phone_number = p_ph_no$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_advisory_master_list` ()  NO SQL
SELECT * FROM `directory_advisory_body` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_executive_master_list` ()  NO SQL
SELECT * FROM `directory_executive_body` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_executive_master_list2` ()  NO SQL
SELECT * FROM directory_executive_body a WHERE a.f_year=2020$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_speech_add` (IN `p_speech` VARCHAR(1000), IN `p_gs_speech` VARCHAR(1000), IN `pre_name` VARCHAR(100), IN `p_gs_name` VARCHAR(100), IN `p_pic` VARCHAR(100), IN `gs_pic` VARCHAR(100), IN `p_f_yr` VARCHAR(100))  NO SQL
BEGIN
INSERT INTO `directory_speech`
			(p_speech,
             gs_speech,
             president_name,
             gs_name,
             p_pic,
             gs_pic,
            f_year)
             
              VALUES (
                      p_speech,
                      p_gs_speech,                      
                      pre_name,
                      p_gs_name,
                      p_pic,
                      gs_pic,
                  p_f_yr
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_speech_edit` (IN `p_d_s_id` INT)  NO SQL
SELECT * FROM directory_speech a WHERE a.d_s_id=p_d_s_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_speech_master_list` ()  NO SQL
SELECT * FROM `directory_speech` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_speech_master_list2` ()  NO SQL
SELECT * FROM directory_speech a  WHERE a.f_year=2020$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `directory_speech_update` (IN `p_speech` VARCHAR(1000), IN `p_gs_speech` VARCHAR(1000), IN `pre_name` VARCHAR(100), IN `p_gs_name` VARCHAR(100), IN `p_pic` VARCHAR(100), IN `gs_pic` VARCHAR(100), IN `p_f_yr` VARCHAR(100), IN `p_d_s_id` INT)  NO SQL
BEGIN
UPDATE directory_speech a
SET  		a.p_speech=p_speech,
             a.gs_speech=p_gs_speech,
             a.president_name=pre_name,
             a.gs_name=p_gs_name,
             a.p_pic=p_pic,
              a.gs_pic=gs_pic,
              a.f_year=p_f_yr
             
             WHERE a.d_s_id=p_d_s_id;
             END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `election_master_list` ()  NO SQL
SELECT * FROM `election_master` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `election_nomination_update` ()  NO SQL
BEGIN
UPDATE election_master a
SET
a.voting_active_flag =0,
a.nomination_active_flag=1

WHERE 1;

END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `election_voting_result` (IN `p_user_id` INT, IN `post_id` INT)  NO SQL
BEGIN
  
SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.p_vote=p_user_id;




END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `election_voting_result2` (IN `p_user_id` INT, IN `post_id` INT)  NO SQL
BEGIN 
DECLARE v_count INT;
IF (post_id=1) THEN 
SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.p_vote=p_user_id);

ELSEIF(post_id=2) THEN
SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.v_p_vote=p_user_id);
 
 ELSEIF(post_id=3) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.gs_vote=p_user_id);

ELSEIF(post_id=4) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.a_gs1_vote=p_user_id);

ELSEIF(post_id=5) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.a_gs2_vote=p_user_id);

ELSEIF(post_id=6) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.t_vote=p_user_id);

ELSEIF(post_id=7) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.exe_mem1_vote=p_user_id);

ELSEIF(post_id=8) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.exe_mem2_vote=p_user_id);

ELSEIF(post_id=9) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.exe_mem3_vote=p_user_id);

ELSEIF(post_id=10) THEN
 SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.exe_mem4_vote=p_user_id);
 
 ELSE 
  SET v_count = (SELECT count(a.member_id) as count
FROM election_voting_details a WHERE a.exe_mem5_vote=p_user_id);
 END IF;
  
  if not exists(select * from election_voting_result a 
          where a.candidate_id = p_user_id) THEN
  
 INSERT INTO election_voting_result (
                  candidate_id,
                  count)
                       VALUES(
                       p_user_id,
                       v_count);
       
end if;                
                       
 END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `election_voting_update` ()  NO SQL
BEGIN
UPDATE election_master a
SET
a.voting_active_flag =1,
a.nomination_active_flag=0

WHERE 1;

END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `event_add` (IN `p_date` VARCHAR(100), IN `p_e_name` VARCHAR(100), IN `p_location` VARCHAR(100), IN `p_fees` INT, IN `p_form` VARCHAR(100), IN `p_remarks` VARCHAR(1000))  NO SQL
BEGIN
INSERT INTO `events`
			(event_date,
             event_name,
             location,            
             fees,
             form,
             remarks)
             
              VALUES (
                        p_date,
                         p_e_name,
                         p_location,
                         p_fees,
                         p_form,
                  		p_remarks
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `event_data_update` (IN `p_date` VARCHAR(100), IN `p_e_name` VARCHAR(100), IN `p_location` VARCHAR(100), IN `p_fees` INT, IN `p_form` VARCHAR(100), IN `p_remarks` VARCHAR(1000), IN `p_event_id` INT)  NO SQL
BEGIN
UPDATE events a
SET  		a.event_date=p_date,
             a.event_name=p_e_name,
             a.location=p_location,            
             a.fees=p_fees,
             a.form=p_form,
             a.remarks=p_remarks
             
             WHERE a.event_id=p_event_id;
             END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `event_edit` (IN `p_event_id` INT)  NO SQL
SELECT * FROM  events a
WHERE a.event_id=p_event_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `event_master_list` ()  NO SQL
SELECT * FROM `events` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `executive_body_edit` (IN `p_exe_id` INT)  NO SQL
SELECT * FROM  directory_executive_body a
WHERE a.d_e_id=p_exe_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `executive_body_update` (IN `p_p_name` VARCHAR(100), IN `p_v_p_name` VARCHAR(100), IN `p_gs_name` VARCHAR(100), IN `p_a_gs_name1` VARCHAR(100), IN `p_a_gs_name2` VARCHAR(100), IN `p_t_name` VARCHAR(100), IN `p_exe_m_name1` VARCHAR(100), IN `p_exe_m_name2` VARCHAR(100), IN `p_exe_m_name3` VARCHAR(100), IN `p_exe_m_name4` VARCHAR(100), IN `p_exe_m_name5` VARCHAR(100), IN `p_exe_id` INT, IN `p_f_yr` VARCHAR(100))  NO SQL
BEGIN
UPDATE directory_executive_body a
SET  		
			a.p_name=p_p_name,
             a.v_p_name=p_v_p_name,
             a.g_secretary_name=p_gs_name,            
             a.a_g_secretary_name1=p_a_gs_name1,
             a.a_g_secretary_name2=p_a_gs_name2,
             a.treasurer_name=p_t_name,
             a.executive_m_name1=p_exe_m_name1,
             a.executive_m_name2=p_exe_m_name2,
             a.executive_m_name3=p_exe_m_name3,
             a.executive_m_name4=p_exe_m_name4,
             a.executive_m_name5=p_exe_m_name5,
              a.f_year=p_f_yr
             WHERE a.d_e_id=p_exe_id;
             END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `executive_speech_add` (IN `p_p_speech` VARCHAR(1000), IN `p_gs_speech` VARCHAR(1000), IN `p_p_name` VARCHAR(100), IN `p_gs_name` VARCHAR(100), IN `p_p_pic` VARCHAR(100), IN `p_gs_pic` VARCHAR(100))  NO SQL
BEGIN
INSERT INTO `directory_speech`
			(p_speech,
             gs_speech,
             president_name,            
             gs_name,
             p_pic,
             gs_pic)
             
              VALUES (
                        p_p_speech,
                         p_gs_speech,
                         p_p_name,
                         p_gs_name,
                         p_p_pic,
                  		p_gs_pic
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `executive_speech_edit` (IN `p_s_id` INT)  NO SQL
SELECT * FROM directory_speech a WHERE a.d_s_id=p_s_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `executive_speech_master` ()  NO SQL
SELECT * FROM `directory_speech` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `initiative_add` (IN `p_d_o_initiative` VARCHAR(100), IN `p_status` VARCHAR(100), IN `p_initiative_name` VARCHAR(100), IN `p_date_o_completion` VARCHAR(100), IN `p_suggested` VARCHAR(1000), IN `p_t_mem` VARCHAR(100), IN `p_remarks` VARCHAR(1000))  NO SQL
BEGIN
INSERT INTO `initiatives_master`
			(date_o_initiative,
             p_status,
             initiative_name,            
             date_o_completion,
             suggested,
             team_members,
             remarks)
             
              VALUES (
                        p_d_o_initiative,
                         p_status,
                         p_initiative_name,
                         p_date_o_completion,
                         p_suggested,
                 		 p_t_mem,
                  		p_remarks
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `initiative_data_update` (IN `p_d_o_initiative` VARCHAR(100), IN `p_status` VARCHAR(100), IN `p_initiative_name` VARCHAR(100), IN `p_date_o_completion` VARCHAR(100), IN `p_suggested` VARCHAR(100), IN `p_t_mem` VARCHAR(100), IN `p_remarks` VARCHAR(1000), IN `p_ini_id` INT)  NO SQL
BEGIN
UPDATE initiatives_master a
SET  		a.date_o_initiative=p_d_o_initiative,
             a.p_status=p_status,
             a.initiative_name=p_initiative_name,            
             a.date_o_completion=p_date_o_completion,
             a.suggested=p_suggested,
              a.team_members=p_t_mem,
             a.remarks=p_remarks
             
             WHERE a.i_id=p_ini_id;
             END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `initiative_edit` (IN `p_ini_id` INT)  NO SQL
SELECT * FROM initiatives_master a WHERE a.i_id =p_ini_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `initiative_master_list` ()  NO SQL
SELECT * FROM `initiatives_master` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `meeting_add` (IN `p_date_o_meeting` VARCHAR(100), IN `p_m_title` VARCHAR(100), IN `p_remarks` VARCHAR(500))  NO SQL
BEGIN
INSERT INTO `meeting_master`
			(date_o_meeting,
             m_title,
             remarks)
             
              VALUES (
                        p_date_o_meeting,
                         p_m_title,                      
                  		p_remarks
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `meeting_data_update` (IN `p_date_o_meeting` VARCHAR(100), IN `p_m_title` VARCHAR(100), IN `p_remarks` VARCHAR(500), IN `p_m_id` INT)  NO SQL
BEGIN
UPDATE meeting_master a
SET  		a.date_o_meeting=p_date_o_meeting,
             a.m_title=p_m_title,
             
             a.remarks=p_remarks
             
             WHERE a.m_id=p_m_id;
             END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `meeting_edit` (IN `p_m_id` INT)  NO SQL
SELECT * FROM meeting_master a WHERE a.m_id=p_m_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `meeting_master_list` ()  NO SQL
SELECT * FROM `meeting_master` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_details` (IN `p_user_id` INT)  NO SQL
SELECT * FROM member_login a WHERE a.mem_id=p_user_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_educational_details` (IN `p_user_id` INT)  NO SQL
SELECT * FROM member_educational_info a WHERE a.mem_id=p_user_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_job_details` (IN `p_user_id` INT)  NO SQL
SELECT * FROM member_job_info a WHERE a.mem_id=p_user_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_master_list` ()  NO SQL
SELECT * FROM `member_basic_info` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_reg` (IN `p_u_name` VARCHAR(100), IN `p_password` VARCHAR(100), IN `p_status` VARCHAR(100), IN `p_m_type` VARCHAR(100), IN `p_m_reg_no` VARCHAR(100), IN `p_meb_name` VARCHAR(100), IN `p_f_name` VARCHAR(100), IN `p_m_name` VARCHAR(100), IN `p_dob` VARCHAR(100), IN `p_m_sub_date` VARCHAR(100), IN `p_parmament_address` VARCHAR(100), IN `p_present_address` VARCHAR(100), IN `p_mob` VARCHAR(100), IN `p_altr_mob` VARCHAR(100), IN `p_p_mail` VARCHAR(100), IN `p_o_mail` VARCHAR(100), IN `p_b_yr_id` VARCHAR(100), IN `p_b_degree` VARCHAR(100), IN `p_m_degree` VARCHAR(100), IN `p_b_clg` VARCHAR(100), IN `p_phd` VARCHAR(100), IN `phd_clg` VARCHAR(100), IN `p_no_books` INT, IN `p_no_artical` INT, IN `p_no_research` INT)  NO SQL
BEGIN
declare v_m_id INT;

INSERT INTO `member_login`
					(`user_name`,
                     `password`,
                     `status`) 
                     
                     VALUES (
                        p_u_name,
                         p_password,
                         p_status
                     );
   SET v_m_id =(SELECT LAST_INSERT_ID());  
   
   
   INSERT INTO `member_basic_info`
					(mem_id,
                     mem_type,
                     mem_reg_no,
                    mem_name,
                    father_name,
                    mother_name,
                    dob,
                    mem_submission_date,
                    parmanent_address,
                    present_address,
                    mob,
                    altr_mob,
                    permanent_mail,
                    official_mail,
                    batch_year_id) 
                     
                     		select v_m_id,
                        	p_m_type,
                         	p_m_reg_no,
                         	p_meb_name,
                         	p_f_name,
                            p_m_name,
                            p_dob,
                            p_m_sub_date,
                            p_parmament_address,
                            p_present_address,
                            p_mob,
                            p_altr_mob,
                            p_p_mail,
                            p_o_mail,
                            p_b_yr_id;
     
     
    INSERT INTO `member_educational_info`
    				(mem_id,
                     b_degree,
                     m_degree, 
                     b_clg, 
                     m_clg, 
                     phd, 
                     phd_clg, 
                     no_books, 
                     no_artical, 
                     no_research)
                     
                     
                     		
                            
                            select v_m_id,
                            p_b_degree,
                            p_m_degree,
                            p_b_clg,
                            p_phd,
                            phd_clg, 
                     		p_no_books, 
                     		p_no_artical, 
                    		 p_no_research;
                            
  /* INSERT INTO `member_basic_info`
   ( `mem_id`,
    `mem_type`, 
    `mem_reg_no`, 
    `mem_name`,
    `father_name`, 
    `mother_name`, 
    `dob`, 
    `mem_submission_date`,
    `parmanent_address`,
    `present_address`,
    `mob`, 
    `altr_mob`, 
    `permanent_mail`,
    `official_mail`,
    `batch_year_id`
   ) 
    
    VALUES 
        select v_m_id,
        p_m_type,
        p_m_reg_no,
        p_m_name,
        p_f_name,
        p_m_name,
        p_dob,
        p_m_sub_date,
        p_parmament_address,
        p_present_address,
        p_mob,
        p_altr_mob,
        p_p_mail,
        p_o_mail,
        p_b_yr_id;*/
       
    
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_reg2` (IN `p_u_name` VARCHAR(100), IN `p_password` VARCHAR(100), IN `p_f_name` VARCHAR(100), IN `p_m_name` VARCHAR(100), IN `p_m_sub_date` VARCHAR(100), IN `p_dob` VARCHAR(100), IN `p_age` VARCHAR(100), IN `p_parmament_address` VARCHAR(100), IN `p_present_address` VARCHAR(100), IN `p_mob` VARCHAR(100), IN `p_altr_mob` VARCHAR(100), IN `p_p_mail` VARCHAR(100), IN `p_o_mail` VARCHAR(100), IN `from_date` VARCHAR(100), IN `to_date` VARCHAR(100), IN `m_clg` VARCHAR(1000), IN `m_degree` VARCHAR(1000), IN `y_of_passing` VARCHAR(1000), IN `position` VARCHAR(1000), IN `p_b_publish` VARCHAR(100), IN `p_a_publish` VARCHAR(100), IN `p_r_study` VARCHAR(100), IN `m_org` VARCHAR(1000), IN `state` VARCHAR(1000), IN `district` VARCHAR(1000), IN `designation` VARCHAR(1000), IN `m_experience` VARCHAR(1000), IN `p_achievement` VARCHAR(1000), IN `p_suggestion` VARCHAR(1000), IN `p_ext` VARCHAR(10), IN `p_f_year` VARCHAR(100), IN `p_to_year` VARCHAR(100), IN `p_gender` VARCHAR(100), IN `p_landmark` VARCHAR(100), IN `p_state` VARCHAR(100), IN `p_dist` VARCHAR(100), IN `p_country` VARCHAR(100), IN `p_landmark1` VARCHAR(100), IN `p_state1` VARCHAR(100), IN `p_dist1` VARCHAR(100), IN `p_country1` VARCHAR(100), IN `p_r_university` VARCHAR(10000), IN `p_research` VARCHAR(10000), IN `p_r_topic` VARCHAR(10000), IN `p_r_institution` VARCHAR(10000), IN `p_r_country` VARCHAR(10000), IN `p_pin` VARCHAR(100), IN `p_pin1` VARCHAR(100), IN `p_board` VARCHAR(1000))  NO SQL
BEGIN
declare v_m_id INT;
DECLARE validity VARCHAR(20);
DECLARE img_path VARCHAR(20);
DECLARE myStr VARCHAR(10000);
DECLARE myStr2 VARCHAR(10000);
DECLARE myStr3 VARCHAR(10000);
DECLARE myStr4 VARCHAR(10000);
DECLARE myStr15 VARCHAR(10000);

DECLARE myStr5 VARCHAR(10000);
DECLARE myStr6 VARCHAR(10000);
DECLARE myStr7 VARCHAR(10000);
DECLARE myStr8 VARCHAR(10000);
DECLARE myStr9 VARCHAR(10000);

DECLARE myStr10 VARCHAR(10000);
DECLARE myStr11 VARCHAR(10000);
DECLARE myStr12 VARCHAR(10000);
DECLARE myStr13 VARCHAR(10000);
DECLARE myStr14 VARCHAR(10000);

DECLARE myStr16 VARCHAR(10000);
DECLARE myStr17 VARCHAR(10000);

DECLARE v_strLen INT;
DECLARE v_strLen2 INT;
DECLARE v_strLen3 INT;
DECLARE v_strLen4 INT;

DECLARE STR VARCHAR(10000);
DECLARE STR2 VARCHAR(10000);
DECLARE STR3 VARCHAR(10000);
DECLARE STR4 VARCHAR(10000);
DECLARE STR15 VARCHAR(10000);


DECLARE STR5 VARCHAR(10000);
DECLARE STR6 VARCHAR(10000);
DECLARE STR7 VARCHAR(10000);
DECLARE STR8 VARCHAR(10000);
DECLARE STR9 VARCHAR(10000);

DECLARE STR10 VARCHAR(10000);
DECLARE STR11 VARCHAR(10000);
DECLARE STR12 VARCHAR(10000);
DECLARE STR13 VARCHAR(10000);
DECLARE STR14 VARCHAR(10000);

DECLARE STR16 VARCHAR(10000);
DECLARE STR17 VARCHAR(10000);


SET myStr = CONCAT(m_clg, ',');
SET myStr2 = CONCAT(m_degree , ',');
SET myStr3 = CONCAT(y_of_passing , ',');
SET myStr4 = CONCAT(position , ',');
SET myStr15 = CONCAT(p_board , ',');

SET myStr5 = CONCAT(m_org, ',');
SET myStr6 = CONCAT(state , ',');
SET myStr7 = CONCAT(district , ',');
SET myStr8 = CONCAT(designation , ',');
SET myStr9 = CONCAT(m_experience , ',');


SET myStr10 = CONCAT(p_r_university, ',');
SET myStr11 = CONCAT(p_research , ',');
SET myStr12 = CONCAT(p_r_topic , ',');
SET myStr13 = CONCAT(p_r_institution , ',');
SET myStr14 = CONCAT(p_r_country , ',');

SET myStr16 = CONCAT(p_achievement , ',');
SET myStr17 = CONCAT(p_suggestion , ',');

INSERT INTO `member_login`
					(`user_name`,
                     `password`,
                     `email_id`,
                    `phone_number`,
                     `status`,
                    `validity`) 
                     
                     VALUES (
                        p_u_name,
                         p_password,
                         p_p_mail,
                         p_mob,
                         1,
                         (SELECT date_add(now(), INTERVAL 1 year) )
                     );
   SET v_m_id =(SELECT LAST_INSERT_ID());
   SET img_path = concat(v_m_id,'.',p_ext);
   SET validity = (SELECT convert(STR_To_DATE( date_add(now(), INTERVAL 1 year), '%Y-%m-%d'),date) );
   
   
   INSERT INTO `member_basic_info`
					(mem_id,
                     mem_type,
                     mem_reg_no,
                    mem_name,
                    father_name,
                    mother_name,
                    dob,
                    m_age,
                    mem_submission_date,
                    parmanent_address,
                    present_address,
                    mob,
                    altr_mob,
                    permanent_mail,
                    official_mail,
                    batch_year_id,
                    
                    gender,
                    from_year,
                    to_year) 
                     
                     		select v_m_id,
                        	1,
                         	1,
                         	p_u_name,
                         	p_f_name,
                            p_m_name,
                            p_dob,
                            p_age,
                           now(),
                            p_parmament_address,
                            p_present_address,
                            p_mob,
                            p_altr_mob,
                            p_p_mail,
                            p_o_mail,
                            1,
                           
                            p_gender,
                            p_f_year,
                            p_to_year;
                            
    UPDATE member_basic_info mbs SET mbs.img_path = img_path 
  WHERE mbs.mem_id = v_m_id ;                       
                            
        INSERT INTO `member_address_details`
					(mem_id,
                     p_address,
                     p_state,
                    p_dist,
                    p_country,
                    p_address2,
                     p_state2,
                    p_dist2,
                    p_country2,
                    p_pin,
                    p_pin1)                    
                            
                            select v_m_id,
                        	p_landmark,
                         	p_state,
                         	p_dist,
                         	p_country,
                           p_landmark1,
                         	p_state1,
                         	p_dist1,
                         	p_country1,
                            p_pin,
                            p_pin1;
                            
                            
                            
       
WHILE (LOCATE(',', myStr) > 0)
 DO
SET v_strLen = (SELECT LENGTH(TRIM(myStr) > 0));

IF(v_strLen >0 )THEN

SET STR = SUBSTRING(myStr, 1, LOCATE(',', myStr) - 1);
SET myStr = SUBSTRING(myStr, LOCATE(',', myStr) + 1);

SET STR2 = SUBSTRING(myStr2, 1, LOCATE(',', myStr2) - 1);
SET myStr2 = SUBSTRING(myStr2, LOCATE(',', myStr2) + 1);

SET STR3 = SUBSTRING(myStr3, 1, LOCATE(',', myStr3) - 1);
SET myStr3 = SUBSTRING(myStr3, LOCATE(',', myStr3) + 1);

SET STR4 = SUBSTRING(myStr4, 1, LOCATE(',', myStr4) - 1);
SET myStr4 = SUBSTRING(myStr4, LOCATE(',', myStr4) + 1);

   SET STR15 = SUBSTRING(myStr15, 1, LOCATE(',', myStr15) - 1);
SET myStr15 = SUBSTRING(myStr15, LOCATE(',', myStr15) + 1);  
   
       INSERT INTO `member_educational_info`
    				(mem_id,                     
                     clg,
                      degree,
                     y_of_passing,  
                     possition,
                     board
                   /* no_books,
                    no_artical,
                    no_research*/)
           
                            select v_m_id,                           
                     		STR, 
                     		STR2,
                            STR3,
                    		 STR4,
                             STR15;
                             /*p_b_publish,
                             p_a_publish,
                             p_r_study;*/
       
  
           
                           
 
  
   END IF;

   END WHILE;
   
   
  
   
   
   WHILE (LOCATE(',', myStr5) > 0)
 DO
SET v_strLen2 = (SELECT LENGTH(TRIM(myStr5) > 0));

IF(v_strLen2 >0 )THEN

SET STR5 = SUBSTRING(myStr5, 1, LOCATE(',', myStr5) - 1);
SET myStr5 = SUBSTRING(myStr5, LOCATE(',', myStr5) + 1);

SET STR6 = SUBSTRING(myStr6, 1, LOCATE(',', myStr6) - 1);
SET myStr6 = SUBSTRING(myStr6, LOCATE(',', myStr6) + 1);

SET STR7 = SUBSTRING(myStr7, 1, LOCATE(',', myStr7) - 1);
SET myStr7 = SUBSTRING(myStr7, LOCATE(',', myStr7) + 1);

SET STR8 = SUBSTRING(myStr8, 1, LOCATE(',', myStr8) - 1);
SET myStr8 = SUBSTRING(myStr8, LOCATE(',', myStr8) + 1);

SET STR9 = SUBSTRING(myStr9, 1, LOCATE(',', myStr9) - 1);
SET myStr9 = SUBSTRING(myStr9, LOCATE(',', myStr9) + 1);

     
   
       INSERT INTO `member_job_info`
    				(mem_id,
                     org_name,                      
                     state, 
                     dist,  
                     designation,
                    experience
                   /* achievement,
                    suggestion*/)
           
                            select v_m_id,                           
                     		STR5, 
                     		STR6,
                            STR7,
                    		 STR8,
                             STR9;
                             /*p_achievement,
                             p_suggestion;*/
       
  
           
                           
  END IF;
  
   

   END WHILE;
   
   
   
   
     
   WHILE (LOCATE(',', myStr10) > 0)
 DO
SET v_strLen3 = (SELECT LENGTH(TRIM(myStr10) > 0));

IF(v_strLen3 >0 )THEN

SET STR10 = SUBSTRING(myStr10, 1, LOCATE(',', myStr10) - 1);
SET myStr10 = SUBSTRING(myStr10, LOCATE(',', myStr10) + 1);

SET STR11 = SUBSTRING(myStr11, 1, LOCATE(',', myStr11) - 1);
SET myStr11 = SUBSTRING(myStr11, LOCATE(',', myStr11) + 1);

SET STR12 = SUBSTRING(myStr12, 1, LOCATE(',', myStr12) - 1);
SET myStr12 = SUBSTRING(myStr12, LOCATE(',', myStr12) + 1);

SET STR13 = SUBSTRING(myStr13, 1, LOCATE(',', myStr13) - 1);
SET myStr13 = SUBSTRING(myStr13, LOCATE(',', myStr13) + 1);

SET STR14 = SUBSTRING(myStr14, 1, LOCATE(',', myStr14) - 1);
SET myStr14 = SUBSTRING(myStr14, LOCATE(',', myStr14) + 1);

     
   
       INSERT INTO `member_research_details`
    				(mem_id,
                     r_university,                      
                     research, 
                     r_topic,  
                     r_institution,
                    r_country
                   /* achievement,
                    suggestion*/)
           
                            select v_m_id,                           
                     		STR10, 
                     		STR11,
                            STR12,
                    		 STR13,
                             STR14;
                             /*p_achievement,
                             p_suggestion;*/
       
  
           
                           
  END IF;
  
   

   END WHILE;
   
   
   
   
     WHILE (LOCATE(',', myStr16) > 0)
 DO
SET v_strLen4 = (SELECT LENGTH(TRIM(myStr16) > 0));

IF(v_strLen4 >0 )THEN

SET STR16 = SUBSTRING(myStr16, 1, LOCATE(',', myStr16) - 1);
SET myStr16 = SUBSTRING(myStr16, LOCATE(',', myStr16) + 1);

SET STR17 = SUBSTRING(myStr17, 1, LOCATE(',', myStr17) - 1);
SET myStr17 = SUBSTRING(myStr17, LOCATE(',', myStr17) + 1);



     
   
       INSERT INTO `member_achiev_info`
    				(mem_id,
                     achievement,                      
                     suggestion)
           
                            select v_m_id,                           
                     		STR16, 
                     		STR17;
                           
                             /*p_achievement,
                             p_suggestion;*/
       
  
           
                           
  END IF;
  
   

   END WHILE;
   
   
   
   
    INSERT INTO `member_publication_info`
    			(mem_id,
                 no_books,
                 no_artical,
                 no_research
                )
                 
                    		select v_m_id,  
                    		p_b_publish,
                             p_a_publish,
                             p_r_study;
                   			
                             
     
                             
    select p_p_mail as 'email_id', p_password as 'password' ,img_path, p_u_name,p_f_name,p_m_name,p_dob,p_mob,
    p_landmark as'parmament_address',validity;                         
   
   END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_renewal` (IN `p_user_id` INT)  NO SQL
BEGIN
UPDATE member_login a
SET
a.status =1,
a.validity =(SELECT date_add(now(), INTERVAL 1 year) )
WHERE a.mem_id=p_user_id;



END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `member_view` (IN `p_user_id` INT)  NO SQL
SELECT * FROM  member_login a , member_basic_info b ,member_achiev_info c
WHERE a.mem_id=p_user_id
and b.mem_id =a.mem_id AND
c.mem_id=b.mem_id AND
a.mem_id=c.mem_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_a_gs1_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=4$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_a_gs2_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=5$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_exe_member1_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=7$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_exe_member2_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=8$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_exe_member3_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=9$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_exe_member4_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=10$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_exe_member5_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=11$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_gs_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=3$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_list` ()  NO SQL
BEGIN
SELECT * FROM nomination_details a WHERE a.nominee_post=1;
SELECT * FROM nomination_details a WHERE a.nominee_post=2;
SELECT * FROM nomination_details a WHERE a.nominee_post=3;
SELECT * FROM nomination_details a WHERE a.nominee_post=4;
SELECT * FROM nomination_details a WHERE a.nominee_post=5;
SELECT * FROM nomination_details a WHERE a.nominee_post=6;
SELECT * FROM nomination_details a WHERE a.nominee_post=7;
SELECT * FROM nomination_details a WHERE a.nominee_post=8;
SELECT * FROM nomination_details a WHERE a.nominee_post=9;
SELECT * FROM nomination_details a WHERE a.nominee_post=10;
SELECT * FROM nomination_details a WHERE a.nominee_post=11;

end$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_president_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_treasurer_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=6$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominated_vice_president_list` ()  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_post=2$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nomination_all_details` (IN `p_user_id` INT)  NO SQL
SELECT * FROM nomination_details a WHERE a.nominee_m_id=p_user_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nomination_data_submission` (IN `p_n_name` VARCHAR(100), IN `p_n_post` INT, IN `p_n_mem_id` INT, IN `p_n_s_date` VARCHAR(100), IN `p_n_year` VARCHAR(100))  NO SQL
BEGIN
INSERT INTO `nomination_details`
			(nominee_name,
             nominee_post,
             nominee_m_id,            
             nomination_date,
             nomination_year)
             
              VALUES (
                        p_n_name,
                         p_n_post,
                         p_n_mem_id,
                         p_n_s_date,
                         p_n_year
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nomination_position_list` ()  NO SQL
SELECT * FROM `nomination_master` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nomination_position_wise_view` (IN `p_user_id` INT)  NO SQL
SELECT * FROM nomination_details a, nomination_master b WHERE a.nominee_post=p_user_id and a.nominee_post=b.n_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nomination_withdrawal_update` (IN `p_user_id` INT)  NO SQL
BEGIN
UPDATE nomination_details a
SET
a.active_flag =1

WHERE a.nominee_m_id=p_user_id;


END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `nominee_list` ()  NO SQL
SELECT * FROM `nomination_details` WHERE 1$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `total_member_in_system` ()  NO SQL
SELECT 
COUNT(a.mb_id) as total


FROM member_basic_info a$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `user_auth` (IN `u_id` VARCHAR(50), IN `pwd` VARCHAR(50))  NO SQL
BEGIN
    IF EXISTS
        (
        SELECT
            *
        FROM
            member_login a1
        WHERE
            a1.email_id = u_id
    ) THEN IF EXISTS(
    SELECT
        *
    FROM
        member_login a1
    WHERE
        a1.email_id = u_id AND a1.password = pwd
) THEN
SELECT
    1 AS output,
    a1.mem_id,
    a1.email_id AS user_email,
    a1.user_name,
    a1.phone_number
FROM
    member_login a1
WHERE
    a1.email_id = u_id AND a1.password = pwd; ELSE
SELECT
    u_id,
    -1 AS output;
END IF; ELSE
SELECT
    u_id,
    -2 AS output;
END IF;
END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `user_email_check2` (IN `p_email_id` VARCHAR(50))  NO SQL
SELECT COUNT(*) AS num FROM member_login a
WHERE a.email_id= p_email_id$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `vote_data_submit` (IN `p_user_id` INT, IN `p_p_vote` INT, IN `p_v_p_vote` INT, IN `p_a_gs1_vote` INT, IN `p_a_gs2_vote` INT, IN `p_t_vote` INT, IN `p_exe_mem1_vote` INT, IN `p_exe_mem2_vote` INT, IN `p_exe_mem3_vote` INT, IN `p_exe_mem4_vote` INT, IN `p_exe_mem5_vote` INT, IN `p_gs_vote` INT)  NO SQL
BEGIN
INSERT INTO `election_voting_details`
			(member_id,
             p_vote,
             v_p_vote,            
             gs_vote,
             a_gs1_vote,
             a_gs2_vote,
            t_vote,
            exe_mem1_vote,
            exe_mem2_vote,
            exe_mem3_vote,
            exe_mem4_vote,
            exe_mem5_vote,
            date
           )
             
              VALUES (
                        p_user_id,
                         p_p_vote,
                         p_v_p_vote,
                         p_gs_vote,
                         p_a_gs1_vote,
                 		 p_a_gs2_vote,
                  		p_t_vote,
                  		p_exe_mem1_vote,
                          p_exe_mem2_vote,
                          p_exe_mem3_vote,
                          p_exe_mem4_vote,
                          p_exe_mem5_vote,
                           now()
                           
                     );
                     
                     END$$

CREATE DEFINER=`purpu1ex`@`localhost` PROCEDURE `voting_result_pdf` ()  NO SQL
SELECT 
a.candidate_id,
a.count,
b.nominee_name,
b.nominee_post,
c.n_position
FROM election_voting_result a, nomination_details b ,nomination_master c 
WHERE a.candidate_id=b.n_d_id
and b.nominee_post=c.n_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_login`
--

CREATE TABLE `admin_login` (
  `user_id` int(11) NOT NULL,
  `mail` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_login`
--

INSERT INTO `admin_login` (`user_id`, `mail`, `user_name`, `password`) VALUES
(1, 'admin@gmail.com', 'Admin', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `alumni_aim`
--

CREATE TABLE `alumni_aim` (
  `aim_id` int(11) NOT NULL,
  `aims_objective_details` varchar(10000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alumni_aim`
--

INSERT INTO `alumni_aim` (`aim_id`, `aims_objective_details`) VALUES
(1, 'Alumni will serve as a link association Between Social Work dept AUS & Assam University as a whole.'),
(2, 'To render financial aid or scholarships to deserving students (those who are financially week) studying at the Social Work Department, Assam University. The selection process will be decided by the Executive community & Department jointly for one male & one female student.');

-- --------------------------------------------------------

--
-- Table structure for table `alumni_history_details`
--

CREATE TABLE `alumni_history_details` (
  `history_d_id` int(11) NOT NULL,
  `history_details` varchar(10000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `alumni_history_details`
--

INSERT INTO `alumni_history_details` (`history_d_id`, `history_details`) VALUES
(1, 'To organize and linkage the training programs & career counselling for young Social Workers of th department of Assam university.');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `directory_advisory_body`
--

CREATE TABLE `directory_advisory_body` (
  `d_a_id` int(11) NOT NULL,
  `patron_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `advisor1_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `advisor2_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `f_year` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `directory_executive_body`
--

CREATE TABLE `directory_executive_body` (
  `d_e_id` int(11) NOT NULL,
  `p_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `v_p_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `g_secretary_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `a_g_secretary_name1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `a_g_secretary_name2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `treasurer_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `executive_m_name1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `executive_m_name2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `executive_m_name3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `executive_m_name4` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `executive_m_name5` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `f_year` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `directory_executive_body`
--

INSERT INTO `directory_executive_body` (`d_e_id`, `p_name`, `v_p_name`, `g_secretary_name`, `a_g_secretary_name1`, `a_g_secretary_name2`, `treasurer_name`, `executive_m_name1`, `executive_m_name2`, `executive_m_name3`, `executive_m_name4`, `executive_m_name5`, `f_year`) VALUES
(1, 'Dr. Debrani Chandrani Choudhury', 'Mr. Rahul Ghose', 'Mr. Subhasish Chakraborty', 'Dr. Jayashree Dey', 'Mr. Parvez Majumdar', 'Mr. Soumen Das', 'Mr. Monoranjan Sutradhar', 'Dr. Aditi Nath', 'Mr. Samar Bijay Das', 'Dr. Bijay Das', 'Mr. Soumitra Malakar', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `directory_master`
--

CREATE TABLE `directory_master` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `possition` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `batch` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `directory_master`
--

INSERT INTO `directory_master` (`d_id`, `d_name`, `possition`, `img_path`, `batch`) VALUES
(1, 'Dr. Debrani Chandrani Choudhury', 'President	', 'dsfs', 'Batch 1998-2003'),
(2, 'Dr. Debrani  Choudhury', 'Vice President	', 'dsfs', 'Batch 1998-2003');

-- --------------------------------------------------------

--
-- Table structure for table `directory_speech`
--

CREATE TABLE `directory_speech` (
  `d_s_id` int(11) NOT NULL,
  `p_speech` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `gs_speech` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `president_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gs_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gs_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `f_year` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `directory_speech`
--

INSERT INTO `directory_speech` (`d_s_id`, `p_speech`, `gs_speech`, `president_name`, `gs_name`, `p_pic`, `gs_pic`, `f_year`) VALUES
(1, 'It is indeed my great pleasure to welcome among us the alumni of this institution. Not only is it a moment of happiness and nostalgia for us but also an opportunity to reflect on our learning and achievements. Our alumni have established themselves as successful individuals in almost every field of their lives, and we could not be any prouder.', 'It is indeed my great pleasure to welcome among us the alumni of this institution. Not only is it a moment of happiness and nostalgia for us but also an opportunity to reflect on our learning and achievements. Our alumni have established themselves as successful individuals in almost every field of their lives, and we could not be any prouder.', 'Dr. Debrani Chandrani Choudhury', 'Mr. Subhasish Chakraborty', '0', '0', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `election_master`
--

CREATE TABLE `election_master` (
  `e_id` int(11) NOT NULL,
  `election_sub` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `voting_active_flag` int(11) NOT NULL,
  `nomination_active_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `election_master`
--

INSERT INTO `election_master` (`e_id`, `election_sub`, `voting_active_flag`, `nomination_active_flag`) VALUES
(1, 'polls', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `election_voting_details`
--

CREATE TABLE `election_voting_details` (
  `e_voting_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_vote` int(11) NOT NULL,
  `v_p_vote` int(11) NOT NULL,
  `gs_vote` int(11) NOT NULL,
  `a_gs1_vote` int(11) NOT NULL,
  `a_gs2_vote` int(11) NOT NULL,
  `t_vote` int(11) NOT NULL,
  `exe_mem1_vote` int(11) NOT NULL,
  `exe_mem2_vote` int(11) NOT NULL,
  `exe_mem3_vote` int(11) NOT NULL,
  `exe_mem4_vote` int(11) NOT NULL,
  `exe_mem5_vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `election_voting_details`
--

INSERT INTO `election_voting_details` (`e_voting_id`, `member_id`, `date`, `time`, `p_vote`, `v_p_vote`, `gs_vote`, `a_gs1_vote`, `a_gs2_vote`, `t_vote`, `exe_mem1_vote`, `exe_mem2_vote`, `exe_mem3_vote`, `exe_mem4_vote`, `exe_mem5_vote`) VALUES
(1, 10, '2020-12-04 10:15:29', '', 12, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
(2, 11, '2020-12-04 10:15:29', '', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
(3, 13, '2020-12-04 10:15:29', '', 12, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11),
(4, 14, '2020-12-04 10:15:29', '', 12, 13, 14, 15, 5, 6, 7, 8, 9, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `election_voting_result`
--

CREATE TABLE `election_voting_result` (
  `id` int(11) NOT NULL,
  `voting_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `election_voting_result`
--

INSERT INTO `election_voting_result` (`id`, `voting_id`, `candidate_id`, `member_id`, `count`) VALUES
(1, 0, 1, 0, 1),
(2, 0, 2, 0, 3),
(3, 0, 3, 0, 3),
(4, 0, 4, 0, 3),
(5, 0, 5, 0, 4),
(6, 0, 6, 0, 4),
(7, 0, 7, 0, 4),
(8, 0, 8, 0, 4),
(9, 0, 9, 0, 4),
(10, 0, 10, 0, 4),
(11, 0, 11, 0, 4),
(12, 0, 12, 0, 3),
(13, 0, 13, 0, 1),
(14, 0, 14, 0, 1),
(15, 0, 15, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fees` int(11) NOT NULL,
  `form` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `published_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_date`, `event_name`, `location`, `fees`, `form`, `remarks`, `published_status`) VALUES
(1, '2020-11-20', 'Club Sponsorship 2015-2016', 'Gondomanan Street 209, Califor', 300, 'Gondomanan Street 20', 'Duis autem vel eum iriure dolor in hendrerit in vulputate velitesse molestie consequat, vel illum dolore eu feugiat. nulla facilisis at vero eros et accumsan. molestie consequat, vel illum dolore eu.', 0),
(2, '2020-11-20', 'Club Sponsorship ', 'Gondomanan ', 305, 'Gondomanan Street 20', 'Duis autem vel eum iriure dolor in hendrerit in vu', 0),
(3, '2021-01-22', 'Annual meet', 'jhargram', 1000, 'dsf', 'Meet all students.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `initiatives_master`
--

CREATE TABLE `initiatives_master` (
  `i_id` int(11) NOT NULL,
  `date_o_initiative` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `p_status` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `initiative_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date_o_completion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `suggested` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `team_members` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meeting_master`
--

CREATE TABLE `meeting_master` (
  `m_id` int(11) NOT NULL,
  `date_o_meeting` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `m_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `remarks` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meeting_master`
--

INSERT INTO `meeting_master` (`m_id`, `date_o_meeting`, `m_title`, `remarks`) VALUES
(1, '2020-11-19', 'New Beginnings. Endless Possibilities.', 'College is not just a four year journey. For many graduates, you have the opportunity to continually stay involved in your school through the Alumni Association.');

-- --------------------------------------------------------

--
-- Table structure for table `member_achiev_info`
--

CREATE TABLE `member_achiev_info` (
  `m_a_id` int(11) NOT NULL,
  `no_books` int(11) NOT NULL,
  `no_artical` int(11) NOT NULL,
  `no_research` int(11) NOT NULL,
  `achievement` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `suggestion` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_achiev_info`
--

INSERT INTO `member_achiev_info` (`m_a_id`, `no_books`, `no_artical`, `no_research`, `achievement`, `suggestion`, `mem_id`) VALUES
(1, 23, 24, 25, 'sdffssf', 'fsdssfd', 1),
(2, 3432, 23424, 23, 'bgf', 'gfdg', 2),
(3, 3, 3, 3, 'fgdg', 'gdfg', 3),
(4, 45456, 546, 465, 'dfghf', 'fgh', 4),
(5, 54, 45, 345, 'gxvcb', 'vcb', 5),
(6, 23, 4, 4, 'edfvg', 'vgggg', 6),
(7, 3, 3, 3, 'sagfsag', 'agsdg', 7),
(8, 2, 2, 2, 'zxcv', 'zxvz', 8),
(9, 422, 4, 24, 'gxzg', 'gdsfg', 9),
(10, 12, 14, 16, 'jhggggggfh fg', 'adfdsdf fgj', 10),
(11, 33, 33, 33, 'mnbbnlj', 'kkjlj', 11),
(12, 33, 33, 33, 'jkggjuh', 'klhjkhl', 12),
(13, 22, 233, 23, 'ukgkhh', 'jkhkjhk', 13),
(14, 33, 33, 33, 'hjfjhf', 'gjhg', 14),
(15, 33, 33, 33, 'cxvxcvx', 'xcbvcxb', 15),
(16, 22, 22, 22, 'fdfg', 'fgdgdg', 16),
(17, 4, 4, 4, 'bvxcb', 'xbvxb', 17),
(18, 344, 44, 4, 'vxv', 'zvcx', 18),
(19, 0, 1, 5, '', '', 19),
(20, 33, 23, 23, 'aaa', 'aaaaaaa', 20),
(21, 3, 3, 3, 'xhvb ', 'cvbncv', 22),
(22, 2, 2, 2, 'sfsdfsf', 'sdfsdfsd', 23),
(23, 3, 3, 3, ' vbcv', 'vcbcvb', 24),
(24, 23, 2, 2222, 'chgchnbv', 'gfhhhhjghj', 25),
(25, 1, 1, 1, 'hjjhfj', 'hikuh', 26),
(26, 2, 23, 2, 'vbcxcb', 'vcxbc', 27),
(27, 3, 3, 3, 'fdfg', 'dfgd', 28),
(28, 2, 22, 2, 'gdsxbc', 'bcv', 29),
(29, 4, 4, 2, 'ghf', 'gchfh', 30),
(30, 3, 3, 3, 'etsssssssss', 'dsfgsd', 31),
(31, 32, 3, 2, 'fh', 'dfh', 32),
(32, 3, 3, 3, 'xzv', 'zxvz', 33),
(33, 3, 3, 3, 'fdhdhdg', 'dhdfh', 34),
(34, 4, 4, 4, 'gfdg', 'fdgd', 35),
(35, 0, 0, 0, 'achiv1', 'sug1', 36),
(36, 0, 0, 0, 'achiv2', 'sug2', 36),
(37, 0, 0, 0, '', '', 36);

-- --------------------------------------------------------

--
-- Table structure for table `member_address_details`
--

CREATE TABLE `member_address_details` (
  `m_add_id` int(11) NOT NULL,
  `p_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_pin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `p_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_dist` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_address2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_pin1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_state2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_dist2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_country2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_address_details`
--

INSERT INTO `member_address_details` (`m_add_id`, `p_address`, `p_pin`, `p_state`, `p_dist`, `p_country`, `p_address2`, `p_pin1`, `p_state2`, `p_dist2`, `p_country2`, `mem_id`) VALUES
(1, 'sfa', '', 'ghgc', 'sdfsdf', 'sdf', 'sfa', '', 'Alberta', 'sdfsdf', 'sdf', 22),
(2, 'dsd', '', 'dfssdf', 'sdfs', 'dsfsdf', 'dsd', '', 'Newfoundland And Labrador', 'sdfs', 'dsfsdf', 23),
(3, 'jhg', '', 'vcbc', 'sgsffff', 'cxbb', 'jhg', '', 'Newfoundland And Labrador', 'sgsffff', 'cxbb', 24),
(4, 'kapsfa', '', 'fgh', '23e2', 'India', 'kapsfa', '', 'New Brunswick', '23e2', 'India', 25),
(5, 'jhgsfa', '', 'Manitoba', '23e2', 'India', 'jhgsfa', '', 'Newfoundland And Labrador', '23e2', 'India', 26),
(6, 'bfchcbvn', '', 'cxvbc', 'bvnbv', 'vbnv', 'bfchcbvn', '', 'Andhra Pradesh', 'bvnbv', 'vbnv', 27),
(7, 'asdaasdd', 'asd', 'fgs', 'ad', '', 'asdaasdd', 'R9A', 'Andhra Pradesh', 'ad', '', 28),
(8, 'fsdsdgs', 'gg', 'Andhra Pradesh', 'sgd', 'sgs', 'fsdsdgs', 'gg', 'Andhra Pradesh', 'sgd', 'sgs', 29),
(9, 'jhg', 'A8A', 'Andhra Pradesh', '', '', 'jhg', 'A8A', 'Andhra Pradesh', '', '', 30),
(10, 'jhg', 'P9N', 'Andhra Pradesh', '', '', 'jhg', 'P9N', 'Andhra Pradesh', '', '', 31),
(11, 'jhg', 'A8A', 'Andhra Pradesh', '', '', 'jhg', 'A8A', 'Andhra Pradesh', '', '', 32),
(12, 'jhg', '', 'Andhra Pradesh', '', '', 'jhg', '', 'Andhra Pradesh', '', '', 33),
(13, 'jhg', '', 'Andhra Pradesh', '', '', 'jhg', '', 'Andhra Pradesh', '', '', 34),
(14, 'jhgdrgd', '1332334', 'Andhra Pradesh', 'gdfg', 'dfg', 'jhgdrgd', '1332334', 'Andhra Pradesh', 'gdfg', 'dfg', 35),
(15, 'jhgjhg', '721505', 'Andhra Pradesh', 'jhargram', 'india', 'jhgjhg', '721505', 'Andhra Pradesh', 'jhargram', 'india', 36);

-- --------------------------------------------------------

--
-- Table structure for table `member_basic_info`
--

CREATE TABLE `member_basic_info` (
  `mb_id` int(11) NOT NULL,
  `mem_type` int(11) NOT NULL,
  `mem_reg_no` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `mem_name` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `father_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mother_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `m_age` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mem_submission_date` date NOT NULL,
  `parmanent_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `present_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mob` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `altr_mob` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `permanent_mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `official_mail` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `batch_year_id` int(11) NOT NULL,
  `img_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `from_year` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `to_year` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_basic_info`
--

INSERT INTO `member_basic_info` (`mb_id`, `mem_type`, `mem_reg_no`, `mem_name`, `father_name`, `mother_name`, `dob`, `m_age`, `gender`, `mem_submission_date`, `parmanent_address`, `present_address`, `mob`, `altr_mob`, `permanent_mail`, `official_mail`, `batch_year_id`, `img_path`, `from_year`, `to_year`, `mem_id`) VALUES
(1, 1, '1', 'sourav patra', 'aswgdg', 'fgfdh', '2020-10-26', '32', '', '2020-10-18', 'jhg', 'kap', '2147483647', '666666666', 'souravpatra396@gmail', '', 1, '', '', '', 1),
(2, 1, '1', 'ds', 'sfsdf', 'fsdfs', '2020-10-19', '23', '', '0000-00-00', 'jhg', 'kap', '1231234334', '455556666', 'souravpatra396@gmail', 'souravpatradd396@gma', 1, '', '', '', 2),
(3, 1, '1', 'rewr', 'ewewrr', 'wer', '0000-00-00', '', '', '0000-00-00', 'werwr', 'werw', '0', '0', 'spoo@gamil.com', 'ss@gamila.com', 1, '', '', '', 3),
(4, 1, '1', 'ryey', 'try', 'try', '0000-00-00', '', '', '0000-00-00', 'ryr', 'yr', '2147483647', '2147483647', 'member@member.com', 'tr@esrhyrdt', 1, '', '', '', 4),
(5, 1, '1', 'dhononjoy', '', '', '2020-10-17', 'xzvzvxz', '', '2020-10-28', 'vxcx', 'xcvv', '432524535', '2147483647', 'fdh@fds', 'dfw@sdfgfd', 1, '', '', '', 5),
(6, 1, '1', 'jgfj', 'jfgj', 'jghj', '0000-00-00', '', '', '0000-00-00', '', '', '132', '321', 'xdf@!wvtr', 'tgd@dhf', 1, '', '', '', 6),
(7, 1, '1', 'hjkasfhkf', 'afasfaf', 'asdfaf', '2020-10-21', '44', '', '2020-11-06', '', '', '231', '132', 'fasda@dssfgs', 'asgfs@fsdaf', 1, 'jpg', '', '', 7),
(8, 1, '1', 'ksdgfdsg', 'hggg', 'fgh', '2020-10-24', '44', '', '2020-10-24', 'cfg', 'hgh', '111', '111', 'fghd@hhfg', 'hfg@hgdhd', 1, 'png', '', '', 8),
(9, 1, '1', 'hghhgf', 'hgjhgj', 'hgjghjgj', '2020-10-22', '33', '', '2020-10-22', 'sdtgsre', 'sgs', '2131312321', '2147483647', 'k@gmail.com', 'k@gmail.com', 1, 'png', '', '', 9),
(10, 1, '1', 'sourav patra', 'ravi kishan patra', 'kalpana patra', '2020-10-24', '25', '', '2020-10-22', 'jhg', 'kapgari', '123', '452', 'souravpatra396@gmail', 'sourav@gmail.com', 1, 'jpeg', '', '', 10),
(11, 1, '1', 'k das', '', '', '2020-11-24', '33', '', '2020-11-25', 'jhg', 'A8A', '455', '122', 'kkkkkk@gmail.com', 'k@gmail.com', 1, '', '', '', 11),
(12, 1, '1', 'janshon reo', 'gvcxv', 'gfdgfd', '2020-11-28', '33', '', '2020-11-27', 'jhg', 'V9Zghh', '123', '155', 'so@gmail.com', 'souravpatra396@gmail', 1, '', '', '', 12),
(13, 1, '1', 'sourav das', 'gdg', 'sadfs', '0000-00-00', '', '', '0000-00-00', 'jkhsyhs', 'P9N', '458', '458', 'ka2122@gmail.com', 'ka2@gmail.com', 1, '', '', '', 13),
(14, 1, '1', 'jans reo', 'gvcxv', 'gfdgfd', '2020-11-27', '33', '', '2020-11-28', 'jhg', 'V9Zghh', '458', '458', 'so2@gmail.com', 'sou6@gmail.com', 1, '', '', '', 14),
(15, 1, '1', 'gdsg', 'dfsdf', 'dfg', '2020-12-12', '23', '', '2020-12-11', 'cxcb', 'cbcb', '2147483647', '0', 'abbb@gmail.com', 'avb@gmail.com', 1, 'jpeg', '', '', 15),
(16, 1, '1', 'sou', 'pritam', 'kalpana', '2020-12-25', '23', '', '2020-12-24', 'ddfdfd', 'dfd', '122', '122', 'rahidddm@gmil.com', 'raddhim@gmil.com', 1, 'jpeg', '', '', 16),
(17, 1, '1', 'fgg', 'tsdgs', 'fgsdg', '2020-12-11', '55', '', '2020-12-03', 'fh', 'xfhgx', '112', '112', 'sdhfgh@gmail.com', 'sd@ffhgmail.com', 1, 'jpg', '', '', 17),
(18, 1, '1', 'jsks', 'dsadsad', 'adsad', '2020-12-12', '33', '', '2020-12-10', 'dsf', 'sfdf', '112', '112', 'sff@gmail.com', 'sddd@gmail.com', 1, 'jpg', '', '', 18),
(19, 1, '1', 'Subhasish Chakraborty', 'Late Sankar Chakraborty', 'Sushmita Chakraborty', '1983-10-16', '37', '', '2020-12-06', 'College road silchar', 'College road silchar', '831', '0', 'subhasishchakraborty', 's.chakraborty@hpppl.', 1, 'jpg', '', '', 19),
(20, 1, '1', 'Mr. santu das', '', '', '1999-02-09', '21', 'Male', '0000-00-00', '0', '0', '458-545-8557', '458-545-8554', 's@gmail.com', 's@gmail.com', 1, 'jpg', '', '', 20),
(21, 1, '1', 'Dr. shibu ', 'aswabtf', 'cfffff', '2005-01-13', '15', 'Female', '2020-12-09', '0', '0', '475-855-5586', '475-855-5586', 'rahimrr@gmil.com', 'rahim@gmil.com', 1, 'jpg', '', '', 21),
(22, 1, '1', 'Dr. fsfdsf ', 'ffdgf', 'gd', '2017-03-21', '3', 'Female', '2020-12-09', '0', '0', '123-234-3443', '123-234-3443', 'sfdsggg@fsd', 'sfds@fsd', 1, '', '', '', 22),
(23, 1, '1', 'Dr. sachin dhube', 'kamlesh dhube', 'rani dhube', '1999-02-17', '21', 'Male', '2020-12-09', '0', '0', '123-123-4334', '123-123-4334', 'add@gmail.com', 'aww@gmail.com', 1, 'jpg', '', '', 23),
(24, 1, '1', 'Dr. ZSxZcxzczxc', 'zxczc', 'zxczc', '2017-06-10', '3', 'Male', '2020-12-10', '0', '0', '112-111-1121', '112-111-1121', 'a@gmail.com', 'a@gmail.com', 1, 'jpg', '', '', 24),
(25, 1, '1', 'Dr. rahim dasfffffffffffffff', 'gvcxv', 'ERWS', '2020-12-10', '0', 'Male', '2020-12-10', '0', '0', '456-666-6665', '456-666-6665', 'rahim@gmil.com', 'rahim@gmil.com', 1, 'jpg', '', '', 25),
(26, 1, '1', 'Dr. souravdhube', 'gvcxv', 'sadfs', '1990-07-19', '30', 'Male', '2020-12-10', '0', '0', '123-123-4334', '', 'souravpatra396@gmail', 'a@gmail.com', 1, 'jpg', '', '', 26),
(27, 1, '1', 'Mr. sanjoydas', 'probin das', 'jdjjdsab das', '2009-06-25', '11', 'Male', '2020-12-14', '0', '0', '455-555-5555', '', 'kshshjs@gmail.com', 'k@gmail.com', 1, 'jpeg', '', '', 27),
(28, 1, '1', 'Dr. dssdf', 'sdf', 'sdf', '2020-12-17', '0', 'Male', '2020-12-14', '0', '0', '458-545-8551', '458-545-8554', 'sd@gmail.com', 'sd@gmail.com', 1, 'jpeg', '', '', 28),
(29, 1, '1', 'Dr. wadasadfs', 'sdf', 'sdfs', '2020-12-14', '0', 'Male', '2020-12-14', '0', '0', '455-555-5555', '455-555-5555', 'sfds@fsd', 'sfds@fsd', 1, 'jpeg', '', '', 29),
(30, 1, '1', 'Dr. DFSFDFGFD', 'DFG', 'dfg', '2020-11-30', '0', 'Female', '2020-12-14', '0', '0', '455-555-5555', '', 'kgfdg@gmail.com', 'k@gmail.com', 1, '13', '', '', 30),
(31, 1, '1', 'Dr. dfsfsfssf', 'sfdf', 'sdf', '2020-11-29', '0', 'Male', '2020-12-14', '0', '0', '112-222-2222', '112-222-2222', 'sgdg@gmail.com', 's@gmail.com', 1, '13', '', '', 31),
(32, 1, '1', 'Dr. dfssdf', 'sdf', 'sfd', '2020-11-29', '0', 'Male', '2020-12-14', '0', '0', '112-111-1121', '112-111-1121', 'kffddff@gmail.com', 'k@gmail.com', 1, '13', '', '', 32),
(33, 1, '1', 'Dr. souravsdad', 'asd', 'sdaa', '2020-12-04', '0', 'Male', '2020-12-14', '0', '0', '112-222-2222', '', 'sdsa@gmail.com', 's@gmail.com', 1, '33.jpeg', '', '', 33),
(34, 1, '1', 'Dr. souravdaf', 'df', 'dsF', '2020-12-07', '0', 'Male', '2020-12-14', '0', '0', '112-222-2222', '', 'sfdsfs@gmail.com', 's@gmail.com', 1, '34.13', '', '', 34),
(35, 1, '1', 'Dr. dgsdfdfg', 'dfgd', 'dfgd', '2020-12-08', '0', 'Male', '2020-12-15', '0', '0', '112-222-2222', '112-222-2222', 'sgfggf@gmail.com', 's@gmail.com', 1, '35.13', '1998', '2007', 35),
(36, 1, '1', 'Dr. sachin sahrama', 'kamalesh dhiube', 'rinku dhube', '2020-12-05', '0', 'Male', '2020-12-18', '0', '0', '458-545-8557', '', 'aggg@gmail.com', 'a@gmail.com', 1, '36.jpeg', '1998', '2000', 36);

-- --------------------------------------------------------

--
-- Table structure for table `member_educational_info`
--

CREATE TABLE `member_educational_info` (
  `medu_id` int(11) NOT NULL,
  `degree` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `clg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `board` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `y_of_passing` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `possition` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `no_books` int(11) NOT NULL,
  `no_artical` int(11) NOT NULL,
  `no_research` int(11) NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_educational_info`
--

INSERT INTO `member_educational_info` (`medu_id`, `degree`, `clg`, `board`, `y_of_passing`, `possition`, `no_books`, `no_artical`, `no_research`, `mem_id`) VALUES
(1, 'gcect', 'b.tech', '', '2013', 'dsg', 0, 0, 0, 1),
(2, 'gcelt', 'm.tech', '', '2020', '2', 0, 0, 0, 1),
(3, 'sfs', 'sdf', '', 'sdf', 'sdf', 0, 0, 0, 2),
(4, 'dfs', 'sfs', '', 'sf', '2', 0, 0, 0, 3),
(5, 'rty', 'rty', '', 'ytr', 'yrt', 0, 0, 0, 4),
(6, 'gsdfhfsh', 'dfgd', '', 'hhgfh', '2', 0, 0, 0, 5),
(7, 'ghdfh', 'b.tech', '', '2020', '2', 0, 0, 0, 6),
(8, 'fdsg', 'dsfg', '', '2020', '2', 0, 0, 0, 7),
(9, 'dsf', 'af', '', 'saf', 'saf', 0, 0, 0, 8),
(10, 'afgs', 'dedaf', '', '4324', '242', 0, 0, 0, 9),
(11, 'gcect', 'b.tceh', '', '2017', '1st division', 0, 0, 0, 10),
(12, 'gcect', 'm.tech', '', '2020', '2nd', 0, 0, 0, 10),
(13, 'gclt', 'b.tech', '', '2013', '2', 0, 0, 0, 11),
(14, 'ghhh', 'b.tech', '', '2013', '2', 0, 0, 0, 12),
(15, 'gclt', 'b.tech', '', '2013', '2', 0, 0, 0, 13),
(16, 'sourav pat', '33', '', '2013', '2', 0, 0, 0, 14),
(17, 'gclt', 'b.tech', '', '2013', '2', 0, 0, 0, 15),
(18, 'ddddddd', 'dd', '', 'dds', 'dd', 0, 0, 0, 16),
(19, 'fghds', 'shs', '', 'sh', 'shs', 0, 0, 0, 17),
(20, 'sffsf', 'sfs', '', 'sfsf', 'sdfs', 0, 0, 0, 18),
(21, 'Assam Univ', 'Master in Social Wor', '', '2010', '1st Class', 0, 0, 0, 19),
(22, 'Assam Univ', 'Bachelor in Social W', '', '2008', '2nd Class', 0, 0, 0, 19),
(23, 'ghhhjjja', 'aaaa', '', 'aaaa', 'aa', 0, 0, 0, 20),
(24, 'dsfs', 'sdfs', '', 'fdsf', 'sdf', 0, 0, 0, 22),
(25, 'dfssdf', 'sdf', '', 'sdf', 'sfd', 0, 0, 0, 23),
(26, 'sdfsd', 'ff', '', 'fffff', 'fff', 0, 0, 0, 23),
(27, 'xcvxv', 'Phd ', '', 'xcv', '2', 0, 0, 0, 24),
(28, 'xvcxv', 'MPhil', '', 'xvcx', 'xcvx', 0, 0, 0, 24),
(29, 'fgxg', 'others', '', 'hfgh', 'fghf', 0, 0, 0, 25),
(30, 'sourav', 'Phd ', '', '2013', '2', 0, 0, 0, 26),
(31, 'gcect', 'MSW', '', '2013', '2', 0, 0, 0, 27),
(32, 'k das', 'others', '', '2013', '2', 0, 0, 0, 28),
(33, 'Phd ', 'sf', '', 'sdf', 'sdf', 0, 0, 0, 29),
(34, 'others', 'dfgd', '', 'dgf', 'dfg', 0, 0, 0, 30),
(35, 'Phd ', 'sdgs', '', 'sdg', 'sdg', 0, 0, 0, 31),
(36, 'others', 'sfdsf', '', 'sdfs', 'sdf', 0, 0, 0, 32),
(37, 'Phd ', 'sda', '', 'sds', 'ssssssss', 0, 0, 0, 33),
(38, 'MPhil', 'sdfdsf', 'Silchar', 'dzgs', 'zsdg', 0, 0, 0, 34),
(39, 'MPhil', 'dfg', 'Silchar', 'dfg', 'dgdf', 0, 0, 0, 35),
(40, 'MPhil', 'serchia', 'Assam University Silchar ', '2013', '2', 0, 0, 0, 36);

-- --------------------------------------------------------

--
-- Table structure for table `member_job_info`
--

CREATE TABLE `member_job_info` (
  `mjob_id` int(11) NOT NULL,
  `org_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dist` text COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `experience` int(11) NOT NULL,
  `achievement` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `suggestion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_job_info`
--

INSERT INTO `member_job_info` (`mjob_id`, `org_name`, `state`, `dist`, `designation`, `experience`, `achievement`, `suggestion`, `mem_id`) VALUES
(1, 'tcs', 'wb', 'jhg', 'devloper', 2, '', '', 1),
(2, 'ibm', 'wb', 'jhg', 'dd', 3, '', '', 1),
(3, 'tcs', '435', '2352', '2', 5, '', '', 2),
(4, 'gfdg', 'gf', 'fffffff', 'd', 2, '', '', 3),
(5, 'fghn', 'gfh', 'fgj', 'fj', 5, '', '', 4),
(6, 'fdgfd', 'dfg', 'dg', 'dgd', 4, '', '', 5),
(7, 'tcs', 'wb', 'jhg', 'sw', 3, '', '', 6),
(8, 'dss', 'gs', 'sdg', 'gs', 3, '', '', 7),
(9, '22', '3', '3', '3', 3, '', '', 8),
(10, 'fdgdf', 'ggf', 'dg', 'dg', 4, '', '', 9),
(11, 'tcs', 'wb', 'jhg', 'devloper', 2, '', '', 10),
(12, 'ibm', 'wb', 'jhg', 'devloper', 4, '', '', 10),
(13, 'sou pvt.ltd', 'Newfoundland And Labrador', '3', 'fgd', 5, '', '', 11),
(14, 'sou pvt.ltd', 'Newfoundland And Labrador', 'ddd', 'fgd', 2, '', '', 12),
(15, 'sou pvt.ltd', 'Newfoundland And Labrador', '3', '3', 2, '', '', 13),
(16, 'sou pvt.ltd', 'Ontario', '3', '3', 3, '', '', 14),
(17, 'sou pvt.ltd', 'Newfoundland And Labrador', 'fhfd', 'dhd', 4, '', '', 15),
(18, 'ggd', 'dgfd', 'dfg', 'fdg', 2, '', '', 16),
(19, 'xczb', 'xbv', 'xbvx', 'b45', 44, '', '', 17),
(20, 'xcv', 'xcv', 'xvx', 'vxv', 4, '', '', 18),
(21, 'Hindustan Power projects Pvt Ltd', 'MP', 'Anuppur', 'Assistent Manager', 5, '', '', 19),
(22, 'Rudravhishek Enterprise Pvt. Ltd.', 'Odisa', 'Cuttak', 'Social development Specialist', 1, '', '', 19),
(23, 'sou pvt.ltd', 'Ontario', 'aaaa', 'aaaa', 2, '', '', 20),
(24, '333vcxh', 'ghgc', 'gchch', 'gfxh', 55, '', '', 22),
(25, 'dsf', 'dfssdf', 'sdfsdf', 'xcv', 2, '', '', 23),
(26, 'xbv', 'vcbc', 'bxc', 'v b', 4, '', '', 24),
(27, 'hgfh', 'fgh', 'fgh', 'fghjfg', 4, '', '', 25),
(28, 'sou pvt.ltd', 'Manitoba', 'ddd', '3', 1, '', '', 26),
(29, 'bcvbx', 'cxvbc', 'bxxvb', 'bvcxb', 4, '', '', 27),
(30, 'fxcb', 'fgs', 'fdsg', 'fdg', 4, '', '', 28),
(31, 'fgb', 'dfg', 'dfg', 'dfg', 4, '', '', 29),
(32, 'gj', 'jf', 'fjf', 'jff', 5, '', '', 30),
(33, 'fh', 'Arunachal Pradesh', 'fgh', 'cfhd', 4, '', '', 31),
(34, 'hffh', 'Bihar', 'gfh', 'fh', 4, '', '', 31),
(35, '23', 'Andhra Pradesh', 'fh', '3', 1, '', '', 32),
(36, 'cxzx', 'Andhra Pradesh', 'xzcv', 'xc', 4, '', '', 33),
(37, 'gdx', 'Goa', 'xh', 'xfh', 5, '', '', 34),
(38, 'fdghd', 'Andhra Pradesh', 'dfg', 'ddf', 4, '', '', 35),
(39, 'dgd', 'Andhra Pradesh', 'dgg', 'dfg', 3, '', '', 36);

-- --------------------------------------------------------

--
-- Table structure for table `member_login`
--

CREATE TABLE `member_login` (
  `mem_id` int(11) NOT NULL,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `validity` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_login`
--

INSERT INTO `member_login` (`mem_id`, `user_name`, `email_id`, `phone_number`, `password`, `status`, `validity`) VALUES
(1, 'sourav patra', 'souravpatra39@gmail.com', '', 'e35f29d8', 1, '2021-11-19'),
(2, 'ds', 'souravpatra6@gmail.com', '31234324234', 'sou123', 1, '0000-00-00'),
(3, 'rewr', 'spoo@gamil.com', '', '456bfd1f', 1, '0000-00-00'),
(4, 'ryey', 'member@member.com', '3534334544', '12345', 1, '0000-00-00'),
(5, '', 'fdh@fds', '432524535', '32dd6273', 1, '0000-00-00'),
(6, 'jgfj', 'xdf@!wvtr', '132-331-1344', '60d0d204', 1, '0000-00-00'),
(7, 'hjkasfhkf', 'fasda@dssfgs', '231-321-1212', '9ee48f4b', 1, '0000-00-00'),
(8, 'ksdgfdsg', 'fghd@hhfg', '111-111-1111', '9e8e1c66', 1, '0000-00-00'),
(9, 'hghhgf', 'k@gmail.com', '2131312321', 'a13d8616', 1, '0000-00-00'),
(10, 'sourav patra', 'souravpatra396@gmail.com', '123-123-4334', '12345', 1, '2021-11-30'),
(11, 'k das', 'kkkkkk@gmail.com', '455-555-5555', 'f6b0c00d', 1, '0000-00-00'),
(12, 'janshon reo', 'so@gmail.com', '123-123-4334', 'f156f693', 1, '0000-00-00'),
(13, 'sourav das', 'ka2122@gmail.com', '458-545-8554', 'ed82593b', 1, '0000-00-00'),
(14, 'jans reo', 'so2@gmail.com', '458-545-8554', '1c368db4', 1, '0000-00-00'),
(15, 'gdsg', 'abbb@gmail.com', '4585458554', '6de1cbfa', 1, '0000-00-00'),
(16, 'sou', 'rahidddm@gmil.com', '122-222-2222', '43f5138f', 1, '0000-00-00'),
(17, 'fgg', 'sdhfgh@gmail.com', '112-222-2222', '22aad725', 1, '0000-00-00'),
(18, 'jsks', 'sff@gmail.com', '112-222-2222', 'c0ac3bf6', 1, '2021-12-03'),
(19, 'Subhasish Chakrabort', 'subhasishchakraborty777m@gmail.com', '831-955-3379', '6689b8c2', 1, '2021-12-06'),
(20, 'Mr. santu das', 's@gmail.com', '458-545-8557', '13af5c1e', 1, '2021-12-09'),
(21, 'Dr. shibu ', 'rahimrr@gmil.com', '475-855-5586', '5388cd98', 1, '2021-12-09'),
(22, 'Dr. fsfdsf ', 'sfdsggg@fsd', '123-234-3443', 'b5a4a3ef', 1, '2021-12-09'),
(23, 'Dr. sachin dhube', 'add@gmail.com', '123-123-4334', '007abab1', 1, '2021-12-09'),
(24, 'Dr. ZSxZcxzczxc', 'a@gmail.com', '112-111-1121', '8845a4d7', 1, '2021-12-10'),
(25, 'Dr. rahim dasfffffff', 'rahim@gmil.com', '456-666-6665', 'f120aad2', 1, '2021-12-10'),
(26, 'Dr. souravdhube', 'souravpatra396@gmail.com', '123-123-4334', '7cebbda1', 1, '2021-12-10'),
(27, 'Mr. sanjoydas', 'kshshjs@gmail.com', '455-555-5555', '65a9e609', 1, '2021-12-14'),
(28, 'Dr. dssdf', 'sd@gmail.com', '458-545-8551', 'a9bbaab3', 1, '2021-12-14'),
(29, 'Dr. wadasadfs', 'sfds@fsd', '455-555-5555', '37aacac4', 1, '2021-12-14'),
(30, 'Dr. DFSFDFGFD', 'kgfdg@gmail.com', '455-555-5555', '2fe30d67', 1, '2021-12-14'),
(31, 'Dr. dfsfsfssf', 'sgdg@gmail.com', '112-222-2222', 'f1e2095e', 1, '2021-12-14'),
(32, 'Dr. dfssdf', 'kffddff@gmail.com', '112-111-1121', '2ad76345', 1, '2021-12-14'),
(33, 'Dr. souravsdad', 'sdsa@gmail.com', '112-222-2222', 'ff4d6571', 1, '2021-12-14'),
(34, 'Dr. souravdaf', 'sfdsfs@gmail.com', '112-222-2222', '79eb36f3', 1, '2021-12-14'),
(35, 'Dr. dgsdfdfg', 'sgfggf@gmail.com', '112-222-2222', '820ba7bb', 1, '2021-12-15'),
(36, 'Dr. sachin sahrama', 'aggg@gmail.com', '458-545-8557', '510f15b2', 1, '2021-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `member_publication_info`
--

CREATE TABLE `member_publication_info` (
  `m_p_id` int(11) NOT NULL,
  `no_books` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `no_artical` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `no_research` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_research_details`
--

CREATE TABLE `member_research_details` (
  `m_r_id` int(11) NOT NULL,
  `r_university` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `research` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `r_topic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `r_institution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `r_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_research_details`
--

INSERT INTO `member_research_details` (`m_r_id`, `r_university`, `research`, `r_topic`, `r_institution`, `r_country`, `mem_id`) VALUES
(1, 'fdsf', 'sfdsf', 'fsdfsd', 'dsf', '', 23),
(2, 'sdfs', 'sdf', 'sdfs', 'sdf', '', 23),
(3, 'xcvx', 'xcv', 'cxv', 'cxvx', '', 24),
(4, 'fgh', 'Phd ', 'hgfh', 'fhgf', '', 25),
(5, 'janshon reo', 'MPhil', 'fsdfsd', 'sou de', '', 26),
(6, 'gcect', 'Phd ', 'hfdsfg', 'gfdgds', '', 27),
(7, 'sdf', 'MPhil', 'fdsf', 'dsf', '', 28),
(8, 'sfd', 'MPhil', 'sfd', 'sfd', '', 29),
(9, 'dfg', 'Phd ', 'dfg', 'dgf', '', 30),
(10, 'sg', 'MPhil', 'sgs', 'sg', '', 31),
(11, 'sdf', 'Phd ', 'fds', 'sdf', '', 32),
(12, 'sd', 'MPhil', 'sd', 'sd', '', 33),
(13, 'zdggg', 'MPhil', 'zdg', 'zg', '', 34),
(14, 'dfg', 'MPhil', 'dfg', 'dg', '', 35),
(15, 'gdgg', 'Phd ', 'gdfg', 'gfdg', 'fdg', 36);

-- --------------------------------------------------------

--
-- Table structure for table `member_subscription`
--

CREATE TABLE `member_subscription` (
  `ms_id` int(11) NOT NULL,
  `fees` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `pay_method` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `subsc_srt_dt` date NOT NULL,
  `subsc_end_dt` date NOT NULL,
  `mem_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nomination_details`
--

CREATE TABLE `nomination_details` (
  `n_d_id` int(11) NOT NULL,
  `nominee_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nominee_post` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nominee_m_id` int(11) NOT NULL,
  `nomination_date` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nomination_year` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active_flag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nomination_details`
--

INSERT INTO `nomination_details` (`n_d_id`, `nominee_name`, `nominee_post`, `nominee_m_id`, `nomination_date`, `nomination_year`, `active_flag`) VALUES
(1, 'pritam roy', '1', 10, '2020-11-14', '2020', 1),
(2, 'sanjib das', '2', 5, '2020-11-14', '2020', 1),
(3, 'ram roy', '3', 16, '2020-11-14', '2020', 1),
(4, 'rahim das', '4', 11, '2020-11-14', '2020', 1),
(5, 'pritam das', '5', 12, '2020-11-14', '2020', 1),
(6, 'santu das', '6', 13, '2020-11-14', '2020', 1),
(7, 'santu das', '7', 14, '2020-11-14', '2020', 1),
(8, 'avik das', '8', 15, '2020-11-14', '2020', 1),
(9, 'bumba das', '9', 16, '2020-11-14', '2020', 1),
(10, 'kousik das', '10', 17, '2020-11-14', '2020', 1),
(11, 'samir das', '11', 18, '2020-11-14', '2020', 1),
(12, 'sou das', '1', 21, '2020-11-14', '2020', 1),
(13, 'kobir das', '2', 22, '2020-11-14', '2020', 1),
(14, 'sunita  das', '3', 22, '2020-11-14', '2020', 1),
(15, 'rimiki  das', '4', 22, '2020-11-14', '2020', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nomination_master`
--

CREATE TABLE `nomination_master` (
  `n_id` int(11) NOT NULL,
  `n_position` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `nomination_master`
--

INSERT INTO `nomination_master` (`n_id`, `n_position`) VALUES
(1, 'President'),
(2, 'Vice President '),
(3, 'Gen Secretary '),
(4, 'Asst Gen. Sec.-1  '),
(5, 'Asst Gen. Sec.-2 '),
(6, 'Treasurer '),
(7, 'Executive Member-1'),
(8, 'Executive Member-2	'),
(9, 'Executive Member-3'),
(10, 'Executive Member-4'),
(11, 'Executive Member-5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Indexes for table `alumni_aim`
--
ALTER TABLE `alumni_aim`
  ADD PRIMARY KEY (`aim_id`);

--
-- Indexes for table `alumni_history_details`
--
ALTER TABLE `alumni_history_details`
  ADD PRIMARY KEY (`history_d_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `directory_advisory_body`
--
ALTER TABLE `directory_advisory_body`
  ADD PRIMARY KEY (`d_a_id`);

--
-- Indexes for table `directory_executive_body`
--
ALTER TABLE `directory_executive_body`
  ADD PRIMARY KEY (`d_e_id`);

--
-- Indexes for table `directory_master`
--
ALTER TABLE `directory_master`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `directory_speech`
--
ALTER TABLE `directory_speech`
  ADD PRIMARY KEY (`d_s_id`);

--
-- Indexes for table `election_master`
--
ALTER TABLE `election_master`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `election_voting_details`
--
ALTER TABLE `election_voting_details`
  ADD PRIMARY KEY (`e_voting_id`);

--
-- Indexes for table `election_voting_result`
--
ALTER TABLE `election_voting_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `initiatives_master`
--
ALTER TABLE `initiatives_master`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `meeting_master`
--
ALTER TABLE `meeting_master`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `member_achiev_info`
--
ALTER TABLE `member_achiev_info`
  ADD PRIMARY KEY (`m_a_id`);

--
-- Indexes for table `member_address_details`
--
ALTER TABLE `member_address_details`
  ADD PRIMARY KEY (`m_add_id`);

--
-- Indexes for table `member_basic_info`
--
ALTER TABLE `member_basic_info`
  ADD PRIMARY KEY (`mb_id`);

--
-- Indexes for table `member_educational_info`
--
ALTER TABLE `member_educational_info`
  ADD PRIMARY KEY (`medu_id`);

--
-- Indexes for table `member_job_info`
--
ALTER TABLE `member_job_info`
  ADD PRIMARY KEY (`mjob_id`);

--
-- Indexes for table `member_login`
--
ALTER TABLE `member_login`
  ADD PRIMARY KEY (`mem_id`);

--
-- Indexes for table `member_publication_info`
--
ALTER TABLE `member_publication_info`
  ADD PRIMARY KEY (`m_p_id`);

--
-- Indexes for table `member_research_details`
--
ALTER TABLE `member_research_details`
  ADD PRIMARY KEY (`m_r_id`);

--
-- Indexes for table `member_subscription`
--
ALTER TABLE `member_subscription`
  ADD PRIMARY KEY (`ms_id`);

--
-- Indexes for table `nomination_details`
--
ALTER TABLE `nomination_details`
  ADD PRIMARY KEY (`n_d_id`);

--
-- Indexes for table `nomination_master`
--
ALTER TABLE `nomination_master`
  ADD PRIMARY KEY (`n_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_login`
--
ALTER TABLE `admin_login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `alumni_aim`
--
ALTER TABLE `alumni_aim`
  MODIFY `aim_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `alumni_history_details`
--
ALTER TABLE `alumni_history_details`
  MODIFY `history_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `directory_advisory_body`
--
ALTER TABLE `directory_advisory_body`
  MODIFY `d_a_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directory_executive_body`
--
ALTER TABLE `directory_executive_body`
  MODIFY `d_e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `directory_master`
--
ALTER TABLE `directory_master`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `directory_speech`
--
ALTER TABLE `directory_speech`
  MODIFY `d_s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `election_master`
--
ALTER TABLE `election_master`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `election_voting_details`
--
ALTER TABLE `election_voting_details`
  MODIFY `e_voting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `election_voting_result`
--
ALTER TABLE `election_voting_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `initiatives_master`
--
ALTER TABLE `initiatives_master`
  MODIFY `i_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meeting_master`
--
ALTER TABLE `meeting_master`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member_achiev_info`
--
ALTER TABLE `member_achiev_info`
  MODIFY `m_a_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `member_address_details`
--
ALTER TABLE `member_address_details`
  MODIFY `m_add_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member_basic_info`
--
ALTER TABLE `member_basic_info`
  MODIFY `mb_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `member_educational_info`
--
ALTER TABLE `member_educational_info`
  MODIFY `medu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `member_job_info`
--
ALTER TABLE `member_job_info`
  MODIFY `mjob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `member_login`
--
ALTER TABLE `member_login`
  MODIFY `mem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `member_publication_info`
--
ALTER TABLE `member_publication_info`
  MODIFY `m_p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member_research_details`
--
ALTER TABLE `member_research_details`
  MODIFY `m_r_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member_subscription`
--
ALTER TABLE `member_subscription`
  MODIFY `ms_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nomination_details`
--
ALTER TABLE `nomination_details`
  MODIFY `n_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `nomination_master`
--
ALTER TABLE `nomination_master`
  MODIFY `n_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
