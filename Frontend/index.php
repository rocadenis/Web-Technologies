<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resource Finder</title>
    <link rel="stylesheet" href="/ResourceFi/Web-Technologies/Frontend/css/styles.css">
</head>
<body>
    <header>
        <div class="container">
            <h1>Resource Finder</h1>
            <nav>
                <ul>
                    <?php if (isset($_SESSION['user_id'])): ?>
                        <li><a href="admin" class="btn nav-btn">Settings</a></li>
                        <li><a href="#" id="logoutButton" class="btn nav-btn">Logout</a></li>
                    <?php else: ?>
                        <li><a href="login" class="btn nav-btn">Log in</a></li>
                        <li><a href="signup" class="btn nav-btn">Sign up</a></li>
                    <?php endif; ?>
                </ul>
            </nav>
        </div>
    </header>
    <main>
        <div class="hero">
            <h2>Welcome to Resource Finder</h2>
            <p>Your one-stop platform for discovering and sharing creative coding resources.</p>
            <div class="search-container">
                <input type="text" id="search-input" class="search-input" placeholder="Search for resources...">
                <button id="search-btn" class="search-btn">Search</button>
            </div>
            <div id="search-results" class="search-results"></div>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Resource Finder</p>
    </footer>
    <script src="/ResourceFi/Web-Technologies/Frontend/js/search.js"></script>
    <script src="/ResourceFi/Web-Technologies/Frontend/js/scripts.js"></script>
</body>
</html>
