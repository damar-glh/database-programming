-- 1. Perbaiki SQL statement pembuatan function berikut sampai berhasil dieksekusi. Baca dengan seksama error message-nya, lalu perbaiki.(10)
DELIMITER $$;
DROP FUNCTION IF EXISTS f_LuasBelahKetupat;
CREATE FUNCTION f_LuasBelahKetupat(IN diagonal1 INT,IN diagonal2 INT) 
RETURNS INT
BEGIN
    RETURN (0.5 * diagonal1 * diagonal2);
END $$;
DELIMITER ;

SELECT f_LuasBelahKetupat(10, 20) as LuasBelahKetupat;

-- 2. Eksekusi function nomor 1 dengan nilai diagonal1 10, dan diagonal2 7. (10)
SELECT f_LuasBelahKetupat(10, 7) as LuasBelahKetupat;

-- 3. Trigger berikut ini akan dieksekusi setelah penghapusan baris terjadi ke tabel reviews. Setelah baris berhasil dihapus, ada aktivitas pemasukan baris baru ke tabel review log. Tabel review log memiliki kolom: review id, customer id, content, dan date deleted. Nilai yang dimasukkan ke dalam kolom review id, customer id, dan content adalah nilai lama sebelum baris dihapus.
-- Tugas anda adalah melengkapi perintah CREATE TRIGGER berikut sehingga memenuhi deskripsi trigger yang dipaparkan di atas. Trigger harus dapat dieksekusi sehingga anda harus memastikan semua langkah sudah terakomodasi. (30)
DELETE IF EXISTS TRIGGER after_delete_review;
CREATE TRIGGER after_delete_review
AFTER DELETE ON reviews 
FOR EACH ROW
BEGIN
    INSERT INTO review_log (review_id, customer_id, content, date_deleted)
    VALUES (OLD.review_id, OLD.customer_id, OLD.content, NOW());
END;

-- 4.Tuliskan perintah yang memicu trigger nomor 3 bekerja sebanyak 3 kali. Perlihatkan hasil penghapusan baris di tabel reviews dan penambahan baris di tabel review log. (20)
DELETE FROM reviews WHERE review_id = 1;
DELETE FROM reviews WHERE review_id = 2;
DELETE FROM reviews WHERE review_id = 3;

-- 5. Buktikan dengan menambahkan perintah EXPLAIN di depan SELECT statement yang anda tuliskan.(30)
-- a. Buatlah sebuah query untuk menampilkan list product dengan perintah WHERE name. Amati dengan perintah EXPLAIN. Kemudian screen shot hasilnya.
EXPLAIN SELECT * FROM products WHERE name = 'product 1';

-- b. Buat sebuah index dengan nama: name product untuk tabel products, dengan index key dari kolom name. jalankan perintah untuk menampilkan index yang sudah di buat. Kemudian screen shot hasilnya. 
CREATE index name_product ON products(name);

-- c. Buatlah query yang sama dengan point (a), amati juga dengan perintah EXPLAIN. Kemudian screen shot hasilnya.
EXPLAIN SELECT * FROM products WHERE name = 'product 1';