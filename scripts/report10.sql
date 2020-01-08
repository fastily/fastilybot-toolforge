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
AND img.img_width<330
AND img.img_height<330
AND pg.page_title NOT IN (
	SELECT p.page_title FROM categorylinks c
	INNER JOIN page p
	ON c.cl_from=p.page_id
	WHERE c.cl_to='All_files_proposed_for_deletion'
	AND p.page_namespace=6
)
LIMIT 1500