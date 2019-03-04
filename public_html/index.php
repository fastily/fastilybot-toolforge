<?php

	date_default_timezone_set("UTC");
	
    /**
     * Generates a table row for each database report
     */
    function generateRow($id, $name, $updateFreq)
    {
        echo "<tr>";

        $f = "r/report" . $id . ".txt";

        echo tdWrap($id);
        echo tdWrap(sprintf("<a href=\"%s\">%s</a>", $f, $name));
        echo tdWrap($updateFreq);

        if (file_exists($f)) 
            echo tdWrap(date("H:i, d F Y (T)", filectime($f)));
        else 
            echo tdWrap("n/a");

        echo "</tr>";
    }

    /**
     * Wraps a string in td tags.
     */
    function tdWrap($s)
    {
        return sprintf("<td>%s</td>", $s);
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<link rel="stylesheet" href="https://tools-static.wmflabs.org/cdnjs/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<title>fastilybot @ toollabs</title>
</head>
<body>
	<div class="main-wrapper">
		<nav class="navbar navbar-expand-md navbar-light bg-light">
			<div class="container">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" href="https://meta.wikimedia.org/wiki/User:Fastily">Author</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="https://github.com/fastily/fastilybot-toollabs">Source</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="https://tools.wmflabs.org">Toolforge</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">fastilybot @ toollabs</h1>
			<p class="lead">(Raw DB Reports)</p>
		</div>

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
				generateRow(5, "all non-free files on enwp", "Daily");
				generateRow(6, "all free files on enwp", "Daily");
				generateRow(7, "oversized non-free images on enwp", "Weekly");
				generateRow(8, "all files on enwp", "Daily");
				generateRow(9, "orphaned free files on enwp", "Weekly");
				generateRow(10, "orphaned, low-res free files on enwp", "Weekly");
				generateRow(11, "enwp file pages shadowing commons files", "Weekly");
				?>
			</tbody>
		</table>
	</div>
</div>

<script src="https://tools-static.wmflabs.org/cdnjs/ajax/libs/jquery/3.3.1/jquery.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
crossorigin="anonymous"></script>
<script src="https://tools-static.wmflabs.org/cdnjs/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://tools-static.wmflabs.org/cdnjs/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>