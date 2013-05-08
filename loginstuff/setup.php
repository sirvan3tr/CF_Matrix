<?php
// Includes

require_once 'includes/google-api-php-client/apiClient.php';
require_once 'includes/google-api-php-client/contrib/apiOauth2Service.php';
require_once 'includes/idiorm.php';
require_once 'includes/relativeTime.php';

// Session. Pass your own name if you wish.

session_name('tzine_demo');
session_start();

// Database configuration with the IDIORM library

$host = 'localhost';
$user = 'cf_matrix';
$pass = 'password';
$database = 'cf_matrix';

ORM::configure("mysql:host=$host;dbname=$database");
ORM::configure('username', $user);
ORM::configure('password', $pass);

// Changing the connection to unicode
ORM::configure('driver_options', array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));

// Google API. Obtain these settings from https://code.google.com/apis/console/

$redirect_url = 'http://localhost/cf_matrix/loginstuff/index.php'; // The url of your web site
$client_id = '126101032497-55ltemaee2ae8ti3uafqvn28vkjcaea3.apps.googleusercontent.com';
$client_secret = 'SXp8qfec_LeodEPdo5lchgA2';
$api_key = 'AIzaSyDn8YSyiQbcIa5ik8GjI-z8HGkw-756m9Q';


