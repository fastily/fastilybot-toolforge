/**
 * Find files on the English Wikipedia which are tagged as both free and non-free.
 * Author: Fastily
 */
SELECT pg.page_title
FROM categorylinks cl1
INNER JOIN page pg
ON cl1.cl_from=pg.page_id
INNER JOIN categorylinks cl2
ON cl2.cl_from=pg.page_id
WHERE cl1.cl_to='All_non-free_media' AND cl2.cl_to='All_free_media' AND cl1.cl_type='file'