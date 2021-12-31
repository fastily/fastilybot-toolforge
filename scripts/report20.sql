/**
 * Find unusually large IP talk pages (in excess of 256kb)
 * Author: Fastily
 */
SELECT p.page_title
FROM page p
WHERE p.page_namespace = 3 and p.page_len > 262144 and (p.page_title REGEXP '^[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}$' OR p.page_title REGEXP '(^([0-9]{1,3}[.]){3}[0-9]{1,3}$|^([[:alnum:]]{1,4}[:]){7})')