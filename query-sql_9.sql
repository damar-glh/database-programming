-- 1. Gunakan database meet9 dan perhatikan pada tabel items dan transaction [point 30] Buatlah trigger event insert before yaitu penambahan baris data baru di tabel transaction. Dimana jika qty yang akan dijual melebihi stok yang ada di item, maka qty tidak boleh kurang dari nol. Jika Trigger sukses dan saat proses input data pada tabel transcation, sebagai contoh: INSERT INTO `transaction` (`id_transaction`, `id_item`, `qty`, `total`) VALUES (1,1,15,200000) Maka akan muncul komentar “#1644 - Warning: stok tidak cukup” Komentar itu muncul karena proses transaksi pada id_item 1 telah melebihi stok karena stok pada item 10 sedang proses insert pada transaction qty = 15;
DELIMITER $$;
DROP TRIGGER IF EXISTS insert_transaction_5209;
CREATE TRIGGER insert_transaction_5209 BEFORE INSERT ON transaction
FOR EACH ROW
BEGIN
    DECLARE stock INT;
    SELECT stok INTO stock FROM items WHERE id_item = NEW.id_item;
    IF NEW.qty > stock THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stok tidak cukup';
    END IF;
END$$;
DELIMITER ;
INSERT INTO `transaction` (`id_transaction`, `id_item`, `qty`,`total`) VALUES (1,1,15,200000);

-- 2. A. Buat tabel baru yaitu tabel tbl_barang dan status_barang;
CREATE TABLE tbl_barang (
    kode_barang VARCHAR(5) PRIMARY KEY,
    nama_barang VARCHAR(50),
    harga DECIMAL(10,2),
    stok INT
);

CREATE TABLE status_barang (
    kode_barang VARCHAR(5),
    status VARCHAR(50),
    FOREIGN KEY (kode_barang) REFERENCES tbl_barang(kode_barang)
);

INSERT INTO tbl_barang (kode_barang, nama_barang, harga, stok) VALUES ('B001','Teh Botol', 5000, 0);
INSERT INTO tbl_barang (kode_barang, nama_barang, harga, stok) VALUES ('B002','Buahvita', 8000, 15);
INSERT INTO tbl_barang (kode_barang, nama_barang, harga, stok) VALUES ('B005','Good Day', 7000, 21);
INSERT INTO status_barang (kode_barang, status) VALUES ('B001','Habis');

-- 2. B. Buatlah trigger komplek untuk update status, dengan event after update pada tbl_barang berdasarkan kode barang dengan ketentuan sebagai jika update pada kolom stok sama dengan nol maka status “Habis” dan jika lebih dari nol maka status “Tersedia”.
DELIMITER $$;
DROP TRIGGER IF EXISTS update_status_barang_5209;
CREATE TRIGGER update_status_barang_5209 AFTER UPDATE ON tbl_barang
FOR EACH ROW
BEGIN
    IF NEW.stok = 0 THEN
        UPDATE status_barang SET status = 'Habis' WHERE kode_barang = NEW.kode_barang;
    ELSE
        UPDATE status_barang SET status = 'Tersedia' WHERE kode_barang = NEW.kode_barang;
    END IF;
END$$;
DELIMITER ;
UPDATE tbl_barang SET stok = 10 WHERE kode_barang = 'B001';

-- 3. Gunakan database meet11 dan Perhatikan tiga tabel dibawah ini:
--  a. Buatlah trigger Membuat Trigger untuk Update Stok pada Proses Pembelian yang akan secara otomatis memperbarui stok pada tabel barang setiap kali ada insert ke tabel pembelian (AFTER INSERT).
DELIMITER $$;
DROP TRIGGER IF EXISTS update_stok_barang_5209;
CREATE TRIGGER update_stok_barang_5209 AFTER INSERT ON pembelian
FOR EACH ROW
BEGIN   
    UPDATE barang SET stok = stok + NEW.jumlah WHERE id_barang = NEW.id_barang;
END$$;
DELIMITER ;
INSERT INTO pembelian (id_barang, jumlah, tanggal_pembelian, total_harga) VALUES (1, 10, '2021-11-01', 50000);

-- b. Membuat Trigger untuk Update Stok pada Proses Penjualan yang akan secara otomatis mengurangi stok pada tabel barang setiap kali ada insert ke tabel penjualan (AFTER INSERT).
DELIMITER $$;
DROP TRIGGER IF EXISTS update_stok_barang_penjualan_5209;
CREATE TRIGGER update_stok_barang_penjualan_5209 AFTER INSERT ON penjualan
FOR EACH ROW
BEGIN
    UPDATE barang SET stok = stok - NEW.jumlah WHERE id_barang = NEW.id_barang;
END$$;
DELIMITER ;
INSERT INTO penjualan (id_barang, jumlah, tanggal_penjualan, total_harga) VALUES (1, 5, '2021-11-01', 25000);