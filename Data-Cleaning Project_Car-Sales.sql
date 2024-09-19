-- CLEANING DATA IN SQL QUERIES

SELECT *
FROM cars.car_info

-- MENGECEK NILAI UNIK
SELECT 
	DISTINCT fuel_type
FROM
	cars.car_info
LIMIT 1000

-- MENGECEK KOLOM PANJANG
SELECT 
	MIN(length) AS min_length,
	MAX(length) AS max_length
FROM cars.car_info

-- MENGECEK KOLOM KOSONG / NULL
SELECT *
FROM cars.car_info
WHERE num_of_doors = ""

-- UPDATE KOLOM KOSONG UNTUK SEDAN BENSIN GAS
UPDATE cars.car_info
SET num_of_doors = "four"
WHERE make = "dodge"
AND fuel_type = "gas"
AND body_style = "sedan"

-- UPDATE KOLOM KOSONG UNTUK SEDAN BENSIN DIESEL
UPDATE cars.car_info
SET num_of_doors = "four"
WHERE make = "mazda"
AND fuel_type = "diesel"
AND body_style = "sedan"

-- UPDATE TYPO KOLOM 
SELECT DISTINCT num_of_cylinders
FROM cars.car_info
UPDATE cars.car_info
SET num_of_cylinders = "two"
WHERE num_of_cylinders = "tow"

-- MENGECEK KOLOM COMPRESSION_RATIO
SELECT
MIN(compression_ratio) AS min_compression_ratio,
MAX(compression_ratio) AS max_compression_ratio
FROM cars.car_info
WHERE compression_ratio <> 70

-- MENGECEK KOLOM YANG AKAN DIHAPUS
SELECT COUNT(*) AS num_of_rows_to_delete
FROM cars.car_info
WHERE compression_ratio = 70

-- HAPUS BARIS YANG INVALID
DELETE FROM cars.car_info
WHERE compression_ratio = 70

-- MENGECEK PANJANG KOLOM drive_wheels
SELECT DISTINCT drive_wheels,
LENGTH(drive_wheels) AS string_length
FROM cars.car_info

-- MENGHAPUS SPACING KALIMAT
UPDATE cars.car_info
SET drive_wheels = TRIM(drive_wheels)
WHERE TRUE

-- FREKUENSI MOBIL POPULER
SELECT make, COUNT(*) AS num_cars
FROM cars.car_info
GROUP BY make
ORDER BY num_cars DESC

-- KARAKTERISTIK MOBIL POPULER DARI BAHAN BAKAR
SELECT fuel_type, COUNT(*) AS num_cars
FROM cars.car_info
GROUP BY fuel_type
ORDER BY num_cars DESC

-- HARGA RATA-RATA MOBIL BERDASARKAN JUMLAH YANG TERSEDIA
SELECT price, COUNT(*) AS num_cars
FROM cars.car_info
GROUP BY price
ORDER BY num_cars DESC

-- TOTAL HARGA PER MEREK
SELECT make, SUM(price) AS total_price
FROM cars.car_info
GROUP BY make
ORDER BY total_price DESC

-- RATA-RATA HARGA PER MEREK
SELECT make, AVG(price) AS avg_price
FROM cars.car_info
GROUP BY make
ORDER BY avg_price DESC

-- DISTRIBUSI HARGA
SELECT
	MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price,
    COUNT(*) AS total_cars
FROM cars.car_info

-- DISTRIBUSI HARGA BERDASARKAN MEREK DAN TIPE MOBIL
SELECT
	make,
    AVG(price) AS avg_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM cars.car_info
GROUP BY make
ORDER BY avg_price DESC