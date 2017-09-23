/**
 * Lists all files in 'Category:Self-published work' on enwp.  Cached list -> no clobbering the server. 
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
WHERE cl.cl_to='Self-published_work'
AND pg.page_namespace=6;