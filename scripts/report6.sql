/**
 * Lists all free media on enwp.  Cached list -> no clobbering the server. 
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
WHERE cl.cl_to='All_free_media' OR cl.cl_to='Self-published_work' OR cl.cl_to='User-created_public_domain_files'
AND pg.page_namespace=6;