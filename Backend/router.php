<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Include necessary files
require_once __DIR__ . '/../Backend/database/db_connect.php';
require_once __DIR__ . '/../Backend/user_services/login_user.php';
require_once __DIR__ . '/../Backend/user_services/logout_user.php';
require_once __DIR__ . '/../Backend/user_services/register_user.php';
require_once __DIR__ . '/../Backend/user_services/admin_register_user.php';
require_once __DIR__ . '/../Backend/search_services/search.php';
require_once __DIR__ . '/../Backend/database/add_row.php';
require_once __DIR__ . '/../Backend/database/delete_row.php';
require_once __DIR__ . '/../Backend/database/export_data.php';
require_once __DIR__ . '/../Backend/database/get_rows.php';
require_once __DIR__ . '/../Backend/database/import_data.php';
require_once __DIR__ . '/../Backend/database/save_edit.php';
require_once __DIR__ . '/../Backend/user_services/get_users.php';
require_once __DIR__ . '/../Backend/user_services/toggle_admin.php';

class Router {
    private $routes;
    private static $instance = null;

    public function __construct() {
        $this->routes = [];
    }

    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new Router();
        }
        return self::$instance;
    }

    public function addRoute($method, $pattern, $callback) {
        $this->routes[] = ['method' => $method, 'pattern' => $pattern, 'callback' => $callback];
    }

    public function route() {
        $requestPath = $_SERVER['REQUEST_URI'];
        $method = $_SERVER['REQUEST_METHOD'];

        $basePath = '/ResourceFi/Web-Technologies';
        $path = strtolower(str_replace($basePath, '', strtok($requestPath, '?')));

        error_log("Request Path: " . $path);

        foreach ($this->routes as $route) {
            if ($method == $route['method'] && preg_match($route['pattern'], $path, $matches)) {
                array_shift($matches);
                call_user_func_array($route['callback'], $matches);
                return;
            }
        }

        http_response_code(404);
        echo '404 Not Found';
    }
}

$router = Router::getInstance();

// Define routes for rendering pages
$router->addRoute('GET', '/^\/home$/', function() {
    require_once __DIR__ . '/../Frontend/index.html';
    exit;
});

$router->addRoute('GET', '/^\/login$/', function() {
    require_once __DIR__ . '/../Frontend/login.html';
    exit;
});

$router->addRoute('GET', '/^\/signup$/', function() {
    require_once __DIR__ . '/../Frontend/signup.html';
    exit;
});

$router->addRoute('GET', '/^\/admin$/', function() {
    require_once __DIR__ . '/../Frontend/admin.html';
    exit;
});

$router->addRoute('GET', '/^\/config$/', function() {
    require_once __DIR__ . '/../Frontend/config_database.html';
    exit;
});

$router->addRoute('GET', '/^\/configusers$/', function() {
    require_once __DIR__ . '/../Frontend/user_management.html';
    exit;
});

// Define routes for user services
$router->addRoute('POST', '/^\/register$/', function() {
    register();
    exit;
});
$router->addRoute('POST', '/^\/login$/', function() {
    login();
    exit;
});
$router->addRoute('POST', '/^\/logout$/', function() {
    logout();
    exit;
});

// Define routes for database services
$router->addRoute('POST', '/^\/add_row$/', function() {
    require_once __DIR__ . '/../Backend/database/add_row.php';
    exit;
});
$router->addRoute('POST', '/^\/delete_row$/', function() {
    require_once __DIR__ . '/../Backend/database/delete_row.php';
    exit;
});
$router->addRoute('POST', '/^\/export_data$/', function() {
    require_once __DIR__ . '/../Backend/database/export_data.php';
    exit;
});
$router->addRoute('GET', '/^\/get_rows$/', function() {
    require_once __DIR__ . '/../Backend/database/get_rows.php';
    exit;
});
$router->addRoute('POST', '/^\/import_data$/', function() {
    require_once __DIR__ . '/../Backend/database/import_data.php';
    exit;
});
$router->addRoute('POST', '/^\/save_edit$/', function() {
    require_once __DIR__ . '/../Backend/database/save_edit.php';
    exit;
});

// Define routes for search controller
$router->addRoute('GET', '/^\/search$/', function() {
    require_once __DIR__ . '/../Backend/search_services/search.php';
    exit;
});

// Define routes for user management
$router->addRoute('GET', '/^\/get_users$/', function() {
    require_once __DIR__ . '/../Backend/user_services/get_users.php';
    exit;
});
$router->addRoute('POST', '/^\/register_user$/', function() {
    require_once __DIR__ . '/../Backend/user_services/register_user.php';
    exit;
});
$router->addRoute('POST', '/^\/admin_register_user$/', function() {
    require_once __DIR__ . '/../Backend/user_services/admin_register_user.php';
    exit;
});
$router->addRoute('POST', '/^\/save_edit_user$/', function() {
    require_once __DIR__ . '/../Backend/user_services/save_edit.php';
    exit;
});
$router->addRoute('POST', '/^\/delete_user$/', function() {
    require_once __DIR__ . '/../Backend/user_services/delete_user.php';
    exit;
});
$router->addRoute('POST', '/^\/toggle_admin$/', function() {
    require_once __DIR__ . '/../Backend/user_services/toggle_admin.php';
    exit;
});

// Process the routing
$router->route();
?>
