-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2023 at 12:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobfinder`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add jobs', 7, 'add_jobs'),
(26, 'Can change jobs', 7, 'change_jobs'),
(27, 'Can delete jobs', 7, 'delete_jobs'),
(28, 'Can view jobs', 7, 'view_jobs'),
(29, 'Can add user profile', 8, 'add_userprofile'),
(30, 'Can change user profile', 8, 'change_userprofile'),
(31, 'Can delete user profile', 8, 'delete_userprofile'),
(32, 'Can view user profile', 8, 'view_userprofile'),
(33, 'Can add profile', 8, 'add_profile'),
(34, 'Can change profile', 8, 'change_profile'),
(35, 'Can delete profile', 8, 'delete_profile'),
(36, 'Can view profile', 8, 'view_profile');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$0sv46rMK6j4WzkLV637Uwp$bvK1aRtQrTxYFDGqmYODn7wgvRGEi2p1+bVgiZIZgZ8=', '2023-08-18 20:26:25.837035', 1, 'moizkhan', '', '', '', 1, 1, '2023-08-04 03:06:53.182957'),
(18, 'pbkdf2_sha256$600000$p2Ralca4XtzN1C3AyhTwZT$N3b/+eVxi6enVXFjSNHsuaEeLUosTXoUc74/MfaGqtk=', '2023-08-18 20:57:44.284859', 0, 'JJ', '', '', '', 0, 1, '2023-08-18 20:42:01.203442');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-14 20:54:14.840255', '1', 'Moiz Khan', 1, '[{\"added\": {}}]', 8, 1),
(2, '2023-08-14 23:58:59.624091', '3', 'Faaiz Kahn', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-08-15 00:11:27.206644', '6', 'Candy', 3, '', 4, 1),
(4, '2023-08-15 00:11:38.470710', '4', 'ffeffse', 3, '', 4, 1),
(5, '2023-08-15 00:11:52.122777', '3', 'moizkhan9975', 3, '', 4, 1),
(6, '2023-08-15 00:18:34.350588', '8', 'Candy', 1, '[{\"added\": {}}]', 4, 1),
(7, '2023-08-15 00:29:12.840088', '8', 'Candy', 3, '', 4, 1),
(8, '2023-08-15 00:29:28.577616', '9', 'Candy', 1, '[{\"added\": {}}]', 4, 1),
(9, '2023-08-15 00:31:46.064919', '9', 'Candy', 3, '', 4, 1),
(10, '2023-08-15 00:32:16.216903', '10', 'Candy', 1, '[{\"added\": {}}]', 4, 1),
(11, '2023-08-15 00:35:24.009385', '10', 'Candy', 3, '', 4, 1),
(12, '2023-08-15 00:35:40.667208', '11', 'Candy', 1, '[{\"added\": {}}]', 4, 1),
(13, '2023-08-15 00:53:05.986149', '11', 'Candy', 3, '', 4, 1),
(14, '2023-08-16 18:34:32.703898', '12', 'Candy', 3, '', 4, 1),
(15, '2023-08-16 18:34:46.795698', '2', 'Faaiz', 3, '', 4, 1),
(16, '2023-08-16 18:34:54.027722', '13', 'JJ', 3, '', 4, 1),
(17, '2023-08-16 18:43:04.122547', '14', 'JJ', 3, '', 4, 1),
(18, '2023-08-16 18:44:18.489885', '15', 'JJ', 3, '', 4, 1),
(19, '2023-08-16 18:47:13.689659', '16', 'JJ', 3, '', 4, 1),
(20, '2023-08-18 00:07:25.547178', '1', 'Moiz Khan', 2, '[{\"changed\": {\"fields\": [\"Address\", \"ProfileImage\"]}}]', 8, 1),
(21, '2023-08-18 20:31:11.679237', '17', 'JJ', 3, '', 4, 1),
(22, '2023-08-18 20:32:17.045930', '1', 'Moiz Khan', 2, '[{\"changed\": {\"fields\": [\"ProfileImage\"]}}]', 8, 1),
(23, '2023-08-18 20:34:28.503267', '1', 'Moiz Khan', 2, '[{\"changed\": {\"fields\": [\"ProfileImage\"]}}]', 8, 1),
(24, '2023-08-18 20:39:52.791452', '1', 'Moiz Khan', 2, '[{\"changed\": {\"fields\": [\"ProfileImage\"]}}]', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main', 'jobs'),
(8, 'main', 'profile'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-04 03:03:40.265613'),
(2, 'auth', '0001_initial', '2023-08-04 03:03:50.188308'),
(3, 'admin', '0001_initial', '2023-08-04 03:03:52.232213'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-04 03:03:52.282607'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-04 03:03:52.329042'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-04 03:03:53.023235'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-04 03:03:54.151327'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-04 03:03:54.317272'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-04 03:03:54.369702'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-04 03:03:55.022486'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-04 03:03:55.053737'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-04 03:03:55.127747'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-04 03:03:55.322090'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-04 03:03:55.434911'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-04 03:03:55.900385'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-04 03:03:55.958653'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-04 03:03:56.132057'),
(18, 'sessions', '0001_initial', '2023-08-04 03:03:56.626999'),
(19, 'main', '0001_initial', '2023-08-13 11:16:43.600946'),
(20, 'main', '0002_userprofile', '2023-08-14 17:31:47.068830'),
(21, 'main', '0003_rename_userprofile_profile', '2023-08-15 00:17:39.769214'),
(22, 'main', '0004_alter_profile_address_alter_profile_email_and_more', '2023-08-18 20:24:21.806303'),
(23, 'main', '0005_alter_profile_profileimage', '2023-08-18 20:38:56.575109'),
(24, 'main', '0006_alter_profile_profileimage', '2023-08-18 20:44:38.642928'),
(25, 'main', '0007_alter_profile_profileimage', '2023-08-18 20:45:45.989411');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('z1iqv9v0b70oh5cj1rsz34p0clq0gmbh', '.eJxVjMEOgjAQRP-lZ9NspdCtR-9-Q7Pd3QpqIKFwMv67kHDQ0yTz3szbJFqXPq1V5zSIuRiH5vRbZuKnjjuRB433yfI0LvOQ7a7Yg1Z7m0Rf18P9O-ip9tsaGnQFi1IukULLDAWgCVz8FqLZEYQSA4kAdi2iP7eRm040MqAPaj5fHJI4Qg:1qX6XQ:6pWXkiZ-PkgmKuyof_JiCwXyvRT_7LZ4LvG7Hr246as', '2023-09-01 20:57:44.293729');

-- --------------------------------------------------------

--
-- Table structure for table `main_jobs`
--

CREATE TABLE `main_jobs` (
  `job_id` bigint(20) NOT NULL,
  `job_title` varchar(70) NOT NULL,
  `job_description` longtext NOT NULL,
  `company` varchar(50) NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `publish_date` date NOT NULL,
  `location` varchar(50) NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_profile`
--

CREATE TABLE `main_profile` (
  `id` bigint(20) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(70) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(100) NOT NULL,
  `profileImage` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_profile`
--

INSERT INTO `main_profile` (`id`, `profession`, `name`, `email`, `phone`, `address`, `profileImage`, `user_id`) VALUES
(1, 'Data Scientist', 'Moiz Khan', 'moizkhan9975@gmail.com', '03335640757', 'PO Village', 'profilePics/FB_IMG_1556103305237_2.jpg', 1),
(16, 'Data Scientist', 'Joseph Jaan', 'JJ@gmail.com', '0333123456', 'Islamabad', 'profilePics/FB_IMG_1556103305237_2_eHuE5dQ.jpg', 18);

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
-- Indexes for table `main_jobs`
--
ALTER TABLE `main_jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `main_profile`
--
ALTER TABLE `main_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `main_jobs`
--
ALTER TABLE `main_jobs`
  MODIFY `job_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `main_profile`
--
ALTER TABLE `main_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
-- Constraints for table `main_profile`
--
ALTER TABLE `main_profile`
  ADD CONSTRAINT `main_userprofile_user_id_15c416f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
