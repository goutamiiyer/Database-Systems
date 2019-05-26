<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>Home</title>
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
				<a class="navlink" href="question2.php"> Question 2 </a>
				<a class="navlink" href="question1.php"> Question 1 </a>
				<a class="currentPage" href="index.php"> Home </a>
			</h1>
		</nav>		
	</header>
	<div>
		<img class="banner" src="images/fifa.jpg" alt="fifa.jpg">
	</div>
	<div class="homebox">
		<div class="linkbox">
			<a class="qlink" href="question1.php"> <span class="qcolor">Question 1:</span> Enter a country name (for example Brazil) in the interface, and then retrieve and display the  Game ID, in which this team played, followed by the player name, who was in the starting lineup for this game, and the player no(player id) of the player. Let the records be sorted by the Game ID  and Player no(Player id). </a>
		</div class = "linkbox">
			<a class="qlink" href="question2.php"> <span class="qcolor">Question 2:</span> Enter a country name (Russia, Brazil etc) and card color (Yellow, Red). Retrieve and display the GameId and the Player Name combination, such that the Player from that country played in that game and received a card of that color. </a>
	</div>

	<footer class="main-footer">
		<div class="copy">
			<span>Copyright &copy; 2019 All rights reserved | This web interface is made by <span class="copyname">Goutami Padmanabhan & Balaji Gurumoorthy</span></span> <span><a href="#top" class="uparrow"><i class="fas fa-arrow-circle-up fa-lg"></i></a></span>
		</div>
	</footer>
</body>
</html>
