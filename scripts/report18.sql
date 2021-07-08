/**
 * List free files on enwp which link to flickr
 * Author: Fastily
 */
SELECT p.page_title
FROM page p
INNER JOIN externallinks el
ON el_from = p.page_id
INNER JOIN categorylinks cl
ON p.page_id = cl.cl_from
WHERE p.page_namespace = 6 AND cl.cl_to = 'All_free_media' AND el.el_to LIKE '%flickr%';