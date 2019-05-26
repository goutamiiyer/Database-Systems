<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>World Cup Question 2</title>
	<link rel="stylesheet" type="text/css" href="css/soccer.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet'>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body id="wrapper">
	<header>
		<nav class="header">
			<h1>
				<span class="logostyle">
				<img class="logo" src="images/fifalogo.jpg" alt="logo-blanco.png">
				</span>
				<span class="name">FIFA World Cup</span>
				<a class="currentPage" href="question2.php"> Question 2 </a>
				<a class="navlink" href="question1.php"> Question 1 </a>
				<a class="navlink" href="index.php"> Home </a>
			</h1>
		</nav>		
	</header>

	<div class="formbox">
		<span class="qcolor">Question 2:</span> <span class="qtext"> Enter a country name (Russia, Brazil etc) and card color (Yellow, Red). Retrieve and display the GameId and the Player Name combination, such that the Player from that country played in that game and received a card of that color. </span>

		<form class="fbox" id="myForm" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			<label class="fieldName">Country Name</label>
			<div>
				<input type="text" name="countryName" required>
			</div>
			<label class="fieldName">Card Color</label>
			<div>
				<input type="text" name="cardColor" required>
			</div>
			<div class="subBtn">
				<input type="submit" name="formSubmit" class="" value="Search">
			</div>
		</form>		
	</div>

	<?php include_once "validate.php"?>

	<footer class="main-footer">
		<div class="copy">
			<span>Copyright &copy; 2019 All rights reserved | This web interface is made by <span class="copyname">Goutami Padmanabhan & Balaji Gurumoorthy</span></span> <span><a href="#top" class="uparrow"><i class="fas fa-arrow-circle-up fa-lg"></i></a></span>
		</div>
	</footer>
</body>
</html>
