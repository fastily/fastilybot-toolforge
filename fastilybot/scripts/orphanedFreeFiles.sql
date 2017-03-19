/**
 * Find freely licensed files on enwp with no fileusage
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
LEFT JOIN imagelinks il
ON il.il_to=pg.page_title
WHERE cl.cl_to='All_free_media'
AND pg.page_namespace=6
AND il.il_from IS NULL;