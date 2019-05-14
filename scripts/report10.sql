/**
 * Lists low-res, orphaned free images on enwp.
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
INNER JOIN image img
ON img.img_name=pg.page_title
WHERE cl.cl_to='Wikipedia_orphaned_files'
AND img.img_media_type='BITMAP'
AND img.img_width<250
AND img.img_height<250
LIMIT 1250;