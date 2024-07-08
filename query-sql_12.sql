-- 1. Buat sebuah user account baru dengan nama user1@localhost, password: password
CREATE USER IF NOT EXISTS 'user1'@'localhost' IDENTIFIED BY 'password';

-- 2. Dengan satu buah perintah saja, buat dua buah user account dengan nama user2@localhost, dan user3@localhost masing-masing dengan password: password
CREATE USER IF NOT EXISTS 'user2'@'localhost' IDENTIFIED BY 'password','user3'@'localhost' IDENTIFIED BY 'password';

-- 3. Tampilkan daftar user account
SELECT user, host FROM mysql.user;

-- 4. Berikan akses kepada user1@localhost agar bisa melakukan SELECT, UPDATE, danDELETE di seluruh tabel pada basisdata product_managements
GRANT SELECT, UPDATE, DELETE ON product_managements_5209.* TO 'user1'@'localhost';

-- 5. Berikan hak akses kepada user2@localhost agar bisa melakukan INSERT di tabel products
GRANT INSERT ON product_managements_5209.products TO 'user2'@'localhost';

-- 6. Berikan hak akses kepada user3@localhost agar bisa melakukan UPDATE di kolom stock tabel products
GRANT UPDATE(stock) ON product_managements_5209.products TO 'user3'@'localhost';

-- 7. Tampilkan daftar akses dari masing-masing user account menggunakan perintah SHOW GRANT
SHOW GRANTS FOR 'user1'@'localhost';
SHOW GRANTS FOR 'user2'@'localhost';
SHOW GRANTS FOR 'user3'@'localhost';

-- 8. Ganti nama user3@localhost menjadi user4@localhost
RENAME USER 'user3'@'localhost' TO 'user4'@'localhost';

-- 9. Hilangkan permission INSERT tabel products dari user2@localhost
REVOKE INSERT ON product_managements_5209.products FROM 'user2'@'localhost';

-- 10. Buktikan bahwa akses tersebut sudah hilang, gunakan perintah SHOW GRANT
SHOW GRANTS FOR 'user2'@'localhost';

-- 11. Hapus user1@localhost, user2@localhost, dan user4@localhost dari tabel user
DROP USER 'user1'@'localhost', 'user2'@'localhost', 'user4'@'localhost';

-- 12. Buat sebuah role dengan nama sales
CREATE ROLE sales;

-- 13. Dengan sebuah perintah CREATE, buat dua buah user account baru dengan nama last_name@localhost, fist_name@localhost password:password
CREATE USER IF NOT EXISTS 'last_name'@'localhost' IDENTIFIED BY 'password', 'fist_name'@'localhost' IDENTIFIED BY 'password';

-- 14. Berikan aksesrole sales kepada last_name@localhost dan fist_name@localhost
GRANT sales TO 'last_name'@'localhost', 'fist_name'@'localhost';

-- 15. Berikan akses untuk melakukan SELECT, UPDATE kepada role sales terhadap tabel products di basisdata product_managements
GRANT SELECT, UPDATE ON product_managements_5209.products TO sales;

-- 16. Menggunakan SHOW GRANT statement, buktikan bahwa poin 14 dan 15 berhasil.
SHOW GRANTS FOR 'last_name'@'localhost';
SHOW GRANTS FOR 'fist_name'@'localhost';