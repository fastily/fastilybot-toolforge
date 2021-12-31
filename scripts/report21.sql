/**
 * Find unusually large user talk pages (in excess of 1mb)
 * Author: Fastily
 */
SELECT p.page_title
FROM page p
WHERE p.page_namespace = 3 and p.page_len > 1048576 and p.page_title NOT LIKE "%/%"