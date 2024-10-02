SELECT *
FROM titles
LIMIT 100

SELECT *
FROM credits
LIMIT 100

-- Hapus Kolom yang tidak diperlukan

ALTER TABLE titles DROP COLUMN imdb_id
ALTER TABLE titles DROP COLUMN imdb_score
ALTER TABLE titles DROP COLUMN imdb_votes
ALTER TABLE titles DROP COLUMN tmdb_popularity
ALTER TABLE titles DROP COLUMN tmdb_score

-- Menangani Missing Values
SELECT "role" 
FROM credits 
WHERE "role" IS NULL

SELECT title
FROM titles t 
WHERE title IS NULL

-- Cek inkonsisten Data

 SELECT DISTINCT "type" 
 FROM titles
 
 SELECT DISTINCT "role" 
 FROM credits c 
 
 -- Menghitung jumlah TV Show dan Movie
 SELECT "type", COUNT(*) AS count
 FROM titles t 
 GROUP BY "type" 
 
 -- Aktor & Sutradara yang paling sering muncul dan genre terlibat
 
 -- Menghitung jumlah keterlibatan aktor & sutradara
SELECT name, "role", COUNT(*) AS appearances 
FROM credits c
GROUP BY name, "role" 
ORDER BY appearances DESC
LIMIT 50

-- Mengkoneksikan actor/sutradara dengan genre
SELECT c.name, c."role", t.genres, COUNT(*) AS appearances 
FROM credits c 
JOIN titles t on c.id = t.id 
GROUP BY c.name, c."role", t.genres 
ORDER BY appearances DESC 
LIMIT 50

-- Tren rilis konten di Netflix per tahun
SELECT release_year, "type", COUNT(*) AS count 
FROM titles t
WHERE release_year >= 2010
GROUP BY release_year, "type" 
ORDER BY release_year ASC
