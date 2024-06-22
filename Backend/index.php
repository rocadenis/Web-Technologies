@ -0,0 +1,25 @@
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();
$session_timeout = 600; // 10 minutes

if (isset($_SESSION['LAST_ACTIVITY']) && (time() - $_SESSION['LAST_ACTIVITY'] > $session_timeout)) {
    session_unset();
    session_destroy();
} else {
    $_SESSION['LAST_ACTIVITY'] = time();
}

if (!isset($_SESSION['isLogged'])) {
    $_SESSION['isLogged'] = false;
}

// Include the router
require_once 'router.php';

// Process the routing
$router = Router::getInstance();
$router->route();
?>