/**
 * Find files on the English Wikipedia which are tagged as both free and non-free.
 * Author: Fastily
 */
SELECT pg.page_title
FROM categorylinks fc
INNER JOIN (
  SELECT cl.cl_from
  FROM categorylinks cl
  WHERE cl.cl_to='All_non-free_media' AND cl.cl_type='file'
) nfc
ON fc.cl_from=nfc.cl_from
INNER JOIN page pg
ON fc.cl_from=pg.page_id
WHERE fc.cl_to='All_free_media' AND fc.cl_type='file';
