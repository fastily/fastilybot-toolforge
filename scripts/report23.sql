/**
 * Find images which credit Getty Images in their metadata
 * Author: Fastily
 */
SELECT ii.img_name
FROM image ii
WHERE img_media_type = "BITMAP" and ii.img_metadata REGEXP "(?i).*?(getty).*?";