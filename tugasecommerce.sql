Microsoft Windows [Version 10.0.26100.3624]
(c) Microsoft Corporation. All rights reserved.

C:\Users\yayas>cd C:\xampp\mysql\bin

C:\xampp\mysql\bin>
C:\xampp\mysql\bin>mysql -u root
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 119
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE DATABASE ecommerce_db;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> USE ecommerce_db;
Database changed
MariaDB [ecommerce_db]> CREATE TABLE products (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   nama_produk VARCHAR(100),
    ->   harga INT,
    ->   deskripsi TEXT,
    ->   stok INT
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [ecommerce_db]> CREATE TABLE users (
    ->   id INT AUTO_INCREMENT PRIMARY KEY,
    ->   nama VARCHAR(100),
    ->   email VARCHAR(100),
    ->   password VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.015 sec)

MariaDB [ecommerce_db]> CREATE TABLE orders (
    ->   order_id INT AUTO_INCREMENT PRIMARY KEY,
    ->   user_id INT,
    ->   product_id INT,
    ->   quantity INT,
    ->   total INT,
    ->   FOREIGN KEY (user_id) REFERENCES users(id),
    ->   FOREIGN KEY (product_id) REFERENCES products(id)
    -> );
Query OK, 0 rows affected (0.042 sec)

MariaDB [ecommerce_db]> SHOW TABLES;
+------------------------+
| Tables_in_ecommerce_db |
+------------------------+
| orders                 |
| products               |
| users                  |
+------------------------+
3 rows in set (0.001 sec)

MariaDB [ecommerce_db]> DESCRIBE products;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| id          | int(11)      | NO   | PRI | NULL    | auto_increment |
| nama_produk | varchar(100) | YES  |     | NULL    |                |
| harga       | int(11)      | YES  |     | NULL    |                |
| deskripsi   | text         | YES  |     | NULL    |                |
| stok        | int(11)      | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.014 sec)

MariaDB [ecommerce_db]> INSERT INTO products (nama_produk, harga, deskripsi, stok)
    -> VALUES ('Laptop Ultrabook', 12000000, 'Laptop ringan dan cepat untuk kerja produktif.', 10);
Query OK, 1 row affected (0.006 sec)

MariaDB [ecommerce_db]> SELECT * FROM products;
+----+------------------+----------+------------------------------------------------+------+
| id | nama_produk      | harga    | deskripsi                                      | stok |
+----+------------------+----------+------------------------------------------------+------+
|  1 | Laptop Ultrabook | 12000000 | Laptop ringan dan cepat untuk kerja produktif. |   10 |
+----+------------------+----------+------------------------------------------------+------+
1 row in set (0.000 sec)

MariaDB [ecommerce_db]> UPDATE products
    -> SET harga = 11500000, stok = 8
    -> WHERE id = 1;
Query OK, 1 row affected (0.006 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [ecommerce_db]> DELETE FROM products
    -> WHERE id = 1;
Query OK, 1 row affected (0.004 sec)

MariaDB [ecommerce_db]> INSERT INTO users (nama, email, password)
    -> VALUES ('Fauzi', 'fauzinoor@gmail.com', '123456');
Query OK, 1 row affected (0.004 sec)

MariaDB [ecommerce_db]> SELECT * FROM users;
+----+-------+---------------------+----------+
| id | nama  | email               | password |
+----+-------+---------------------+----------+
|  1 | Fauzi | fauzinoor@gmail.com | 123456   |
+----+-------+---------------------+----------+
1 row in set (0.000 sec)

MariaDB [ecommerce_db]> UPDATE users
    -> SET nama = 'Budi Santoso'
    -> WHERE id = 1;
Query OK, 1 row affected (0.004 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [ecommerce_db]> DELETE FROM users
    -> WHERE id = 1;
Query OK, 1 row affected (0.004 sec)

MariaDB [ecommerce_db]> INSERT INTO orders (user_id, product_id, quantity, total)
    -> VALUES (1, 2, 2, 24000000);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`ecommerce_db`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))
MariaDB [ecommerce_db]> SELECT * FROM users;
Empty set (0.001 sec)

MariaDB [ecommerce_db]> INSERT INTO users (nama, email, password)
    -> VALUES ('Fauzi', 'fauzi@gmail.com', '123456');
Query OK, 1 row affected (0.005 sec)

MariaDB [ecommerce_db]> INSERT INTO products (nama_produk, harga, deskripsi, stok)
    -> VALUES ('Laptop Gaming', 12000000, 'Laptop untuk performa tinggi', 15);
Query OK, 1 row affected (0.004 sec)

MariaDB [ecommerce_db]> SELECT * FROM products;
+----+---------------+----------+------------------------------+------+
| id | nama_produk   | harga    | deskripsi                    | stok |
+----+---------------+----------+------------------------------+------+
|  2 | Laptop Gaming | 12000000 | Laptop untuk performa tinggi |   15 |
+----+---------------+----------+------------------------------+------+
1 row in set (0.000 sec)

MariaDB [ecommerce_db]> INSERT INTO orders (user_id, product_id, quantity, total)
    -> VALUES (1, 2, 2, 24000000);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`ecommerce_db`.`orders`, CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))
MariaDB [ecommerce_db]> SELECT * FROM users;
+----+-------+-----------------+----------+
| id | nama  | email           | password |
+----+-------+-----------------+----------+
|  2 | Fauzi | fauzi@gmail.com | 123456   |
+----+-------+-----------------+----------+
1 row in set (0.001 sec)

MariaDB [ecommerce_db]> INSERT INTO orders (user_id, product_id, quantity, total)
    -> VALUES (2, 2, 2, 24000000);
Query OK, 1 row affected (0.004 sec)

MariaDB [ecommerce_db]> SELECT * FROM products;
+----+---------------+----------+------------------------------+------+
| id | nama_produk   | harga    | deskripsi                    | stok |
+----+---------------+----------+------------------------------+------+
|  2 | Laptop Gaming | 12000000 | Laptop untuk performa tinggi |   15 |
+----+---------------+----------+------------------------------+------+
1 row in set (0.000 sec)

MariaDB [ecommerce_db]> SELECT * FROM products;
+----+---------------+----------+------------------------------+------+
| id | nama_produk   | harga    | deskripsi                    | stok |
+----+---------------+----------+------------------------------+------+
|  2 | Laptop Gaming | 12000000 | Laptop untuk performa tinggi |   15 |
+----+---------------+----------+------------------------------+------+
1 row in set (0.000 sec)

MariaDB [ecommerce_db]> SELECT * FROM orders;
+----------+---------+------------+----------+----------+
| order_id | user_id | product_id | quantity | total    |
+----------+---------+------------+----------+----------+
|        3 |       2 |          2 |        2 | 24000000 |
+----------+---------+------------+----------+----------+
1 row in set (0.000 sec)

MariaDB [ecommerce_db]>