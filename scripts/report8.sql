/**
 * List of all pages in the 'File:' namespace on enwp.  Cached list -> no clobbering the server.
 * Author: Fastily
 */
SELECT pg.page_title 
FROM page pg
WHERE pg.page_namespace=6 AND pg.page_is_redirect=0;