/**
 * Finds orphaned file talk pages on enwp
 * Author: Fastily
 */
SELECT talkpage.page_title
FROM page talkpage
WHERE talkpage.page_title NOT LIKE '%/%'
AND talkpage.page_namespace = 7
AND NOT EXISTS (SELECT 1 FROM page mainpage WHERE mainpage.page_namespace=6 AND mainpage.page_title=talkpage.page_title)
AND NOT EXISTS (SELECT 1 FROM commonswiki_p.page com WHERE com.page_namespace=6 AND com.page_title=talkpage.page_title);