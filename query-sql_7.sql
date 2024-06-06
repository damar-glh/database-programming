# 1
# Buat sebuah function f_LuasPermukaanKubus, fungsi ini digunakan untuk menghitung luas
# permukaan kubus, L = 6*sisi*sisi. Fungsi ini membutuhkan satu buah parameter input untuk
# memasukkan nilai sisi kubus. Suggestion: manfaatkan math built-in function
# Setelah fungsi berhasil dibuat, lakukan beberapa percobaan eksekusi dengan mengganti
# nilai parameternya.


DELIMITER $$;
DROP FUNCTION IF EXISTS f_LuasPermukaanKubus;
CREATE FUNCTION f_LuasPermukaanKubus(sisi INT)
    RETURNS INT
BEGIN
    RETURN (6 * sisi * sisi);
END $$;
DELIMITER ;

SELECT f_LuasPermukaanKubus(2) as luas_permukaan;

# 2
# Buat sebuah function f_VolumePersegiPanjang, fungsi ini digunakan untuk menghitung
# volume persegi panjang, V = panjang*lebar*tinggi. Fungsi ini membutuhkan 3 buah
# parameter input untuk memasukkan nilai panjang, lebar, dan tinggi.
# Setelah fungsi berhasil dibuat, lakukan beberapa percobaan eksekusi dengan mengganti nilai
# parameternya.

DELIMITER $$;
DROP FUNCTION IF EXISTS f_VolumePersegiPanjang;
CREATE FUNCTION f_VolumePersegiPanjang(panjang INT, lebar INT, tinggi INT)
    RETURNS INT
BEGIN
    RETURN (panjang * lebar * tinggi);
END $$;
DELIMITER ;

SELECT f_VolumePersegiPanjang(5, 5, 1)  as volume_persegi_panjang;

# 3
# Tampilkan daftar function yang sudah anda buat, seharusnya ada dua buah function pada
# daftar tersebut
SHOW FUNCTION STATUS WHERE Db = 'product_managements';

# 4
# Buat sebuah function untuk menentukan kategori nilai, dengan ketentuan:
# akan bernilai A jika 91 – 100, B jika 71 – 90, C jika 51 – 70, dan D jika nilai
# kurang dari 50.
# Fungsi ini dinamai f_KategoriNilai, dengan satu buah parameter input untuk memasukkan
# nilai, return berupa char.

DELIMITER $$;
DROP FUNCTION IF EXISTS f_KategoriNilai;
CREATE FUNCTION f_KategoriNilai(nilai INT)
    RETURNS CHAR(1)
BEGIN
    RETURN CASE
        WHEN nilai BETWEEN 91 AND 100 THEN 'A'
        WHEN nilai BETWEEN 71 AND 90 THEN 'B'
        WHEN nilai BETWEEN 51 AND 70 THEN 'C'
        ELSE 'D'
    END;
END $$;
DELIMITER ;

SELECT f_KategoriNilai(98)  as nilai;

# 5
# Hapus function dengan nama f_VolumePersegiPanjang
DROP FUNCTION IF EXISTS f_VolumePersegiPanjang;


SHOW FUNCTION STATUS WHERE Db = 'product_managements';

# 1
# Buatlah SP dengan nama sp_hello untuk menampilan “Hello Word“
DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_hello;
CREATE PROCEDURE sp_hello()
BEGIN
    SELECT 'Hello World';
END $$;
DELIMITER ;

CALL sp_hello();

# 2
# Buat SP untuk menampikan semua data pada table concerns dengan nama
# sp_tampildata

DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_tampildata;
CREATE PROCEDURE sp_tampildata()
BEGIN
    SELECT * FROM concerns;
END $$;
DELIMITER ;

CALL sp_tampildata();

# 3
# Buat sebuah stored procedure (sp) dengan nama sp_products_limit_3, sp ini tidak
# memiliki parameter input, sp ini berisi perintah untuk menampilkan data dari tabel
# products, data yang ditampilkan adalah keseluruhan kolom dan 3 buah baris data
# teratas saja.

DELIMITER $$;
DROP PROCEDURE IF EXISTS sp_products_limit_3;
CREATE PROCEDURE sp_products_limit_3()
BEGIN
    SELECT * FROM products LIMIT 3;
END $$;
DELIMITER ;

CALL sp_products_limit_3();

# 5
# Hapus sp dengan nama sp_products_limit_3!
DROP PROCEDURE IF EXISTS sp_products_limit_3;

SHOW PROCEDURE STATUS WHERE Db = 'product_managements';
