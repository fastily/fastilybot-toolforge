/**
 * Find files with more than one extension in their filenames
 * Author: Fastily
 */
SELECT ii.img_name
FROM image ii
WHERE ii.img_name REGEXP "(?i).*?(\\.(djvu|flac|gif|jpeg|jpg|mid|midi|mp3|mpeg|mpg|oga|ogg|ogv|opus|pdf|png|svg|tif|tiff|wav|webm|webp|xcf|bmp)){2,}";