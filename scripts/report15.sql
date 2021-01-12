/**
 * Lists non-free pdf files on enwp
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
WHERE cl.cl_to='All_non-free_media'
AND pg.page_namespace=6
AND pg.page_title like "%.pdf";