-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2024 at 07:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nielit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` varchar(10) NOT NULL,
  `c_name` varchar(20) DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edu_qualification`
--

CREATE TABLE `edu_qualification` (
  `total_marks` int(10) DEFAULT NULL,
  `marks_obtained` int(10) DEFAULT NULL,
  `Percentage` varchar(12) DEFAULT NULL,
  `University` varchar(20) DEFAULT NULL,
  `Passed_year` varchar(10) DEFAULT NULL,
  `roll_no` varchar(50) DEFAULT NULL,
  `student_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internal_marks`
--

CREATE TABLE `internal_marks` (
  `sub_id` int(10) DEFAULT NULL,
  `sub_name` varchar(20) DEFAULT NULL,
  `marks` int(12) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `student_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `receptonist_id` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_form`
--

CREATE TABLE `registration_form` (
  `student_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `category` enum('General','OBC','SC','ST','OTHER') DEFAULT NULL,
  `CERTIFICATE_NO` varchar(50) DEFAULT NULL,
  `ISSUING_AUTHORITY` varchar(50) DEFAULT NULL,
  `DATE_OF_ISSUE` date DEFAULT NULL,
  `GENDER` enum('MALE','FEMALE','OTHER') DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `BLOOD_GROUP` varchar(20) DEFAULT NULL,
  `RELIGION` varchar(30) DEFAULT NULL,
  `IDENTIFICATION_MARK` varchar(100) DEFAULT NULL,
  `PHOTO` blob DEFAULT NULL,
  `SIGNATURE` blob DEFAULT NULL,
  `challan_no` blob NOT NULL,
  `Application_no` int(50) NOT NULL,
  `payment` blob NOT NULL,
  `left_thumb_imprint` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` varchar(10) NOT NULL,
  `sub_name` varchar(20) DEFAULT NULL,
  `course_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `s_address`
--

CREATE TABLE `s_address` (
  `village_town` varchar(10) DEFAULT NULL,
  `dist` varchar(20) DEFAULT NULL,
  `Pin_no` int(6) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `student_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` varchar(10) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `Phone_no` int(12) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `course_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `edu_qualification`
--
ALTER TABLE `edu_qualification`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `internal_marks`
--
ALTER TABLE `internal_marks`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `registration_form`
--
ALTER TABLE `registration_form`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `s_address`
--
ALTER TABLE `s_address`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD KEY `course_id` (`course_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `edu_qualification`
--
ALTER TABLE `edu_qualification`
  ADD CONSTRAINT `edu_qualification_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `internal_marks`
--
ALTER TABLE `internal_marks`
  ADD CONSTRAINT `internal_marks_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `registration_form`
--
ALTER TABLE `registration_form`
  ADD CONSTRAINT `registration_form_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Constraints for table `s_address`
--
ALTER TABLE `s_address`
  ADD CONSTRAINT `s_address_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
