/**
 * Find images which credit The Associated Press in their metadata
 * Author: Fastily
 */
SELECT ii.img_name
FROM image ii
WHERE img_media_type = "BITMAP" and ii.img_metadata REGEXP "(?i).*?(AP Photo).*?";