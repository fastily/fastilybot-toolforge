/**
 * Crudely finds unfiled enwp RfAs.
 * Author: Fastily
 */
SELECT page_title FROM page p
LEFT JOIN categorylinks cnot
ON cnot.cl_from=p.page_id AND cnot.cl_to  IN ('Successful_requests_for_adminship', 'Unsuccessful_requests_for_adminship', 'Requests_for_adminship_reform', 'Matters_related_to_requests_for_adminship', 'Wikipedia_failed_proposals', 'Wikipedia_proposals', 'Wikipedia_RfA_debriefings')
WHERE cnot.cl_from IS NULL
AND p.page_namespace = 4
AND p.page_title LIKE "Requests_for_adminship/%"
AND p.page_title NOT LIKE "%/%/%"
AND p.page_is_redirect = 0;