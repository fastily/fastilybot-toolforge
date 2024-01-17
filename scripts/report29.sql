/**
 * Small orphaned bitmap files by resolution
 * Author: Fastily
 */
SELECT ii.img_name
FROM image ii
INNER JOIN page p
ON p.page_title = ii.img_name 
INNER JOIN categorylinks cl
ON cl.cl_from=p.page_id
WHERE cl.cl_to='Wikipedia_orphaned_files' AND ii.img_media_type = "BITMAP" AND img_width < 550 AND img_height < 550
LIMIT 500;