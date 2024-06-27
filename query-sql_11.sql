-- Praktikum 1 | Membuat, Menampilkan, Mengubah dan Menghapus View
-- 1. Buatlah perintah untuk membuat view dengan nama v_invoice untuk menampilkan id transaksi, nama menu, harga menu, jumlah yang dibeli, total harga dan tanggal transaksi.Tampilkan view dengan urutan tanggal secara ascending.
DROP VIEW IF EXISTS v_invoice;
CREATE VIEW v_invoice AS
SELECT t.id_transaksi, m.nama_menu, m.harga_menu, t.jumlah, t.total_harga, t.tanggal
FROM transaksi t
JOIN detail_transaksi dt USING(id_transaksi)
JOIN menu m USING(id_menu)
ORDER BY t.tanggal ASC;

-- 2. Buatlah perintah untuk merubah view v_invoice dengan menambahkan informasi kasir dan ubalah view tersebut menjadi v_invoices. Tampilkan dengan urutan tanggal secara ascending.
RENAME TABLE v_invoice TO v_invoices;
ALTER VIEW v_invoices AS
SELECT t.id_transaksi, m.nama_menu, m.harga_menu, t.jumlah, t.total_harga, t.tanggal, k.nama as nama_kasir, k.alamat as alamat_kasir
FROM transaksi t
JOIN detail_transaksi dt USING(id_transaksi)
JOIN menu m USING(id_menu)
JOIN karyawan k USING(id_karyawan)
ORDER BY t.tanggal ASC;

-- 3. Buatlah sebuah horizontal view dari basisdata yang anda gunakan.  
CREATE VIEW v_horizontal AS 
SELECT * FROM transaksi
WHERE id_transaksi = 'TR01';

-- 4. Buatlah sebuah vertical view dari basisdata yang anda gunakan.
CREATE VIEW v_vertical AS
SELECT id_gerai, id_kategori, nama, harga FROM menu
WHERE id_kategori = 'KT02';

-- 5. Buatlah sebuah view on view dari basisdata yang anda gunakan.
CREATE VIEW v_on_view AS
SELECT * FROM v_invoices
WHERE id_transaksi = 'TR01';

-- 6. Hapus salah satu view
DROP VIEW v_on_view;

