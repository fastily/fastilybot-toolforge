/**
 * Find Timed Text pages with no associated File.
 * Author: Fastily
 */
SELECT p.page_title
FROM page p
LEFT JOIN image ii
ON ii.img_name = REGEXP_SUBSTR(p.page_title, "(?i).+?\\.(flac|ogg|oga|ogv|ogx|ogm|spx|opus|webm|midi|mid|kar|mp3|mpga|mpa|mp2|wav)")
WHERE ii.img_name IS NULL and p.page_namespace = 710;