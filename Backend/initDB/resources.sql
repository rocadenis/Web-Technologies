-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost
-- Timp de generare: iun. 21, 2024 la 12:55 PM
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
(1, 'Generative Art with JavaScript', 'https://example.com/generative-art-js', 'Learn to create generative art using JavaScript.', 'JavaScript', 'tutorial'),
(2, 'Interactive Visualizations with JavaScript', 'https://example.com/interactive-visuals-js', 'Create interactive visualizations using JavaScript.', 'JavaScript', 'tutorial'),
(3, 'Creative Coding for Beginners', 'https://example.com/creative-coding-js', 'A beginner\'s guide to creative coding with JavaScript.', 'JavaScript', 'tutorial'),
(4, 'JavaScript Generative Design', 'https://example.com/generative-design-js', 'Explore generative design techniques using JavaScript.', 'JavaScript', 'tutorial'),
(5, 'Creative Coding in the Browser', 'https://example.com/creative-coding-browser', 'Learn how to do creative coding directly in the browser using JavaScript.', 'JavaScript', 'tutorial'),
(6, 'WebGL for Creative Coding', 'https://example.com/webgl-creative-coding', 'Using WebGL for creative coding in JavaScript.', 'JavaScript', 'tutorial'),
(7, 'Canvas API for Creative Coding', 'https://example.com/canvas-api', 'Create art using the Canvas API in JavaScript.', 'JavaScript', 'tutorial'),
(8, 'Processing.js for Generative Art', 'https://example.com/processing-js', 'Use Processing.js to create generative art in JavaScript.', 'JavaScript', 'tutorial'),
(9, 'Data Visualization with D3.js', 'https://example.com/d3-visualizations', 'Create stunning data visualizations with D3.js.', 'JavaScript', 'tutorial'),
(10, 'JavaScript for Interactive Art', 'https://example.com/interactive-art-js', 'Build interactive art installations using JavaScript.', 'JavaScript', 'tutorial'),
(11, 'Creative Coding with p5.js', 'https://example.com/p5js-coding', 'Learn creative coding with the p5.js library.', 'JavaScript', 'tutorial'),
(12, 'Generative Music with JavaScript', 'https://example.com/generative-music-js', 'Create generative music using JavaScript.', 'JavaScript', 'tutorial'),
(13, 'Creative Coding with Three.js', 'https://example.com/threejs-coding', 'Learn to use Three.js for creative coding projects.', 'JavaScript', 'tutorial'),
(14, 'Interactive Web Art', 'https://example.com/interactive-web-art', 'Create interactive web art using JavaScript.', 'JavaScript', 'tutorial'),
(15, 'Node-Based Visuals with JavaScript', 'https://example.com/node-based-visuals', 'Build node-based visual compositions using JavaScript.', 'JavaScript', 'tutorial'),
(16, 'Creative Coding with Node.js', 'https://example.com/creative-coding-nodejs', 'Learn creative coding techniques using Node.js.', 'Node.js', 'tutorial'),
(17, 'Generative Art with Node.js', 'https://example.com/generative-art-nodejs', 'Create generative art using Node.js.', 'Node.js', 'tutorial'),
(18, 'Interactive Installations with Node.js', 'https://example.com/interactive-installations-nodejs', 'Build interactive installations using Node.js.', 'Node.js', 'tutorial'),
(19, 'Real-Time Graphics with Node.js', 'https://example.com/real-time-graphics', 'Learn to create real-time graphics using Node.js.', 'Node.js', 'tutorial'),
(20, 'Data-Driven Art with Node.js', 'https://example.com/data-driven-art-nodejs', 'Create data-driven art installations using Node.js.', 'Node.js', 'tutorial'),
(21, 'Node.js and WebSockets for Interactive Art', 'https://example.com/websockets-interactive-art', 'Use WebSockets in Node.js for interactive art.', 'Node.js', 'tutorial'),
(22, 'Node.js for Creative Servers', 'https://example.com/creative-servers-nodejs', 'Build creative servers for art installations using Node.js.', 'Node.js', 'tutorial'),
(23, 'Generative Music with Node.js', 'https://example.com/generative-music-nodejs', 'Create generative music using Node.js.', 'Node.js', 'tutorial'),
(24, 'Interactive Sound with Node.js', 'https://example.com/interactive-sound-nodejs', 'Build interactive sound installations using Node.js.', 'Node.js', 'tutorial'),
(25, 'Node.js and MIDI for Creative Coding', 'https://example.com/nodejs-midi', 'Use Node.js and MIDI for creative coding projects.', 'Node.js', 'tutorial'),
(26, 'Generative Art with C++', 'https://example.com/generative-art-cpp', 'Create generative art using C++.', 'C++', 'tutorial'),
(27, 'Creative Coding with OpenFrameworks', 'https://example.com/openframeworks-coding', 'Learn creative coding with OpenFrameworks in C++.', 'C++', 'tutorial'),
(28, 'Interactive Installations with C++', 'https://example.com/interactive-installations-cpp', 'Build interactive installations using C++.', 'C++', 'tutorial'),
(29, 'Data Visualization with C++', 'https://example.com/data-visualization-cpp', 'Create data visualizations using C++.', 'C++', 'tutorial'),
(30, 'Real-Time Graphics with C++', 'https://example.com/real-time-graphics-cpp', 'Learn to create real-time graphics using C++.', 'C++', 'tutorial'),
(31, 'Creative Coding with Cinder', 'https://example.com/cinder-coding', 'Learn creative coding with Cinder in C++.', 'C++', 'tutorial'),
(32, 'Algorithmic Art with C++', 'https://example.com/algorithmic-art-cpp', 'Create algorithmic art using C++.', 'C++', 'tutorial'),
(33, 'Generative Music with C++', 'https://example.com/generative-music-cpp', 'Create generative music using C++.', 'C++', 'tutorial'),
(34, 'Interactive Graphics with C++', 'https://example.com/interactive-graphics-cpp', 'Build interactive graphics using C++.', 'C++', 'tutorial'),
(35, 'Creative Coding in Visual C++', 'https://example.com/visual-cpp-coding', 'Learn creative coding in Visual C++.', 'C++', 'tutorial'),
(36, 'Generative Art with C#', 'https://example.com/generative-art-csharp', 'Create generative art using C#.', 'C#', 'tutorial'),
(37, 'Creative Coding with Unity', 'https://example.com/unity-coding', 'Learn creative coding with Unity in C#.', 'C#', 'tutorial'),
(38, 'Interactive Installations with C#', 'https://example.com/interactive-installations-csharp', 'Build interactive installations using C#.', 'C#', 'tutorial'),
(39, 'Data Visualization with C#', 'https://example.com/data-visualization-csharp', 'Create data visualizations using C#.', 'C#', 'tutorial'),
(40, 'Real-Time Graphics with C#', 'https://example.com/real-time-graphics-csharp', 'Learn to create real-time graphics using C#.', 'C#', 'tutorial'),
(41, 'Generative Design with C#', 'https://example.com/generative-design-csharp', 'Explore generative design techniques using C#.', 'C#', 'tutorial'),
(42, 'Algorithmic Art with C#', 'https://example.com/algorithmic-art-csharp', 'Create algorithmic art using C#.', 'C#', 'tutorial'),
(43, 'Interactive Sound with C#', 'https://example.com/interactive-sound-csharp', 'Build interactive sound installations using C#.', 'C#', 'tutorial'),
(44, 'Generative Music with C#', 'https://example.com/generative-music-csharp', 'Create generative music using C#.', 'C#', 'tutorial'),
(45, 'Creative Coding with Windows Forms', 'https://example.com/windows-forms-coding', 'Learn creative coding with Windows Forms in C#.', 'C#', 'tutorial'),
(46, 'Cross-Platform Creative Coding', 'https://example.com/cross-platform-coding', 'Learn creative coding across multiple platforms.', 'JavaScript', 'tutorial'),
(47, 'Multimedia Art with Node.js', 'https://example.com/multimedia-art-nodejs', 'Create multimedia art using Node.js.', 'Node.js', 'tutorial'),
(48, 'Generative Algorithms in C++ and C#', 'https://example.com/generative-algorithms', 'Explore generative algorithms using both C++ and C#.', 'C++', 'tutorial'),
(49, 'Interactive Graphics with JavaScript and Node.js', 'https://example.com/interactive-graphics-js-nodejs', 'Build interactive graphics using JavaScript and Node.js.', 'JavaScript', 'tutorial'),
(50, 'Creative Sound Design with C++ and C#', 'https://example.com/creative-sound-design', 'Create creative sound designs using C++ and C#.', 'C++', 'tutorial'),
(51, 'Generative Art Source Code in JavaScript', 'https://example.com/source/generative-art-js', 'Source code for generative art projects in JavaScript.', 'JavaScript', 'source code'),
(52, 'Interactive Visualizations Source Code', 'https://example.com/source/interactive-visuals-js', 'Source code for interactive visualizations using JavaScript.', 'JavaScript', 'source code'),
(53, 'JavaScript Animation Source Code', 'https://example.com/source/js-animation', 'Source code for creating animations using JavaScript.', 'JavaScript', 'source code'),
(54, 'WebGL Art Source Code', 'https://example.com/source/webgl-art', 'Source code for creating art with WebGL and JavaScript.', 'JavaScript', 'source code'),
(55, 'Creative Coding with p5.js Source Code', 'https://example.com/source/p5js', 'Source code for creative coding projects using p5.js.', 'JavaScript', 'source code'),
(56, 'Generative Art Source Code in Node.js', 'https://example.com/source/generative-art-nodejs', 'Source code for generative art projects in Node.js.', 'Node.js', 'source code'),
(57, 'Interactive Installations Source Code', 'https://example.com/source/interactive-installations-nodejs', 'Source code for interactive installations using Node.js.', 'Node.js', 'source code'),
(58, 'Real-Time Graphics Source Code', 'https://example.com/source/real-time-graphics-nodejs', 'Source code for real-time graphics using Node.js.', 'Node.js', 'source code'),
(59, 'Data-Driven Art Source Code', 'https://example.com/source/data-driven-art-nodejs', 'Source code for data-driven art using Node.js.', 'Node.js', 'source code'),
(60, 'Generative Music Source Code', 'https://example.com/source/generative-music-nodejs', 'Source code for generative music projects using Node.js.', 'Node.js', 'source code'),
(61, 'Generative Art Source Code in C++', 'https://example.com/source/generative-art-cpp', 'Source code for generative art projects in C++.', 'C++', 'source code'),
(62, 'Creative Coding with OpenFrameworks Source Code', 'https://example.com/source/openframeworks-cpp', 'Source code for creative coding projects using OpenFrameworks in C++.', 'C++', 'source code'),
(63, 'Interactive Installations Source Code', 'https://example.com/source/interactive-installations-cpp', 'Source code for interactive installations using C++.', 'C++', 'source code'),
(64, 'Real-Time Graphics Source Code', 'https://example.com/source/real-time-graphics-cpp', 'Source code for real-time graphics using C++.', 'C++', 'source code'),
(65, 'Algorithmic Art Source Code', 'https://example.com/source/algorithmic-art-cpp', 'Source code for algorithmic art using C++.', 'C++', 'source code'),
(66, 'Generative Art Source Code in C#', 'https://example.com/source/generative-art-csharp', 'Source code for generative art projects in C#.', 'C#', 'source code'),
(67, 'Creative Coding with Unity Source Code', 'https://example.com/source/unity-csharp', 'Source code for creative coding projects using Unity in C#.', 'C#', 'source code'),
(68, 'Interactive Installations Source Code', 'https://example.com/source/interactive-installations-csharp', 'Source code for interactive installations using C#.', 'C#', 'source code'),
(69, 'Real-Time Graphics Source Code', 'https://example.com/source/real-time-graphics-csharp', 'Source code for real-time graphics using C#.', 'C#', 'source code'),
(70, 'Generative Music Source Code', 'https://example.com/source/generative-music-csharp', 'Source code for generative music projects using C#.', 'C#', 'source code'),
(71, 'Creative Coding with JavaScript', 'https://example.com/creative-coding-js', 'A comprehensive site for learning creative coding with JavaScript.', 'JavaScript', 'site'),
(72, 'Generative Art with JavaScript', 'https://example.com/generative-art-js-site', 'A site dedicated to generative art created with JavaScript.', 'JavaScript', 'site'),
(73, 'Interactive JavaScript Projects', 'https://example.com/interactive-js-projects', 'Showcase of interactive projects created with JavaScript.', 'JavaScript', 'site'),
(74, 'JavaScript Visualization Gallery', 'https://example.com/js-visualization-gallery', 'A gallery of data visualizations created with JavaScript.', 'JavaScript', 'site'),
(75, 'JavaScript Art', 'https://example.com/js-art', 'A site showcasing artistic projects created with JavaScript.', 'JavaScript', 'site'),
(76, 'Creative Coding with Node.js', 'https://example.com/creative-coding-nodejs', 'A comprehensive site for learning creative coding with Node.js.', 'Node.js', 'site'),
(77, 'Generative Art with Node.js', 'https://example.com/generative-art-nodejs-site', 'A site dedicated to generative art created with Node.js.', 'Node.js', 'site'),
(78, 'Interactive Node.js Projects', 'https://example.com/interactive-nodejs-projects', 'Showcase of interactive projects created with Node.js.', 'Node.js', 'site'),
(79, 'Node.js Visualization Gallery', 'https://example.com/nodejs-visualization-gallery', 'A gallery of data visualizations created with Node.js.', 'Node.js', 'site'),
(80, 'Node.js Art', 'https://example.com/nodejs-art', 'A site showcasing artistic projects created with Node.js.', 'Node.js', 'site'),
(81, 'Creative Coding with C++', 'https://example.com/creative-coding-cpp', 'A comprehensive site for learning creative coding with C++.', 'C++', 'site'),
(82, 'Generative Art with C++', 'https://example.com/generative-art-cpp-site', 'A site dedicated to generative art created with C++.', 'C++', 'site'),
(83, 'Interactive C++ Projects', 'https://example.com/interactive-cpp-projects', 'Showcase of interactive projects created with C++.', 'C++', 'site'),
(84, 'C++ Visualization Gallery', 'https://example.com/cpp-visualization-gallery', 'A gallery of data visualizations created with C++.', 'C++', 'site'),
(85, 'C++ Art', 'https://example.com/cpp-art', 'A site showcasing artistic projects created with C++.', 'C++', 'site'),
(86, 'Creative Coding with C#', 'https://example.com/creative-coding-csharp', 'A comprehensive site for learning creative coding with C#.', 'C#', 'site'),
(87, 'Generative Art with C#', 'https://example.com/generative-art-csharp-site', 'A site dedicated to generative art created with C#.', 'C#', 'site'),
(88, 'Interactive C# Projects', 'https://example.com/interactive-csharp-projects', 'Showcase of interactive projects created with C#.', 'C#', 'site'),
(89, 'C# Visualization Gallery', 'https://example.com/csharp-visualization-gallery', 'A gallery of data visualizations created with C#.', 'C#', 'site'),
(90, 'C# Art', 'https://example.com/csharp-art', 'A site showcasing artistic projects created with C#.', 'C#', 'site'),
(91, 'Generative Art with JavaScript', 'https://example.com/generative-art-js', 'Learn to create generative art using JavaScript.', 'JavaScript', 'tutorial'),
(92, 'Interactive Visualizations with JavaScript', 'https://example.com/interactive-visuals-js', 'Create interactive visualizations using JavaScript.', 'JavaScript', 'tutorial'),
(93, 'JavaScript Animation', 'https://example.com/javascript-animation', 'Learn how to create animations using JavaScript.', 'JavaScript', 'source code'),
(94, 'Node.js for Creative Coding', 'https://example.com/nodejs-creative-coding', 'Explore creative coding techniques with Node.js.', 'Node.js', 'tutorial'),
(95, 'Generative Art with C++', 'https://example.com/generative-art-cpp', 'Create generative art using C++.', 'C++', 'tutorial'),
(96, 'Creative Coding with Unity', 'https://example.com/unity-creative-coding', 'Learn creative coding with Unity in C#.', 'C#', 'tutorial');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
