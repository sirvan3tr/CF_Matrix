<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>The Matrix</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/datepicker.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href="css/Style.css" rel="stylesheet">

    <link href="plugins/Metro-UI-CSS-master/css/modern.css" rel="stylesheet">
    
    
  </head>
  <body>
    <div id="loading"><div id="loadingtxt"><img src="img/ajax-loader-purple.gif" /> Loading, Please wait...</div></div>
<div id="mainnav" class="navbar">
  <div class="navbar-inner-matrix">
    <a class="brand" href="#">Paradise Matrix Beta</a>
    <ul class="nav">
      <li><a href="index.php">Home</a></li>
      <li><a href="projects.php">Users</a></li>
      <li><a href="projects.php">Projects</a></li>
      <li><a href="about_us.php">About The Matrix</a></li>
      <li><a href="skill_hours_report.php">Mainframe</a></li>
    </ul>
    <div id="header-login" class="fr">
    <?php include("login_script.php"); ?>
    <?php if($person):?>
      <div class="greeting">Welcome, <b><?php echo htmlspecialchars($person->name)?></b> <i class="icon-chevron-down icon-white"></i><a href="?logout" class="logoutButton">Logout</a></div>
    <?php else:?>
        <div class="greeting"><a href="<?php echo $client->createAuthUrl()?>" class="googleLoginButton">Sign in with Google </a></div>
      <?php endif;?>

    </div>
  </div>
</div>
