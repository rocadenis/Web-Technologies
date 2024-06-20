-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost
-- Timp de generare: iun. 20, 2024 la 03:43 PM
-- Versiune server: 10.4.28-MariaDB
-- Versiune PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `ReFi`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `language` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `resources`
--

INSERT INTO `resources` (`id`, `name`, `url`, `description`, `language`, `type`) VALUES
(1, 'JavaScript Basics Tutorial', 'https://www.youtube.com/watch?v=W6NZfCO5SIk', 'Comprehensive tutorial on JavaScript basics', 'JavaScript', 'tutorial'),
(2, 'JavaScript Advanced Tutorial', 'https://www.youtube.com/watch?v=Ukg_U3CnJWI', 'Advanced concepts in JavaScript', 'JavaScript', 'tutorial'),
(3, 'React.js Crash Course', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 'React.js crash course for beginners', 'JavaScript', 'tutorial'),
(4, 'Node.js Full Course', 'https://www.youtube.com/watch?v=RLtyhwFtXQA', 'Full course on Node.js', 'Node.js', 'tutorial'),
(5, 'Python Basics Tutorial', 'https://www.youtube.com/watch?v=_uQrJ0TkZlc', 'Python programming for beginners', 'Python', 'tutorial'),
(6, 'Python Advanced Tutorial', 'https://www.youtube.com/watch?v=HGOBQPFzWKo', 'Advanced Python programming tutorial', 'Python', 'tutorial'),
(7, 'Django Full Course', 'https://www.youtube.com/watch?v=F5mRW0jo-U4', 'Full course on Django framework', 'Python', 'tutorial'),
(8, 'Flask Tutorial for Beginners', 'https://www.youtube.com/watch?v=Z1RJmh_OqeA', 'Flask web development tutorial', 'Python', 'tutorial'),
(9, 'C++ Programming Tutorial', 'https://www.youtube.com/watch?v=vLnPwxZdW4Y', 'Comprehensive C++ programming tutorial', 'C++', 'tutorial'),
(10, 'Unreal Engine C++ Tutorial', 'https://www.youtube.com/watch?v=usjlNHPn-jo', 'C++ programming in Unreal Engine', 'C++', 'tutorial'),
(11, 'C Programming Tutorial', 'https://www.youtube.com/watch?v=KJgsSFOSQv0', 'Learn C programming from scratch', 'C', 'tutorial'),
(12, 'C# Programming Tutorial', 'https://www.youtube.com/watch?v=GhQdlIFylQ8', 'C# programming for beginners', 'C#', 'tutorial'),
(13, 'Unity C# Scripting Tutorial', 'https://www.youtube.com/watch?v=F7bY2NfUIj4', 'C# scripting in Unity', 'C#', 'tutorial'),
(14, 'ASP.NET Core Tutorial', 'https://www.youtube.com/watch?v=C5cnZ-gZy2I', 'Full course on ASP.NET Core', 'C#', 'tutorial'),
(15, 'JavaScript Game Development', 'https://www.youtube.com/watch?v=3EMxBkqC4z0', 'JavaScript game development tutorial', 'JavaScript', 'tutorial'),
(16, 'Python Game Development', 'https://www.youtube.com/watch?v=FfWpgLFMI7w', 'Python game development with Pygame', 'Python', 'tutorial'),
(17, 'C++ Game Development', 'https://www.youtube.com/watch?v=ibiQmkhpNYI', 'Game development with C++', 'C++', 'tutorial'),
(18, 'JavaScript Algorithms and Data Structures', 'https://www.youtube.com/watch?v=8hly31xKli0', 'Learn algorithms and data structures in JavaScript', 'JavaScript', 'tutorial'),
(19, 'Node.js REST API Tutorial', 'https://www.youtube.com/watch?v=ENrzD9HAZK4', 'Build a REST API with Node.js', 'Node.js', 'tutorial'),
(20, 'Python Machine Learning', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 'Machine learning with Python', 'Python', 'tutorial'),
(21, 'C++ Data Structures', 'https://www.youtube.com/watch?v=W2tWOdzgXHA', 'Data structures in C++', 'C++', 'tutorial'),
(22, 'C Advanced Programming', 'https://www.youtube.com/watch?v=JRGga8g5Vqw', 'Advanced programming in C', 'C', 'tutorial'),
(23, 'C# Game Development', 'https://www.youtube.com/watch?v=gB1F9G0JXOo', 'Game development in C#', 'C#', 'tutorial'),
(24, 'JavaScript ES6 Tutorial', 'https://www.youtube.com/watch?v=NCwa_xi0Uuc', 'Learn ES6 features in JavaScript', 'JavaScript', 'tutorial'),
(25, 'Node.js Authentication', 'https://www.youtube.com/watch?v=2jqok-WgelI', 'Authentication in Node.js applications', 'Node.js', 'tutorial'),
(26, 'Python Web Scraping', 'https://www.youtube.com/watch?v=XQgXKtPSzUI', 'Web scraping with Python', 'Python', 'tutorial'),
(27, 'C++ Object-Oriented Programming', 'https://www.youtube.com/watch?v=1v_4dL6XoYM', 'Object-oriented programming in C++', 'C++', 'tutorial'),
(28, 'C Memory Management', 'https://www.youtube.com/watch?v=RF9IfCyt0oI', 'Memory management in C programming', 'C', 'tutorial'),
(29, 'JavaScript Basics Source Code', 'https://github.com/user/js-basics', 'Source code for JavaScript basics tutorial', 'JavaScript', 'source code'),
(30, 'JavaScript Advanced Source Code', 'https://github.com/user/js-advanced', 'Source code for advanced JavaScript concepts', 'JavaScript', 'source code'),
(31, 'React.js Crash Course Source Code', 'https://github.com/user/react-crash-course', 'Source code for React.js crash course', 'JavaScript', 'source code'),
(32, 'Node.js Full Course Source Code', 'https://github.com/user/nodejs-full-course', 'Source code for Node.js full course', 'Node.js', 'source code'),
(33, 'Python Basics Source Code', 'https://github.com/user/python-basics', 'Source code for Python basics tutorial', 'Python', 'source code'),
(34, 'Python Advanced Source Code', 'https://github.com/user/python-advanced', 'Source code for advanced Python tutorial', 'Python', 'source code'),
(35, 'Django Full Course Source Code', 'https://github.com/user/django-full-course', 'Source code for Django full course', 'Python', 'source code'),
(36, 'Flask Tutorial Source Code', 'https://github.com/user/flask-tutorial', 'Source code for Flask tutorial', 'Python', 'source code'),
(37, 'C++ Programming Source Code', 'https://github.com/user/cpp-programming', 'Source code for C++ programming tutorial', 'C++', 'source code'),
(38, 'Unreal Engine C++ Source Code', 'https://github.com/user/unreal-cpp', 'Source code for Unreal Engine C++ tutorial', 'C++', 'source code'),
(39, 'C Programming Source Code', 'https://github.com/user/c-programming', 'Source code for C programming tutorial', 'C', 'source code'),
(40, 'C# Programming Source Code', 'https://github.com/user/csharp-programming', 'Source code for C# programming tutorial', 'C#', 'source code'),
(41, 'Unity C# Scripting Source Code', 'https://github.com/user/unity-csharp', 'Source code for Unity C# scripting tutorial', 'C#', 'source code'),
(42, 'ASP.NET Core Source Code', 'https://github.com/user/aspnet-core', 'Source code for ASP.NET Core tutorial', 'C#', 'source code'),
(43, 'JavaScript Game Development Source Code', 'https://github.com/user/js-game-dev', 'Source code for JavaScript game development tutorial', 'JavaScript', 'source code'),
(44, 'Python Game Development Source Code', 'https://github.com/user/python-game-dev', 'Source code for Python game development tutorial', 'Python', 'source code'),
(45, 'C++ Game Development Source Code', 'https://github.com/user/cpp-game-dev', 'Source code for C++ game development tutorial', 'C++', 'source code'),
(46, 'JavaScript Algorithms Source Code', 'https://github.com/user/js-algorithms', 'Source code for JavaScript algorithms and data structures', 'JavaScript', 'source code'),
(47, 'Node.js REST API Source Code', 'https://github.com/user/nodejs-rest-api', 'Source code for Node.js REST API tutorial', 'Node.js', 'source code'),
(48, 'Python Machine Learning Source Code', 'https://github.com/user/python-ml', 'Source code for machine learning with Python', 'Python', 'source code'),
(49, 'C++ Data Structures Source Code', 'https://github.com/user/cpp-data-structures', 'Source code for data structures in C++', 'C++', 'source code'),
(50, 'C Advanced Programming Source Code', 'https://github.com/user/c-advanced', 'Source code for advanced programming in C', 'C', 'source code'),
(51, 'Fractal images Java', 'https://github.com/userfractals/java-advanced.com', 'Tutorial for a best understanding', 'JavaScript', 'Tutorial');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
