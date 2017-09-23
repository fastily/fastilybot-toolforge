<!DOCTYPE html>
<?php require_once "fxns.php" ?>
<html>
<head>
	<title>fastilybot @ toollabs</title>

	<link rel="stylesheet" href="https://tools-static.wmflabs.org/cdnjs/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://tools-static.wmflabs.org/cdnjs/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<link href="https://tools-static.wmflabs.org/fontcdn/css?family=Open+Sans|Roboto" rel="stylesheet">

	<link rel="stylesheet" href="index.css" >	
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <ul class="nav navbar-nav navbar-right">
			<li><a href="https://en.wikipedia.org/wiki/User:FastilyBot">BOT</a></li>
			<li><a href="https://en.wikipedia.org/wiki/User:Fastily">AUTHOR</a></li>
			<li><a href="https://github.com/fastily/wmf-toollabs">SOURCE</a></li>
	    </ul>
	  </div>
	</nav>

	<div class="jumbotron text-center">
		<h1>fastilybot @ toollabs</h1>
	</div>

	<div class="container">
		<h2>Database Reports</h2>        
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Report</th>
					<th>Name</th>
					<th>Frequency</th>
					<th>Last Updated</th>
				</tr>
			</thead>
			<tbody>
				<?php
					generateRow(1, "enwp files with a duplicate on Commons", "Bi-Weekly"); 
					generateRow(2, "enwp files tagged as free and non-free", "Bi-Weekly"); 
					generateRow(3, "free files on enwp with no fileusage", "Weekly");
					generateRow(4, "free files on enwp with links to the mainspace", "Weekly");
					generateRow(5, "all non-free files on enwp", "Weekly");
					generateRow(6, "all free files on enwp", "Weekly");
					generateRow(7, "oversized non-free images on enwp", "Weekly");
					generateRow(8, "all files on enwp", "Weekly");
					generateRow(9, "all self-published files on enwp", "Weekly");
				?>
			</tbody>
		</table>
	</div>

	<footer class="container-fluid text-center footer">
		<p>
			Powered by <a href="https://tools.wmflabs.org">WMF toolforge</a> &mdash; &copy; 2017, Fastily, <a href="https://www.gnu.org/licenses/gpl-3.0.en.html">GPLv3</a>
		</p>
	</footer>

	<script src="https://tools-static.wmflabs.org/cdnjs/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://tools-static.wmflabs.org/cdnjs/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</body>
</html>