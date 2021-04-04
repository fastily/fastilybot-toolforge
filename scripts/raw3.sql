/**
 * English Wikipedia files description pages without an associated file
 * Author: Fastily
 */
SELECT wpg.page_title
FROM enwiki_p.page wpg
LEFT JOIN enwiki_p.image wpimg
ON wpimg.img_name = wpg.page_title
WHERE wpg.page_namespace=6 AND wpimg.img_name IS null;