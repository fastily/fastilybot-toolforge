/**
 * List of free files on enwp without an obvious source
 * Author: Fastily
 */
SELECT pg.page_title
FROM page pg
INNER JOIN image i
ON i.img_name=pg.page_title

INNER JOIN categorylinks cl
ON cl.cl_from=pg.page_id AND cl.cl_to='Files_with_no_machine-readable_source'

LEFT JOIN categorylinks cnot
ON cnot.cl_from=pg.page_id AND cnot.cl_to IN ('All_non-free_media', 'Wikipedia_files_tagged_as_own_work', 'Self-published_work', 'User-created_public_domain_files')

LEFT JOIN (
    SELECT t.tl_from, l.lt_title
    FROM templatelinks t
    INNER JOIN linktarget l
    ON t.tl_target_id = l.lt_id
) tnot
ON tnot.tl_from=pg.page_id AND tnot.lt_title IN ('Information', 'Keep_local')

WHERE cnot.cl_from IS NULL AND tnot.tl_from IS NULL
LIMIT 1000;