-- 1. Buat sebuah tabel dengan nama t1,
-- ● T_id INT PRIMARY KEY
-- ● C1 varchar(20)
-- ● C2 INT
-- ● C3 INT
CREATE TABLE t1 (
    T_id INT PRIMARY KEY,
    C1 varchar(20),
    C2 INT,
    C3 INT
);

-- 2. Tampilkan daftar index di tabel t1
SHOW INDEX FROM t1;

-- 3. Menggunakan ALTER TABLE statement, buat sebuah composit index di tabel t1 dengan index key dari kolom C1 dan C2
ALTER TABLE t1 ADD INDEX idx_composit (C1, C2);

-- 4.Tampilkan daftar index di tabel t1, seharusnya ada penambahan satu buah index di tabel t1 sehingga total index adalah 3 buah.
SHOW INDEX FROM t1;

-- 5. Menggunakan CREATE INDEX statement, buat sebuah index di tabel t1 dengan index key C3, dan key name idx_c3
CREATE INDEX idx_c3 ON t1 (C3);

-- 6. Tampilkan daftar index di tabel t1, seharusnya ada penambahan satu buah index di tabel t1 sehingga total index adalah 4 buah
SHOW INDEX FROM t1;

-- 7.Hapus index dengan nama idx_c3
DROP INDEX idx_c3 ON t1;

-- 8.Tampilkan kembali daftar index untuk membuktikan index idx_c3 benar terhapus
SHOW INDEX FROM t1;

-- 1.	Eksekusi perintah berikut:
SELECT*FROM customers WHERE join_date >= ‘2022-07-04’;

-- Perhatikan query execution time yang dibutuhkan untuk mengeksekusi perintah diatas.
-- Kemudian, eksekusi perintah berikut ini:
EXPLAIN SELECT*FROM customers WHERE join_date = ‘2022-07-04’;
-- Perhatikan angka di kolom rows. Angka tersebut menunjukkan jumlah baris yang di scan selama pencarian

-- 2.	Buat sebuah index untuk tabel customers dengan nama idx_cust_join_date, index key dari kolom join_date
CREATE INDEX idx_cust_join_date ON customers (join_date);