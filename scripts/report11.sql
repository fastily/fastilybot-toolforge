/**
 * Lists file description pages on enwp without an associated file, shadowing a Commons file.
 * Author: Fastily
 */
SELECT wpg.page_title, wpimg.img_name
FROM enwiki_p.page wpg
INNER JOIN commonswiki_p.page cpg
ON wpg.page_title = cpg.page_title
LEFT JOIN enwiki_p.image wpimg
ON wpimg.img_name = wpg.page_title
WHERE wpg.page_namespace=6 AND cpg.page_namespace=6 AND wpimg.img_name IS null;