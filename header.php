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
    <div id="loading">Loading, Please wait...</div>
<div id="mainnav" class="navbar">
  <div class="navbar-inner-matrix">
    <a class="brand" href="#"><img src="img/matrix-beta.png" /></a>
    <ul class="nav">
      <li><a href="index.php">Home</a></li>
      <li><a href="projects.php">Users</a></li>
      <li><a href="projects.php">Projects</a></li>
      <li><a href="about_us.php">About The Matrix</a></li>
      <li><a href="#"><i class="icon-filter"></i> Filter Users</a></li>
      <li><a href="skill_hours_report.php">Mainframe</a></li>
    </ul>
    <div id="header-login" class="fr">
    <?php include("login_script.php"); ?>
    <?php if($person):?>
      <p class="greeting">Welcome, <b><?php echo htmlspecialchars($person->name)?></b> <a href="?logout" class="logoutButton">Logout</a></p>
    <?php else:?>
        <a href="<?php echo $client->createAuthUrl()?>" class="googleLoginButton">Sign in with Google</a>
      <?php endif;?>
    </div>
  </div>
</div>