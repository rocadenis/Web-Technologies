-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost
-- Timp de generare: iun. 17, 2024 la 11:43 PM
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
  `realtime_collaboration` tinyint(1) DEFAULT NULL,
  `live_coding` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `resources`
--

INSERT INTO `resources` (`id`, `name`, `url`, `realtime_collaboration`, `live_coding`, `description`) VALUES
(1, 'Processing', 'https://processing.org/', NULL, NULL, 'Processing is a flexible software sketchbook and a language for learning how to code within the context of the visual arts.'),
(2, 'Cinder', 'https://libcinder.org/', NULL, NULL, 'Cinder is a community-developed, free and open source library for professional-quality creative coding in C++.'),
(3, 'openFrameworks', 'https://openframeworks.cc/', NULL, NULL, 'openFrameworks is an open source C++ toolkit for creative coding.'),
(4, 'C4', 'https://www.c4ios.com/', NULL, NULL, 'C4 is an open-source API for rapid-prototyping of computational art.'),
(5, 'Unity', 'https://unity.com/', NULL, NULL, 'Unity is a cross-platform game engine developed by Unity Technologies.'),
(6, 'Godot', 'https://godotengine.org/', NULL, NULL, 'Godot is a feature-packed, cross-platform game engine to create 2D and 3D games from a unified interface.'),
(7, 'PlayCanvas', 'https://playcanvas.com/', NULL, NULL, 'PlayCanvas is an open-source game engine that is developed by PlayCanvas.'),
(8, 'hg_sdf', 'https://github.com/cginternals/gloperate', NULL, NULL, 'hg_sdf is a C++ library for signed distance functions.'),
(9, 'nannou', 'https://nannou.cc/', NULL, NULL, 'nannou is a creative coding framework for Rust.'),
(10, 'thi.ng', 'https://thi.ng/', NULL, NULL, 'thi.ng is a collection of open-source tools and libraries for functional programming, data visualization, and creative coding.'),
(11, 'PixelKit', 'https://pixelkit.com/', NULL, NULL, 'PixelKit is a toolkit for creating pixel art and animations.'),
(12, 'OPENRNDR', 'https://openrndr.org/', NULL, NULL, 'OPENRNDR is a tool to create modern, high-performance graphics applications.'),
(13, 'Phaser', 'https://phaser.io/', NULL, NULL, 'Phaser is a fast, robust, and open-source game framework.'),
(14, 'Canvas-sketch', 'https://canvas-sketch.com/', NULL, NULL, 'Canvas-sketch is a framework for making generative artwork in JavaScript and the browser.'),
(15, 'AsyncGraphics', 'https://github.com/gyscos/async_graphics', NULL, NULL, 'AsyncGraphics is a Rust library for creative coding with async execution.'),
(16, 'Lygia', 'https://lygia.xyz/', NULL, NULL, 'Lygia is a collection of reusable WebGL shader code.'),
(17, 'Fragment.tools', 'https://www.fragment.tools/', NULL, NULL, 'Fragment.tools is an application for creating shader-based artwork.'),
(18, 'vvvv', 'https://vvvv.org/', NULL, NULL, 'vvvv is a hybrid visual/textual live-programming environment for easy prototyping and development.'),
(19, 'NodeBox', 'https://www.nodebox.net/', NULL, NULL, 'NodeBox is an open-source application for creating 2D visuals using Python code.'),
(20, 'TouchDesigner', 'https://derivative.ca/', NULL, NULL, 'TouchDesigner is a node-based visual programming language for real-time interactive multimedia content.'),
(21, 'Quartz Composer', 'https://developer.apple.com/graphics-imaging/quartz-composer/', NULL, NULL, 'Quartz Composer is a node-based visual programming language provided as part of the Xcode development environment.'),
(22, 'Vuo', 'https://vuo.org/', NULL, NULL, 'Vuo is a real-time visual programming language for multimedia artists and creators.'),
(23, 'Max', 'https://cycling74.com/products/max', NULL, NULL, 'Max is a visual programming language for music and multimedia.'),
(24, 'Pure Data', 'https://puredata.info/', NULL, NULL, 'Pure Data is an open-source visual programming language for multimedia.'),
(25, 'ossia score', 'https://ossia.io/', NULL, NULL, 'ossia score is a free software for interactive scenography.'),
(26, 'tooll', 'https://tooll.io/', NULL, NULL, 'tooll is a node-based editor for interactive motion graphics.'),
(27, 'XOD', 'https://xod.io/', NULL, NULL, 'XOD is a visual programming language for microcontrollers and Internet of Things.'),
(28, 'Isadora', 'https://troikatronix.com/', NULL, NULL, 'Isadora is a proprietary graphic programming environment for real-time manipulation of digital video.'),
(29, 'cables', 'https://cables.gl/', NULL, NULL, 'cables is an online application for creating interactive visual content.'),
(30, 'eternal', 'https://www.notion.so/Eternal-Canvas-550f0db8c7c3441bb7850f15c3e0a6d3', NULL, NULL, 'eternal is a platform for interactive art and data visualization.'),
(31, 'Notch Builder', 'https://notch.one/', NULL, NULL, 'Notch Builder is a tool for creating interactive motion graphics.'),
(32, 'JOY.JS', 'https://joy.js.org/', NULL, NULL, 'JOY.JS is a library for creative coding with joy.js.'),
(33, 'Circles', 'https://www.circles.dev/', NULL, NULL, 'Circles is an online platform for generative art.'),
(34, 'TIC-80', 'https://tic80.com/', NULL, NULL, 'TIC-80 is a fantasy computer for making, playing, and sharing tiny games.'),
(35, 'SuperCollider', 'https://supercollider.github.io/', NULL, NULL, 'SuperCollider is a platform for audio synthesis and algorithmic composition.'),
(36, 'ChucK', 'http://chuck.cs.princeton.edu/', NULL, NULL, 'ChucK is a programming language for real-time sound synthesis and music creation.'),
(37, 'TidalCycles', 'https://tidalcycles.org/', NULL, NULL, 'TidalCycles is a live coding environment for creating pattern-based music.'),
(38, 'Sonic Pi', 'https://sonic-pi.net/', NULL, NULL, 'Sonic Pi is a live coding music synth.'),
(39, 'Csound', 'https://csound.com/', NULL, NULL, 'Csound is a sound and music computing system.'),
(40, 'Orca', 'https://hundredrabbits.itch.io/orca', NULL, NULL, 'Orca is an esoteric programming language for creating procedural sequencers.'),
(41, 'handel', 'https://github.com/rodrigosetti/handel', NULL, NULL, 'handel is a library for composable dataflow programming in JavaScript.'),
(42, 'Overtone', 'https://overtone.github.io/', NULL, NULL, 'Overtone is a Clojure-based music environment.'),
(43, 'Melrōse', 'https://github.com/trewick/melrose', NULL, NULL, 'Melrōse is a library for making music with code in Go.'),
(44, 'Glicol', 'https://glicol.org/', NULL, NULL, 'Glicol is a computer music language for live coding.'),
(45, 'three.js', 'https://threejs.org/', NULL, NULL, 'three.js is a cross-browser JavaScript library and API used to create and display animated 3D computer graphics in a web browser.'),
(46, 'regl', 'http://regl.party/', NULL, NULL, 'regl is a functional WebGL library.'),
(47, 'Stackgl', 'http://stack.gl/', NULL, NULL, 'Stackgl is a collection of open software for WebGL.'),
(48, 'Paper.js', 'http://paperjs.org/', NULL, NULL, 'Paper.js is an open-source vector graphics scripting framework.'),
(49, 'Pixi.js', 'https://pixijs.com/', NULL, NULL, 'Pixi.js is a 2D rendering engine that helps you create beautiful digital content.'),
(50, 'p5.js', 'https://p5js.org/', NULL, NULL, 'p5.js is a JavaScript library that starts with the original goal of Processing.'),
(51, 'Pts.js', 'https://ptsjs.org/', NULL, NULL, 'Pts.js is a library for visualization and creative coding.'),
(52, 'Fabric.js', 'http://fabricjs.com/', NULL, NULL, 'Fabric.js is a JavaScript library for working with canvas.'),
(53, 'Maker.js', 'https://maker.js.org/', NULL, NULL, 'Maker.js is a JavaScript library for creating modular and parametric 2D drawings.'),
(54, 'OpenJSCAD', 'https://openjscad.org/', NULL, NULL, 'OpenJSCAD is a browser-based 3D modeling tool.'),
(55, 'Sketch.js', 'https://github.com/soulwire/sketch.js', NULL, NULL, 'Sketch.js is a tiny framework for creating animations and interactive graphics.'),
(56, 'Two.js', 'https://two.js.org/', NULL, NULL, 'Two.js is a renderer-agnostic two-dimensional drawing API for modern web browsers.'),
(57, 'ClayGL', 'https://github.com/pissang/claygl', NULL, NULL, 'ClayGL is a WebGL graphic library for building scalable Web3D applications.'),
(58, 'Proton', 'https://a-jie.github.io/Proton/', NULL, NULL, 'Proton is a lightweight and flexible JavaScript particle engine.'),
(59, 'lightgl.js', 'http://evanw.github.io/lightgl.js/', NULL, NULL, 'lightgl.js is a lightweight WebGL library.'),
(60, 'picogl.js', 'https://github.com/tsherif/picogl.js', NULL, NULL, 'picogl.js is a minimal WebGL library.'),
(61, 'Alfrid', 'http://workshop.chromeexperiments.com/examples/gui/#1--Basic', NULL, NULL, 'Alfrid is a library for creating interactive 3D graphics on the web.'),
(62, 'Babylon.js', 'https://www.babylonjs.com/', NULL, NULL, 'Babylon.js is a powerful, beautiful, simple, and open game and rendering engine.'),
(63, 'twigl', 'https://github.com/twigl/twigl', NULL, NULL, 'twigl is a shader-based game engine.'),
(64, 'luma.gl', 'https://luma.gl/', NULL, NULL, 'luma.gl is a JavaScript framework for high-performance visualization.'),
(65, 'css-doodle', 'https://css-doodle.com/', NULL, NULL, 'css-doodle is a web component for drawing patterns with CSS.'),
(66, 'OGL.js', 'https://github.com/oframe/ogl', NULL, NULL, 'OGL.js is a minimal WebGL framework.'),
(67, 'Zdog', 'https://zzz.dog/', NULL, NULL, 'Zdog is a pseudo-3D engine for canvas and SVG.'),
(68, 'Oimo.js', 'https://github.com/lo-th/Oimo.js', NULL, NULL, 'Oimo.js is a lightweight 3D physics engine for JavaScript.'),
(69, 'Ammo.js', 'https://kripken.github.io/ammo.js/', NULL, NULL, 'Ammo.js is a direct port of the Bullet physics engine to JavaScript.'),
(70, 'Theatre.js', 'https://www.theatrejs.com/', NULL, NULL, 'Theatre.js is an animation library for high-fidelity motion graphics.'),
(71, 'GraphicsJS', 'http://www.graphicsjs.org/', NULL, NULL, 'GraphicsJS is a lightweight JavaScript graphics library.'),
(72, 'MadMapper', 'https://madmapper.com/', NULL, NULL, 'MadMapper is a software for video and light mapping.'),
(73, 'VDMX', 'https://vdmx.vidvox.net/', NULL, NULL, 'VDMX is a software for real-time video mixing.'),
(74, 'Modul8', 'https://modul8.ch/', NULL, NULL, 'Modul8 is a modular video mixing software.'),
(75, 'Resolume', 'https://resolume.com/', NULL, NULL, 'Resolume is an instrument for VJs, AV performers and video artists.'),
(76, 'CoGe VJ', 'https://imimot.com/', NULL, NULL, 'CoGe VJ is a semi-modular video jockey software for creating live visuals.'),
(77, 'VirtualMapper', 'https://virtualmapper.net/', NULL, NULL, 'VirtualMapper is a projection mapping software.'),
(78, 'Millumin', 'https://www.millumin.com/', NULL, NULL, 'Millumin is a tool to create audiovisual shows.'),
(79, 'Smode', 'https://smode.fr/', NULL, NULL, 'Smode is a real-time compositing and media server software.'),
(80, 'Veejay', 'https://veejayhq.net/', NULL, NULL, 'Veejay is a software for real-time video editing.'),
(81, 'Shadertoy', 'https://www.shadertoy.com/', NULL, NULL, 'Shadertoy is a platform to create and share shaders.'),
(82, 'Shader Park', 'https://shaderpark.com/', NULL, NULL, 'Shader Park is a platform for interactive shaders.'),
(83, 'GLSL Sandbox', 'http://glslsandbox.com/', NULL, NULL, 'GLSL Sandbox is a platform to create and share GLSL shaders.'),
(84, 'Shdr Editor', 'https://shdr.bkcore.com/', NULL, NULL, 'Shdr Editor is an online GLSL editor.'),
(85, 'CodePen', 'https://codepen.io/', NULL, NULL, 'CodePen is an online community for testing and showcasing user-created HTML, CSS and JavaScript code snippets.'),
(86, 'Shadershop', 'https://shadershop.com/', NULL, NULL, 'Shadershop is a visual tool for creating GLSL shaders.'),
(87, 'Vertexshaderart', 'https://vertexshaderart.com/', NULL, NULL, 'Vertexshaderart is a platform for creating and sharing vertex shaders.'),
(88, 'Cyos', 'https://cyos.babylonjs.com/', NULL, NULL, 'Cyos is a visual shader editor for Babylon.js.'),
(89, 'GlslEditor', 'https://glslsandbox.com/', NULL, NULL, 'GlslEditor is an online GLSL editor.'),
(90, 'OpenProcessing', 'https://www.openprocessing.org/', NULL, NULL, 'OpenProcessing is an online community for sharing Processing sketches.'),
(91, 'P5.js Editor', 'https://editor.p5js.org/', NULL, NULL, 'P5.js Editor is an online editor for p5.js.'),
(92, 'LiveCodeLab', 'https://livecodelab.net/', NULL, NULL, 'LiveCodeLab is an online platform for live coding.'),
(93, 'Turtletoy', 'https://turtletoy.net/', NULL, NULL, 'Turtletoy is a platform for creating generative drawings with code.'),
(94, 'ShaderGif', 'https://shadergif.com/', NULL, NULL, 'ShaderGif is an online platform for creating GIFs with GLSL shaders.'),
(95, 'P5LIVE', 'https://p5live.org/', NULL, NULL, 'P5LIVE is an online editor for live coding with p5.js.'),
(96, 'NEORT', 'https://neort.io/', NULL, NULL, 'NEORT is a platform for sharing interactive art.'),
(97, 'Shelly', 'https://shelly.cloud/', NULL, NULL, 'Shelly is a platform for creating and sharing generative art.'),
(98, 'tixy.land', 'https://tixy.land/', NULL, NULL, 'tixy.land is a platform for creating generative animations with code.'),
(99, 'BBC Micro bot', 'https://www.bbc.co.uk/programmes/b01s9k8p', NULL, NULL, 'BBC Micro bot is a platform for creating generative music with code.'),
(100, 'Hydra', 'https://hydra.ojack.xyz/', NULL, NULL, 'Hydra is a platform for creating and sharing live visuals with code.'),
(101, 'Arduino', 'https://www.arduino.cc/', NULL, NULL, 'Arduino is an open-source electronics platform based on easy-to-use hardware and software.'),
(102, 'Raspberry Pi', 'https://www.raspberrypi.org/', NULL, NULL, 'Raspberry Pi is a series of small single-board computers developed by the Raspberry Pi Foundation.'),
(103, 'Puck.js', 'https://www.puck-js.com/', NULL, NULL, 'Puck.js is a smart Bluetooth button that can be programmed wirelessly.'),
(104, 'BeagleBoard', 'https://beagleboard.org/', NULL, NULL, 'BeagleBoard is a low-power open-source single-board computer.'),
(105, 'Makey Makey', 'https://makeymakey.com/', NULL, NULL, 'Makey Makey is an invention kit for the 21st century.'),
(106, 'Leap Motion', 'https://www.ultraleap.com/', NULL, NULL, 'Leap Motion is a computer hardware sensor device that supports hand and finger motions as input.'),
(107, 'AxiDraw', 'https://www.axidraw.com/', NULL, NULL, 'AxiDraw is a pen plotter that is designed to work with a variety of writing instruments.'),
(108, 'Phidgets', 'https://www.phidgets.com/', NULL, NULL, 'Phidgets are modular sensors and controllers that are easy to interface with.'),
(109, 'Teensy', 'https://www.pjrc.com/teensy/', NULL, NULL, 'Teensy is a complete USB-based microcontroller development system.'),
(110, 'Lightform', 'https://lightform.com/', NULL, NULL, 'Lightform is a projected augmented reality device that makes it easy to create stunning visuals.'),
(111, 'Structure Synth', 'http://structuresynth.sourceforge.net/', NULL, NULL, 'Structure Synth is a cross-platform application for creating 3D structures.'),
(112, 'F3', 'https://www.f3.to/', NULL, NULL, 'F3 is a real-time 3D software renderer.'),
(113, 'Fragment', 'http://www.fragmentapp.info/', NULL, NULL, 'Fragment is an online platform for creating and sharing generative art.'),
(114, 'ShaderTool', 'https://shadertool.com/', NULL, NULL, 'ShaderTool is an online platform for creating and sharing GLSL shaders.'),
(115, 'Syphon', 'http://syphon.v002.info/', NULL, NULL, 'Syphon is a framework for sharing video content between applications.'),
(116, 'KodeLife', 'https://hexler.net/products/kodelife', NULL, NULL, 'KodeLife is a live coding tool for creating real-time visual effects.'),
(117, 'ISF', 'https://vdmx.vidvox.net/tutorials/isf', NULL, NULL, 'ISF is a standard for sharing GLSL shaders between applications.'),
(118, 'glslViewer', 'https://github.com/patriciogonzalezvivo/glslViewer', NULL, NULL, 'glslViewer is a command-line tool for creating and sharing GLSL shaders.'),
(119, 'DrawBot', 'http://drawbot.com/', NULL, NULL, 'DrawBot is a Python-based graphics module for creating 2D graphics.'),
(120, 'Klak', 'https://github.com/keijiro/Klak', NULL, NULL, 'Klak is a tool for creating real-time graphics.'),
(121, 'basil.js\n\n', 'https://basiljs.ch/', NULL, NULL, 'basil.js is a JavaScript library for creating generative art.');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
