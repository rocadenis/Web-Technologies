-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost
-- Timp de generare: iun. 20, 2024 la 08:29 PM
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
(1, 'Generative Art with Processing', 'https://example.com/generative-art-processing', 'Guide to creating generative art with Processing', 'Java', 'guide'),
(2, 'Creative Coding with C++', 'https://example.com/creative-coding-cpp', 'Introduction to creative coding with C++', 'C++', 'introduction'),
(3, 'Sound Synthesis with SuperCollider', 'https://example.com/sound-synthesis-supercollider', 'Tutorial on sound synthesis with SuperCollider', 'SuperCollider', 'tutorial'),
(4, 'Interactive Installations with TouchDesigner', 'https://example.com/interactive-installations-touchdesigner', 'Guide to creating interactive installations with TouchDesigner', 'TouchDesigner', 'guide'),
(5, 'Algorithmic Art with Python', 'https://example.com/algorithmic-art-python', 'Tutorial on creating algorithmic art with Python', 'Python', 'tutorial'),
(6, 'Creative Coding with Rust', 'https://example.com/creative-coding-rust', 'Introduction to creative coding with Rust', 'Rust', 'introduction'),
(7, '3D Visualizations with VTK', 'https://example.com/3d-visualizations-vtk', 'Guide to 3D visualizations with VTK', 'C++', 'guide'),
(8, 'Data Art with Python', 'https://example.com/data-art-python', 'Tutorial on creating data art with Python', 'Python', 'tutorial'),
(9, 'Creative Coding with Lua', 'https://example.com/creative-coding-lua', 'Introduction to creative coding with Lua', 'Lua', 'introduction'),
(10, 'Interactive Music with Sonic Pi', 'https://example.com/interactive-music-sonicpi', 'Guide to creating interactive music with Sonic Pi', 'Ruby', 'guide'),
(11, 'WebGL Animations with Babylon.js', 'https://example.com/webgl-animations-babylonjs', 'Tutorial on WebGL animations with Babylon.js', 'JavaScript', 'tutorial'),
(12, 'Creative Coding with Java', 'https://example.com/creative-coding-java', 'Introduction to creative coding with Java', 'Java', 'introduction'),
(13, 'Real-time Interaction with WebSockets', 'https://example.com/realtime-interaction-websockets', 'Guide to real-time interaction with WebSockets', 'JavaScript', 'guide'),
(14, 'Generative Poetry with Python', 'https://example.com/generative-poetry-python', 'Tutorial on creating generative poetry with Python', 'Python', 'tutorial'),
(15, 'Creative Coding with Julia', 'https://example.com/creative-coding-julia', 'Introduction to creative coding with Julia', 'Julia', 'introduction'),
(16, 'Augmented Reality with Unity', 'https://example.com/ar-unity', 'Guide to creating augmented reality experiences with Unity', 'C#', 'guide'),
(17, 'Creative Coding with Go', 'https://example.com/creative-coding-go', 'Introduction to creative coding with Go', 'Go', 'introduction'),
(18, 'Interactive Visualization with Bokeh', 'https://example.com/interactive-visualization-bokeh', 'Guide to interactive visualization with Bokeh', 'Python', 'guide'),
(19, 'Creative Coding with Haskell', 'https://example.com/creative-coding-haskell', 'Introduction to creative coding with Haskell', 'Haskell', 'introduction'),
(20, 'Real-time Data Art with P5.js', 'https://example.com/realtime-data-art', 'Guide to real-time data art with P5.js', 'JavaScript', 'guide'),
(21, 'Creative Coding with ReasonML', 'https://example.com/creative-coding-reasonml', 'Introduction to creative coding with ReasonML', 'ReasonML', 'introduction'),
(22, 'Algorithmic Visuals with VVVV', 'https://example.com/algorithmic-visuals-vvvv', 'Tutorial on creating algorithmic visuals with VVVV', 'VVVV', 'tutorial'),
(23, 'Fractal Landscape Generator', 'https://example.com/fractal-landscape', 'Tool for generating landscapes using fractals', 'JavaScript', 'tool'),
(24, '3D Virtual World with WebGL', 'https://example.com/3d-world', 'Tutorial for creating a 3D virtual world using WebGL', 'WebGL', 'tutorial'),
(25, 'Animation with JavaScript', 'https://example.com/js-animation', 'Guide on creating animations using JavaScript', 'JavaScript', 'guide'),
(26, 'Sound Content with WebAudio API', 'https://example.com/webaudio-sound', 'Tutorial on creating sound content using WebAudio API', 'JavaScript', 'tutorial'),
(27, 'Tactile Interaction in WebApps', 'https://example.com/tactile-interaction', 'Article on implementing tactile interaction in web applications', 'JavaScript', 'article'),
(28, 'Classical Interaction Techniques', 'https://example.com/classical-interaction', 'Overview of classical interaction techniques in creative coding', 'JavaScript', 'overview'),
(29, 'Polyphonic Sound Generator', 'https://example.com/polyphonic-generator', 'Tool for generating polyphonic sounds', 'JavaScript', 'tool'),
(30, '2D Illustration with Canvas', 'https://example.com/2d-illustration', 'Tutorial on creating 2D illustrations using HTML5 Canvas', 'JavaScript', 'tutorial'),
(31, '3D Modeling with Three.js', 'https://example.com/3d-modeling', 'Guide to 3D modeling with Three.js', 'JavaScript', 'guide'),
(32, 'WebAssembly for High Performance', 'https://example.com/webassembly-performance', 'Article on using WebAssembly for high performance web applications', 'WebAssembly', 'article'),
(33, 'Creative Coding with p5.js', 'https://example.com/creative-coding-p5js', 'Introduction to creative coding with p5.js', 'JavaScript', 'introduction'),
(34, 'Interactive Art with Processing.js', 'https://example.com/interactive-art', 'Tutorial on creating interactive art with Processing.js', 'JavaScript', 'tutorial'),
(35, 'Node.js for Creative Coding', 'https://example.com/nodejs-creative-coding', 'Guide to using Node.js in creative coding projects', 'Node.js', 'guide'),
(36, 'VR Experiences with A-Frame', 'https://example.com/vr-experiences', 'Tutorial on creating VR experiences with A-Frame', 'JavaScript', 'tutorial'),
(37, 'Interactive Music with Tone.js', 'https://example.com/interactive-music', 'Guide to creating interactive music with Tone.js', 'JavaScript', 'guide'),
(38, 'Algorithmic Art with Hydra', 'https://example.com/algorithmic-art', 'Tutorial on creating algorithmic art with Hydra', 'JavaScript', 'tutorial'),
(39, 'Generative Art with D3.js', 'https://example.com/generative-art', 'Guide to creating generative art with D3.js', 'JavaScript', 'guide'),
(40, 'Augmented Reality with AR.js', 'https://example.com/augmented-reality', 'Tutorial on creating augmented reality experiences with AR.js', 'JavaScript', 'tutorial'),
(41, 'Creative Coding with ClojureScript', 'https://example.com/clojurescript-coding', 'Introduction to creative coding with ClojureScript', 'ClojureScript', 'introduction'),
(42, 'Data Visualization with Chart.js', 'https://example.com/data-visualization', 'Guide to creating data visualizations with Chart.js', 'JavaScript', 'guide'),
(43, 'Interactive Storytelling with Twine', 'https://example.com/interactive-storytelling', 'Tutorial on creating interactive stories with Twine', 'JavaScript', 'tutorial'),
(44, 'Creative Projects with Arduino', 'https://example.com/arduino-projects', 'Guide to creating creative projects with Arduino', 'JavaScript', 'guide'),
(45, 'Machine Learning in Creative Coding', 'https://example.com/ml-creative-coding', 'Article on using machine learning in creative coding', 'JavaScript', 'article'),
(46, 'Creative Coding for Beginners', 'https://example.com/creative-coding-beginners', 'Introduction to creative coding for beginners', 'JavaScript', 'introduction'),
(47, 'Real-time Graphics with Pixi.js', 'https://example.com/realtime-graphics', 'Guide to real-time graphics with Pixi.js', 'JavaScript', 'guide'),
(48, 'Sound Synthesis with Web Audio API', 'https://example.com/sound-synthesis', 'Tutorial on sound synthesis with Web Audio API', 'JavaScript', 'tutorial'),
(49, 'Creative Coding Workshops', 'https://example.com/creative-coding-workshops', 'List of workshops for learning creative coding', 'JavaScript', 'workshop'),
(50, 'Generative Music with Gibber', 'https://example.com/generative-music', 'Guide to creating generative music with Gibber', 'JavaScript', 'guide'),
(51, 'WebGL Shaders for Beginners', 'https://example.com/webgl-shaders', 'Introduction to WebGL shaders for beginners', 'WebGL', 'introduction'),
(52, 'Interactive Installations with Processing', 'https://example.com/interactive-installations', 'Tutorial on creating interactive installations with Processing', 'JavaScript', 'tutorial'),
(53, '3D Sculpting with SculptGL', 'https://example.com/3d-sculpting', 'Guide to 3D sculpting with SculptGL', 'JavaScript', 'guide'),
(54, 'Algorithmic Music with FoxDot', 'https://example.com/algorithmic-music', 'Tutorial on creating algorithmic music with FoxDot', 'Python', 'tutorial'),
(55, 'Interactive Data Art with D3.js', 'https://example.com/data-art', 'Guide to creating interactive data art with D3.js', 'JavaScript', 'guide'),
(56, 'Live Coding with TidalCycles', 'https://example.com/live-coding', 'Introduction to live coding with TidalCycles', 'Haskell', 'introduction'),
(57, 'Creative Coding with GLSL', 'https://example.com/glsl-coding', 'Guide to creative coding with GLSL', 'GLSL', 'guide'),
(58, 'Real-time Audio with Web Audio API', 'https://example.com/realtime-audio', 'Tutorial on real-time audio processing with Web Audio API', 'JavaScript', 'tutorial'),
(59, 'Creative Coding with Ruby', 'https://example.com/ruby-coding', 'Introduction to creative coding with Ruby', 'Ruby', 'introduction'),
(60, 'Generative Text with Tracery', 'https://example.com/generative-text', 'Guide to creating generative text with Tracery', 'JavaScript', 'guide'),
(61, 'Creative Coding with Python', 'https://example.com/python-coding', 'Introduction to creative coding with Python', 'Python', 'introduction'),
(62, 'Multimedia Art with Max/MSP', 'https://example.com/multimedia-art', 'Guide to creating multimedia art with Max/MSP', 'Max/MSP', 'guide'),
(63, 'Interactive Graphics with Processing', 'https://example.com/interactive-graphics', 'Tutorial on creating interactive graphics with Processing', 'JavaScript', 'tutorial'),
(64, 'Creative Coding for Kids', 'https://example.com/coding-for-kids', 'Introduction to creative coding for kids', 'JavaScript', 'introduction'),
(65, 'Audio Visualization with Three.js', 'https://example.com/audio-visualization', 'Guide to audio visualization with Three.js', 'JavaScript', 'guide'),
(66, 'Creative Coding with Unity', 'https://example.com/unity-coding', 'Introduction to creative coding with Unity', 'C#', 'introduction'),
(67, 'Generative Design with P5.js', 'https://example.com/generative-design', 'Guide to generative design with P5.js', 'JavaScript', 'guide'),
(68, 'Virtual Instruments with Web MIDI API', 'https://example.com/virtual-instruments', 'Tutorial on creating virtual instruments with Web MIDI API', 'JavaScript', 'tutorial'),
(69, 'Creative Coding with Racket', 'https://example.com/racket-coding', 'Introduction to creative coding with Racket', 'Racket', 'introduction'),
(70, 'Generative Animation with Mo.js', 'https://example.com/generative-animation', 'Guide to creating generative animations with Mo.js', 'JavaScript', 'guide'),
(71, 'Creative Coding with Elm', 'https://example.com/elm-coding', 'Introduction to creative coding with Elm', 'Elm', 'introduction'),
(72, 'Interactive 3D Art with WebGL', 'https://example.com/interactive-3d-art', 'Guide to creating interactive 3D art with WebGL', 'WebGL', 'guide');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
