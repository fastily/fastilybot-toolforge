/**
 * Find Timed Text pages with no associated File.
 * Author: Fastily
 */
SELECT p2.tt
FROM (
	SELECT REGEXP_REPLACE(p.page_title, "\\..{2}\\.srt", "") as tt
	FROM page p
	WHERE p.page_namespace = 710
) p2
LEFT JOIN image ii
ON p2.tt = ii.img_name 
WHERE ii.img_name IS NULL;