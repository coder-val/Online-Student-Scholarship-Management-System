-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2022 at 04:18 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ossms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'scholar');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add scholar', 7, 'add_scholar'),
(26, 'Can change scholar', 7, 'change_scholar'),
(27, 'Can delete scholar', 7, 'delete_scholar'),
(28, 'Can view scholar', 7, 'view_scholar');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$ZX6kGWI0cUDkkbv0SRy9ff$z4V7evsMgwWeDT87k9NWclTA0Y/w9y9IFs8UociqwK4=', '2022-01-23 15:07:58.171188', 1, 'coderval', '', '', 'valcabitac011@gmail.com', 1, 1, '2022-01-19 00:58:07.000000'),
(43, 'pbkdf2_sha256$320000$YZfz5R7TvEXrJPisnJ0LZW$Bv6tyHUOKv+ptwhXnreVt6EuRbq2LSld7n0V7M8mpkQ=', '2022-01-23 15:12:19.154912', 0, '19-30075', 'Val Melbin', 'Cabitac', '', 0, 1, '2022-01-23 15:09:33.926878'),
(44, 'pbkdf2_sha256$320000$VJzK7Nx8DnjY8OBjrM9Owq$X16JZBf7SLwI5PzJd/NF9a+kHvDMjVmW88Lm0XPdY5Y=', NULL, 0, '19-30056', 'Glenn', 'Contreras', '', 0, 1, '2022-01-23 15:13:27.710154'),
(45, 'pbkdf2_sha256$320000$PN96XoK4PObns3gQwss9UT$xMPhWnJSGtQWE+lPrIxR7MOI1w2ZIiFz0Ha7jkbTjtg=', NULL, 0, '19-30076', 'Hakdog', 'Magalpoc', '', 0, 1, '2022-01-23 15:16:32.511334');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(2, 1, 1),
(18, 19, 2),
(19, 20, 2),
(21, 22, 2),
(40, 43, 2),
(41, 44, 2),
(42, 45, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-01-19 01:01:24.456341', '1', 'Cabitac', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-01-19 01:01:51.247522', '1', 'admin', 1, '[{\"added\": {}}]', 3, 1),
(3, '2022-01-19 01:02:03.007402', '2', 'scholar', 1, '[{\"added\": {}}]', 3, 1),
(4, '2022-01-19 01:02:16.574421', '2', '19-30075', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(5, '2022-01-19 01:16:11.510655', '1', 'coderval', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(6, '2022-01-19 01:44:52.478808', '3', 'valpogi', 1, '[{\"added\": {}}]', 4, 1),
(7, '2022-01-19 01:51:14.560031', '4', '19-30076', 3, '', 4, 1),
(8, '2022-01-19 01:51:26.274278', '3', 'valpogi', 3, '', 4, 1),
(9, '2022-01-19 01:55:49.439345', '5', '19-30076', 3, '', 4, 1),
(10, '2022-01-19 01:55:59.311322', '6', '19-30077', 3, '', 4, 1),
(11, '2022-01-19 01:58:41.573172', '7', '19-30076', 3, '', 4, 1),
(12, '2022-01-19 01:59:51.691827', '8', '19-30076', 3, '', 4, 1),
(13, '2022-01-19 02:05:31.365822', '2', '19-30076', 2, '[{\"changed\": {\"fields\": [\"Student ID\", \"Last name\", \"Middle name\", \"Contact number\", \"College\", \"College year\", \"Scholarship program\"]}}]', 7, 1),
(14, '2022-01-19 02:09:44.594487', '10', '12321', 1, '[{\"added\": {}}]', 4, 1),
(15, '2022-01-19 02:11:25.134154', '10', '12321', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1),
(16, '2022-01-19 02:12:20.021081', '10', '12321', 3, '', 4, 1),
(17, '2022-01-19 02:54:06.510055', '3', '19-30077', 3, '', 7, 1),
(18, '2022-01-19 02:54:27.165191', '11', '19-30077', 3, '', 4, 1),
(19, '2022-01-19 03:01:01.894473', '9', '19-30076', 3, '', 4, 1),
(20, '2022-01-19 03:01:01.896499', '12', '19-30077', 3, '', 4, 1),
(21, '2022-01-19 03:01:01.897465', '13', '19-30078', 3, '', 4, 1),
(22, '2022-01-19 03:01:19.530023', '4', '19-30078', 3, '', 7, 1),
(23, '2022-01-19 03:03:48.449705', '14', '19-30076', 3, '', 4, 1),
(24, '2022-01-19 03:06:00.457087', '15', '19-30076', 3, '', 4, 1),
(25, '2022-01-19 06:10:24.015048', '2', '19-30075', 3, '', 4, 1),
(26, '2022-01-19 06:10:24.018283', '16', '19-30076', 3, '', 4, 1),
(27, '2022-01-19 06:10:24.022487', '17', '19-30077', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'scholars', 'scholar'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-01-19 00:57:14.488906'),
(2, 'auth', '0001_initial', '2022-01-19 00:57:14.739092'),
(3, 'admin', '0001_initial', '2022-01-19 00:57:14.796336'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-19 00:57:14.802684'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-19 00:57:14.807832'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-01-19 00:57:14.836924'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-01-19 00:57:14.866544'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-01-19 00:57:14.876164'),
(9, 'auth', '0004_alter_user_username_opts', '2022-01-19 00:57:14.883837'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-01-19 00:57:14.905812'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-01-19 00:57:14.907670'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-01-19 00:57:14.912666'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-01-19 00:57:14.923164'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-01-19 00:57:14.933774'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-01-19 00:57:14.949833'),
(16, 'auth', '0011_update_proxy_permissions', '2022-01-19 00:57:14.956918'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-01-19 00:57:14.965895'),
(18, 'scholars', '0001_initial', '2022-01-19 00:57:14.980451'),
(19, 'scholars', '0002_scholar_contact_number_alter_scholar_college_and_more', '2022-01-19 00:57:14.992409'),
(20, 'scholars', '0003_alter_scholar_contact_number', '2022-01-19 00:57:15.020644'),
(21, 'scholars', '0004_scholar_user', '2022-01-19 00:57:15.052644'),
(22, 'scholars', '0005_remove_scholar_user_alter_scholar_student_id', '2022-01-19 00:57:15.160382'),
(23, 'scholars', '0006_remove_scholar_student_id', '2022-01-19 00:57:15.207392'),
(24, 'scholars', '0007_scholar_student_id', '2022-01-19 00:57:15.240585'),
(25, 'sessions', '0001_initial', '2022-01-19 00:57:15.260837');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('8nbihv5geqxc24q9k0jz2uokaqxsfsol', '.eJxVjDsOwjAQBe_iGlnYWf8o6XMGa73e4ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVFaBCn3zEhPbjuJN-x3pqkVtdlTnJX5EG7HFvm5_Vw_w4K9vKt2WubHIALmsxAHFyijGdLxgzKoXcMlqakJ86eQ2IEo8gjEXqr0IJ4fwAVwjjV:1nBDPq:U-CK9NYE0fh5369QUjVK7WyWDNXXCQC9ijU6CeWKcOA', '2022-02-05 10:14:38.746141'),
('e5n9ujohd5il7wbyqljwdw65ajqhmi2l', '.eJxVjEEOgjAQRe_StWmcaaHUpXvO0Ew7M4IaSCisjHdXEha6_e-9_zKJtnVIW5UljWwuBsGcfsdM5SHTTvhO0222ZZ7WZcx2V-xBq-1nluf1cP8OBqrDtwaGBlWVAnL0bYfqhToXHHYSHTTeSfaihBoZQIKoFMytgp6ZvBfz_gAPtDjM:1nBB03:tYF7z5M9ogg2LJ8Ial-0N1O-a-vnHxyqNRrtnWdl7AM', '2022-02-05 07:39:51.917960'),
('ioys4d34nx1deo6lh9ssqtcu46vd5255', '.eJxVjDEOgzAMRe-SuYpCwJh07M4ZkGM7DW0FEoGp6t0LEkO7vvf-f5uBtjUPW9FlGMVcjQdz-YWR-KnTYeRB0322PE_rMkZ7JPa0xfaz6Ot2tn8HmUre1ykpE0DwXFeMDA2oTyotE1YhskNXN1T5NridOEidV0TXCCpKJyLm8wUjWzic:1nBDL6:jWPu7QJjpCREmPjxS7kVb3DtE3dFx3OjGMe6TpGQubA', '2022-02-05 10:09:44.709464'),
('v3eq1fevugfb49zx1cgyzilmk3ur7px6', '.eJxVjEsOwiAUAO_C2hB-5ePSfc9AHryHVA1NSrsy3t2QdKHbmcm8WYRjr_HotMUF2ZVJdvllCfKT2hD4gHZfeV7bvi2Jj4SftvN5RXrdzvZvUKHXsZU-WBeM0MUnKQRA0Sob7RWhC8lqzBAwO5ocWoSsKLhiVNLGk9JTYp8vz_w32g:1nBbEQ:EdXYOZjijBN8BTUne6CGZ_zCGA4t334jJvOkld70EDU', '2022-02-06 11:40:26.365292');

-- --------------------------------------------------------

--
-- Table structure for table `scholars`
--

CREATE TABLE `scholars` (
  `id` bigint(20) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) NOT NULL,
  `college` varchar(10) NOT NULL,
  `college_year` varchar(1) NOT NULL,
  `scholarship_program` varchar(40) NOT NULL,
  `zip_file` varchar(100) DEFAULT NULL,
  `remarks` varchar(10) NOT NULL,
  `contact_number` varchar(30) NOT NULL,
  `student_ID_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scholars`
--

INSERT INTO `scholars` (`id`, `last_name`, `first_name`, `middle_name`, `college`, `college_year`, `scholarship_program`, `zip_file`, `remarks`, `contact_number`, `student_ID_id`) VALUES
(31, 'Cabitac', 'Val Melbin', 'Caccam', 'CICS', '3', 'CHED-TDP', 'test1.zip', 'OK', '09614502534', 43),
(32, 'Contreras', 'Glenn', 'Valdez', 'CBEA', '3', 'CHED-TES', 'test2.zip', 'PENDING', '09123456789', 44),
(33, 'Magalpoc', 'Hakdog', 'Awit', 'CTE', '4', 'CHED-TES', '', 'NEW', '09112223345', 45);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `scholars`
--
ALTER TABLE `scholars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_ID_id` (`student_ID_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `scholars`
--
ALTER TABLE `scholars`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `scholars`
--
ALTER TABLE `scholars`
  ADD CONSTRAINT `scholars_student_ID_id_def3ceef_fk_auth_user_id` FOREIGN KEY (`student_ID_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
