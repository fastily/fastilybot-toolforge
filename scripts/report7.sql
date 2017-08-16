/**
 * Lists all bitmap images in 'Category:All non-free media' on enwp exceeding 540x540.
 * Author: Fastily
 */
SELECT pg.page_title 
FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
INNER JOIN image img
ON img.img_name=pg.page_title
WHERE cl.cl_to='All_non-free_media'
AND pg.page_namespace=6
AND img.img_media_type='BITMAP'
AND img.img_width>540
AND img.img_height>540;