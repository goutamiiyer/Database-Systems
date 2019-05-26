<?php
 
	session_start();
	$_SESSION['message'] = "";
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "worldcup";
	$conn = new mysqli($servername, $username, $password, $dbname) or die("unable to connect");

	$countryName = $cardColor = "";
	$countryNameErr = $cardColorErr = "";
	if ($_SERVER["REQUEST_METHOD"] == "POST") 
	{
		if(empty($_POST["countryName"]))
		{
			$countryNameErr = "Country Name is required";
		}
		else
		{
			$countryName = test_input($_POST["countryName"]);			
		}
		if(empty($_POST["cardColor"]))
		{
			$cardColor = "";
			$cardColorErr = "Country Name is required";
		}
		else
		{
			$cardColor = test_input($_POST["cardColor"]);			
		}
		if(isset($_POST["formSubmit"])) 
		{
			if($countryName !== "" && $cardColor == "")
			{
				$sql = "select s.GameID,p.PName, p.PNo
				from player p, starting_lineups s 
				where p.TeamID=s.TeamID and p.PNo=s.PNo and p.Team='$countryName' order by s.GameID,p.PNo";

				echo $conn->error;

				// $res = $conn->query($sql);
				// echo $res;

				if($res = mysqli_query($conn, $sql))
				{
					if (mysqli_num_rows($res) > 0) 
					{
						echo "Country Name: ". $countryName; 
				        echo "<table>"; 
				        echo "<tr>"; 
				        echo "<th>Game ID</th>"; 
				        echo "<th>Player Name</th>"; 
				        echo "<th>Player Number</th>"; 
				        echo "</tr>"; 
				        while ($row = mysqli_fetch_array($res)) 
				        { 
				            echo "<tr>"; 
				            echo "<td>".$row['GameID']."</td>"; 
				            echo "<td>".$row['PName']."</td>"; 
				            echo "<td>".$row['PNo']."</td>"; 
				            echo "</tr>"; 
				        } 
				        echo "</table>"; 
				        mysqli_free_result($res); 
				    } 
				    else 
				    { 
				        echo "We are sorry for the inconvenience. There is no data for the country ". $countryName ." in our database"; 
				    } 
				}
				else
				{
					$_SESSION["message"] = "Could not be retrieved";
					echo "Error: " . $sql . "<br>" . $conn->error;
				}
			}

			/*Second Query*/
			if($cardColor)
			{

				$sql2 = "select g.GameID,c.TeamID,p.Team, p.PName , p.PNo ,c.Color,c.TIME 
				from player p, cards c, game g 
				where c.GameID=g.GameID and p.TeamID=c.TeamID and p.PNo=c.PNo and 
				p.Team='$countryName' and c.Color='$cardColor' 
				order by g.GameID,p.Team,p.PNo,p.PName";

				echo $conn->error;

				if($res2 = mysqli_query($conn, $sql2))
				{
					if (mysqli_num_rows($res2) > 0) 
					{ 
				        echo "<table>"; 
				        echo "<tr>"; 
				        echo "<th>Game ID</th>"; 
				        echo "<th>Team ID</th>"; 
				        echo "<th>Team</th>"; 
				        echo "<th>Player Name</th>"; 
				        echo "<th>Player Number</th>"; 
				        echo "<th>Card Color</th>"; 
				        echo "<th>Card Time</th>"; 
				        echo "</tr>"; 
				        while ($row2 = mysqli_fetch_array($res2)) 
				        { 
				            echo "<tr>"; 
				            echo "<td>".$row2['GameID']."</td>"; 
				            echo "<td>".$row2['TeamID']."</td>"; 
				            echo "<td>".$row2['Team']."</td>"; 
				            echo "<td>".$row2['PName']."</td>"; 
				            echo "<td>".$row2['PNo']."</td>"; 
				            echo "<td>".$row2['Color']."</td>"; 
				            echo "<td>".$row2['TIME']."</td>"; 
				            echo "</tr>"; 
				        } 
				        echo "</table>"; 
				        mysqli_free_result($res2); 
				    } 
				    else 
				    { 
				        echo "There is no data for the country " .$countryName. " and the card color ".$cardColor . " in our database"; 
				    } 
				}
				else
				{
					$_SESSION["message"] = "Could not be retrieved";
					echo "Error: " . $sql2 . "<br>" . $conn->error;
				}

				$conn->close();
			}
		}
		else
		{
			echo "Empty form cannot be submitted";
		}
	}
	function test_input($data) 
	{
	  $data = trim($data);
	  $data = stripslashes($data);
	  $data = htmlspecialchars($data);
	  return $data;
	}
?>