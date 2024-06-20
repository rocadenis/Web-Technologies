<?php
require_once 'router.php';
require_once 'addRoutes.php';

$router = Router::getInstance();
$router->route();
?>
