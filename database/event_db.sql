-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2020 at 11:00 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_db`
--

-- --------------------------------------------------------
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `email` varchar(100) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(30) NOT NULL,
  `venue_id` int(30) NOT NULL,
  `event` text NOT NULL,
  `description` text NOT NULL,
  `schedule` datetime NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Public, 2-Private',
  `audience_capacity` int(30) NOT NULL,
  `payment_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Free,payable',
  `amount` double NOT NULL DEFAULT 0,
  `banner` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `event`, `description`, `schedule`, `type`, `audience_capacity`, `payment_type`, `amount`, `banner`, `date_created`) VALUES
(1, 1, 'Rock Concert', '<p>Join us for an electrifying rock concert featuring top bands.</p>', '2024-08-15 19:00:00', 1, 5000, 1, 50, 'rock_concert.jpg', '2024-07-29 12:00:00'),
(2, 2, 'Jazz Night', '<p>Experience an evening of smooth jazz music with renowned artists.</p>', '2024-08-20 20:00:00', 1, 3000, 1, 40, 'jazz_night.jpg', '2024-07-29 12:00:00'),
(3, 3, 'Classical Music Gala', '<p>A night of classical music performed by a world-class orchestra.</p>', '2024-08-25 18:00:00', 1, 2000, 1, 60, 'classical_gala.jpg', '2024-07-29 12:00:00'),
(4, 1, 'Hip Hop Fest', '<p>Get ready for a high-energy hip hop festival with top performers.</p>', '2024-09-01 17:00:00', 1, 7000, 1, 55, 'hip_hop_fest.jpg', '2024-07-29 12:00:00'),
(5, 2, 'Country Music Show', '<p>Enjoy an evening of country music with your favorite artists.</p>', '2024-09-05 19:00:00', 1, 4000, 1, 45, 'country_show.jpg', '2024-07-29 12:00:00'),
(6, 3, 'Indie Rock Night', '<p>Discover amazing indie rock bands at this exclusive event.</p>', '2024-09-10 20:00:00', 1, 3500, 1, 35, 'indie_rock.jpg', '2024-07-29 12:00:00'),
(7, 1, 'EDM Party', '<p>Dance the night away at our epic EDM party with top DJs.</p>', '2024-09-15 21:00:00', 1, 6000, 1, 70, 'edm_party.jpg', '2024-07-29 12:00:00'),
(8, 2, 'Pop Concert', '<p>Sing along to your favorite pop hits at this exciting concert.</p>', '2024-09-20 19:30:00', 1, 5000, 1, 50, 'pop_concert.jpg', '2024-07-29 12:00:00'),
(9, 3, 'Reggae Festival', '<p>Feel the vibes at our reggae festival featuring top artists.</p>', '2024-09-25 18:30:00', 1, 4500, 1, 40, 'reggae_festival.jpg', '2024-07-29 12:00:00'),
(10, 1, 'Blues Night', '<p>Enjoy a soulful evening of blues music with legendary performers.</p>', '2024-09-30 20:00:00', 1, 2500, 1, 30, 'blues_night.jpg', '2024-07-29 12:00:00');


-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `username`, `password`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500');


-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Event Management System', 'info@sample.comm', '+6948 8542 623', '1602641160_JSAV-multiscreen_3ddbdd40-38d9-4b64-9cf2-5d0ef356f29c.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` int(30) NOT NULL,
  `venue` text NOT NULL,
  `address` text NOT NULL,
  `description` text NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue`, `address`, `description`) VALUES
(1, 'Venue 1', 'City Hall', 'A spacious venue located in the heart of the city, ideal for large-scale events and ceremonies.'),
(2, 'Venue 2', 'Concert Hall', 'A modern concert hall with state-of-the-art acoustics and seating for up to 2000 guests.'),
(3, 'Venue 3', 'Continental Hotel', 'An elegant hotel venue perfect for conferences, weddings, and corporate events, offering top-notch amenities.'),
(4, 'Venue 4', 'Hotel Stella', 'A luxurious hotel with extensive facilities and beautiful ballrooms, suitable for grand events and gatherings.');

-- --------------------------------------------------------
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--