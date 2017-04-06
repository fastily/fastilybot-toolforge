/**
 * Finds the top 200 largest files flagged for transfer to Commons
 * Author: Fastily
 */
SELECT pg.page_title, i.img_size
FROM templatelinks tl
INNER JOIN page pg
ON tl.tl_from=pg.page_id
INNER JOIN image i
ON i.img_name=pg.page_title
WHERE tl.tl_title='Copy_to_Wikimedia_Commons' AND tl.tl_namespace=10 AND pg.page_namespace=6
ORDER BY i.img_size DESC
LIMIT 200;