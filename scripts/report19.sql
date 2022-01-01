/**
 * Find Timed Text pages with no associated File.
 * Author: Fastily
 */
SELECT tt.page_title
FROM page tt
LEFT JOIN page f
ON f.page_title = REGEXP_SUBSTR(tt.page_title, "(?i).+\\.(mid|ogg|ogv|oga|flac|opus|wav|webm|mp3|midi|mpg|mpeg)") AND f.page_namespace = 6
WHERE f.page_title IS NULL AND tt.page_namespace = 710;