<?php
require_once 'router.php';


$router = Router::getInstance();

$router->addRoute('GET', '/^\/index$/', function() {
    include 'Frontend/index.html';
    exit;
});

$router->addRoute('GET', '/^\/signup$/', function() {
    include 'Frontend/signup.html';
    exit;
});

$router->addRoute('GET', '/^\/login$/', function() {
    include 'Frontend/login.html';
    exit;
});

$router->addRoute('GET', '/^\/admin$/', function() {
    include 'Frontend/admin.html';
    exit;
});

$router->addRoute('GET', '/^\/config_database$/', function() {
    include 'Frontend/config_database.html';
    exit;
});

$router->addRoute('POST', '/^\/import_data$/', function() {
    (new ResourceController())->importData();
    exit;
});

$router->addRoute('GET', '/^\/export_data$/', function() {
    (new ResourceController())->exportData();
    exit;
});

$router->addRoute('POST', '/^\/add_row$/', function() {
    include 'Backend/database/add_row.php';
    exit;
});

$router->addRoute('POST', '/^\/delete_row$/', function() {
    include 'Backend/database/delete_row.php';
    exit;
});

$router->addRoute('POST', '/^\/save_edit$/', function() {
    include 'Backend/database/save_edit.php';
    exit;
});

$router->addRoute('GET', '/^\/get_rows$/', function() {
    include 'Backend/database/get_rows.php';
    exit;
});

$router->addRoute('POST', '/^\/register_user$/', function() {
    include 'Backend/user_services/register_user.php';
    exit;
});

$router->addRoute('POST', '/^\/login_user$/', function() {
    include 'Backend/user_services/login_user.php';
    exit;
});

$router->addRoute('POST', '/^\/search$/', function() {
    include 'Backend/search_services/search.php';
    exit;
});
?>
