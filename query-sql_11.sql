-- Praktikum 1 | Membuat, Menampilkan, Mengubah dan Menghapus View
-- 1. Buatlah perintah untuk membuat view dengan nama v_invoice untuk menampilkan id transaksi, nama menu, harga menu, jumlah yang dibeli, total harga dan tanggal transaksi.Tampilkan view dengan urutan tanggal secara ascending.
DROP VIEW IF EXISTS v_invoice;
CREATE VIEW v_invoice AS
SELECT t.id_transaksi, m.nama, m.harga, dt.qty, (dt.harga*dt.qty) AS total_harga, t.tanggal
FROM transaksi t
JOIN detail_transaksi dt USING(id_transaksi)
JOIN menu m USING(id_menu)
ORDER BY t.tanggal ASC;

SELECT * FROM v_invoice;

-- 2. Buatlah perintah untuk merubah view v_invoice dengan menambahkan informasi kasir dan ubalah view tersebut menjadi v_invoices. Tampilkan dengan urutan tanggal secara ascending.
RENAME TABLE v_invoice TO v_invoices;
ALTER VIEW v_invoices AS
SELECT t.id_transaksi, m.nama, m.harga, dt.qty, (dt.harga*dt.qty) AS total_harga, t.tanggal, k.nama as nama_kasir, k.alamat as alamat_kasir
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

-- Praktikum 2 | Membuat, Menampilkan
-- Diketahui ada 2 tabel yang berelasi yaitu data mahasiswa dan transaksi peminjaman.
-- Untuk tabel mahasiswa terdiri dari tiga atribut yaitu NIM, Nama dan alamat. Tabel transaksi
-- peminjaman terdiri dari tiga atribut kode_transaksi, NIM dan nama_buku.
-- Membuat tabel mahasiswa
CREATE DATABASE IF NOT EXISTS meet13_5209;
CREATE TABLE mahasiswa (
    nim INT PRIMARY KEY,
    nama VARCHAR(50),
    alamat VARCHAR(50)
);

-- Memasukkan data ke tabel mahasiswa
INSERT INTO mahasiswa (nim, nama, alamat) VALUES 
(21400200, 'Faqih', 'Bandung'),
(21400202, 'Anto', 'Semarang'),
(21400203, 'Dani', 'Padang'),
(21400206, 'Senta', 'Semarang');

-- Membuat tabel transaksi_peminjaman
CREATE TABLE transaksi_peminjaman (
    kode_transaksi INT PRIMARY KEY,
    nim INT,
    nama_buku VARCHAR(100),
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Memasukkan data ke tabel transaksi_peminjaman
INSERT INTO transaksi_peminjaman (kode_transaksi, nim, nama_buku) VALUES 
(1, 21400200, 'Buku Informatika'),
(2, 21400202, 'Buku Teknik Elektro'),
(3, 21400203, 'Buku Matematika'),
(4, 21400206, 'Buku Fisika');

-- 1. Buatlah query view sehingga jika dijalakan hasilnya seperti dibawah ini :
DROP VIEW IF EXISTS v_peminjaman;
CREATE VIEW v_peminjaman AS
SELECT m.nim, m.nama, m.alamat, tp.nama_buku
FROM mahasiswa m
JOIN transaksi_peminjaman tp 
USING(nim);

-- 2. Dari query view nomor 1, buatlah view on view yang hasilnya menampikan data beralamat dari
-- semarang saja.
DROP VIEW IF EXISTS v_semarang;
CREATE VIEW v_semarang AS
SELECT * FROM v_peminjaman
WHERE alamat = 'Semarang';

-- 3. Tampikan list bukti view
SHOW FULL TABLES IN meet13_5209 WHERE TABLE_TYPE LIKE 'VIEW';