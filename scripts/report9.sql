/**
 * List of all orphaned files on enwp.  Cached list -> no clobbering the server.
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
WHERE cl.cl_to='Wikipedia_orphaned_files'
AND pg.page_namespace=6;