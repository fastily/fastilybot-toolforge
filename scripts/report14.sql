/**
 * Lists non-existent templates that are transcluded in places besides user scripts.
 * Author: Fastily
 */
SELECT t.tl_title FROM templatelinks t 
LEFT JOIN page p 
ON p.page_namespace = t.tl_namespace AND p.page_title = t.tl_title 
INNER JOIN page p2
ON t.tl_from  = p2.page_id
WHERE p.page_title IS NULL AND t.tl_namespace = 10 AND p2.page_title NOT LIKE "%.js"
GROUP BY t.tl_title 
LIMIT 250;