/**
 * Lists fully protected user talk pages
 * Author: Fastily
 */
SELECT page_title FROM page p
INNER JOIN page_restrictions pr
ON pr.pr_page = p.page_id
WHERE pr.pr_level = "sysop" AND pr.pr_type = "edit" AND p.page_namespace = 3 AND p.page_is_redirect = 0 AND p.page_title NOT LIKE "%/%";