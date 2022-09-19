/**
 * Lists non-existent templates that are transcluded in places besides user scripts.
 * Author: Fastily
 */
SELECT lt.lt_title FROM templatelinks t
INNER JOIN linktarget lt
ON lt.lt_id = t.tl_target_id
LEFT JOIN page p
ON p.page_namespace = lt.lt_namespace AND p.page_title = lt.lt_title
INNER JOIN page p2
ON t.tl_from  = p2.page_id
WHERE p.page_title IS NULL AND lt.lt_namespace = 10 AND p2.page_content_model="wikitext"
GROUP BY 1
LIMIT 300;