<?php
class Router {
    private $routes = [];
    private static $instance = null;

    private function __construct() {}

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

        foreach ($this->routes as $route) {
            if ($method == $route['method'] && preg_match($route['pattern'], $requestPath, $matches)) {
                array_shift($matches);
                call_user_func_array($route['callback'], $matches);
                return;
            }
        }

        http_response_code(404);
        echo '404 Not Found';
    }
}
?>
