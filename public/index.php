<?php

if (PHP_SAPI == 'cli-server') {
  $_SERVER['SCRIPT_NAME'] = basename(__FILE__);
  // To help the built-in PHP dev server, check if the request was actually for
  // something which should probably be served as a static file
  $url  = parse_url($_SERVER['REQUEST_URI']);
  $file = __DIR__ . $url['path'];
  if (is_file($file)) {
      return false;
  }
}

/**launch from root with: php -S localhost:8000 -t public/
http://localhost:8000/
**/


// Let's ask PHP to display all errors whenever they
// occur in our slim code
ini_set('display_errors', true);

// Require application bootstrap (=php file with the path of all the other required files)
require __DIR__ . '/../bootstrap/app.php';

// Run Slim
$app->run();