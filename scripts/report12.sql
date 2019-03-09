/**
 * List of enwp files lacking Information/FUR templates
 * Author: Fastily
 */
SELECT pg.page_title FROM categorylinks cl
INNER JOIN page pg
ON cl.cl_from=pg.page_id
LEFT JOIN templatelinks tl
ON tl.tl_from=pg.page_id AND tl.tl_title IN ('Information', 'Non-free_use_rationale_2', 'Non-free_use_rationale')
WHERE cl.cl_to='Files_with_no_machine-readable_source' AND pg.page_namespace=6 AND tl.tl_title IS NULL;