/**
 * Find freely licensed files with links to the mainspace
 * Author: Fastily
 */
SELECT DISTINCT pl.pl_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
INNER JOIN pagelinks pl
ON pl.pl_title=pg.page_title
WHERE cl.cl_to='All_free_media'
AND pl_from_namespace=0
AND pl_namespace=6;