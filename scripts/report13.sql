/**
 * List files on Wikipedia and Commons that are not the same file.
 * Author: Fastily
 */
SELECT wpimg.img_name
FROM enwiki_p.image wpimg
INNER JOIN commonswiki_p.image cimg
ON wpimg.img_name = cimg.img_name
WHERE cimg.img_sha1 <> wpimg.img_sha1;