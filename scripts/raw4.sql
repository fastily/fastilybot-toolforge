/**
 * Finds orphaned file talk pages on enwp
 * Author: Fastily
 */
SELECT talkpage.page_title
FROM page talkpage
WHERE talkpage.page_title NOT LIKE '%/%'
AND talkpage.page_namespace = 7
AND NOT EXISTS (SELECT 1 FROM page mainpage WHERE mainpage.page_namespace=6 AND mainpage.page_title=talkpage.page_title);