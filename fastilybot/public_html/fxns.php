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