/**
 * List of all pages in the 'Draft:' namespace on enwp.  Cached list -> no clobbering the server.
 * Author: Fastily
 */
SELECT pg.page_title 
FROM page pg
WHERE pg.page_namespace=118 AND pg.page_is_redirect=0;