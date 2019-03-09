/**
 * List all self-published files on enwp.  Cached list -> no clobbering the server. 
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
WHERE cl.cl_to IN ('Wikipedia_files_tagged_as_own_work', 'Self-published_work', 'User-created_public_domain_files')
AND pg.page_namespace=6;