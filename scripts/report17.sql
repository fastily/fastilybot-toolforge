/**
 * Lists all SPI pages which are not archives, redirects, or administration pages.
 * Author: Fastily
 */
SELECT page_title FROM page p
WHERE p.page_namespace = 4
AND p.page_title LIKE "Sockpuppet_investigations/%"
AND p.page_title NOT LIKE "%/Archive"
AND p.page_title NOT LIKE "%/SPI/%"
AND p.page_is_redirect = 0;