/**
 * Smallest orphaned files on enwp by bytes
 * Author: Fastily
 */
SELECT ii.img_name
FROM image ii
INNER JOIN page p
ON p.page_title = ii.img_name
INNER JOIN categorylinks cl
ON cl.cl_from=p.page_id
WHERE cl.cl_to='Wikipedia_orphaned_files'
ORDER BY ii.img_size DESC
LIMIT 200;