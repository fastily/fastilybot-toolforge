/**
 * List of all pages in the 'File:' namespace on Commons.  Cached list -> no clobbering the server.
 * Author: Fastily
 */
SELECT page.page_title
FROM page
WHERE page.page_namespace=6;