-- (1)
CREATE database petsDB;

-- (2)
SHOW DATABASES;

-- +--------------------+
-- | Database           |
-- +--------------------+
-- | company            |
-- | information_schema |
-- | it1223             |
-- | mysql              |
-- | performance_schema |
-- | petsdb             |
-- | phpmyadmin         |
-- | student            |
-- | test               |
-- +--------------------+

-- (3)
USE petsDB;

-- (4)
GRANT create ON petsDB.* TO staff01@localhost;
FLUSH privileges;

-- (5)
SHOW GRANTS FOR 'staff01'@'localhost';

-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- | GRANT CREATE ON `petsdb`.* TO `staff01`@`localhost`                                                            |
-- +----------------------------------------------------------------------------------------------------------------+

-- (6)
mysql -u staff01 -p

SHOW DATABASES;
-- +--------------------+
-- | Database           |
-- +--------------------+
-- | information_schema |
-- | petsdb             |
-- | test               |
-- +--------------------+

-- (7)
CREATE TABlE owner (
    ownerId int NOT NULL PRIMARY KEY,
    name varchar(255),
    town varchar(255)
);

-- (8)
SHOW TABLES;
-- +------------------+
-- | Tables_in_petsdb |
-- +------------------+
-- | owner            |
-- +------------------+

DESC owner;
-- ERROR 1142 (42000): SELECT command denied to user 'staff01'@'localhost' for table `petsdb`.`owner`

-- (9)
mysql -u root -p

GRANT select ON petsDB.* TO staff01@localhost;

SHOW GRANTS FOR 'staff01'@'localhost';
-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- | GRANT SELECT, CREATE ON `petsdb`.* TO `staff01`@`localhost`                                                    |
-- +----------------------------------------------------------------------------------------------------------------+

-- (10)
DESC owner;
-- +---------+--------------+------+-----+---------+-------+
-- | Field   | Type         | Null | Key | Default | Extra |
-- +---------+--------------+------+-----+---------+-------+
-- | ownerId | int(11)      | NO   | PRI | NULL    |       |
-- | name    | varchar(255) | YES  |     | NULL    |       |
-- | town    | varchar(255) | YES  |     | NULL    |       |
-- +---------+--------------+------+-----+---------+-------+

SELECT * FROM owner;
-- Empty set (0.001 sec)

-- (11)
INSERT INTO owner VALUES (1732, "Ragavan", "Jaffna");
-- ERROR 1142 (42000): INSERT command denied to user 'staff01'@'localhost' for table `petsdb`.`owner`

-- (12)
mysql -u root -p

GRANT insert ON petsDB.* TO staff01@localhost;
FLUSH privileges;

SHOW GRANTS FOR 'staff01'@'localhost';

-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- | GRANT SELECT, INSERT, CREATE ON `petsdb`.* TO `staff01`@`localhost`                                            |
-- +----------------------------------------------------------------------------------------------------------------+

-- (13)
INSERT INTO owner VALUES 
    (1732, "Ragavan", "Jaffna"),
    (1654, "Ragu", "Vavuniya"),
    (1543, "Parvathy", "Kilinochi"),
    (2312, "Nesan", "Jaffna"),
    (2323, "Vijay", "Mankulam");

SELECT * FROM owner;
-- +---------+----------+-----------+
-- | ownerId | name     | town      |
-- +---------+----------+-----------+
-- |    1543 | Parvathy | Kilinochi |
-- |    1654 | Ragu     | Vavuniya  |
-- |    1732 | Ragavan  | Jaffna    |
-- |    2312 | Nesan    | Jaffna    |
-- |    2323 | Vijay    | Mankulam  |
-- +---------+----------+-----------+

-- (14)
UPDATE owner SET town="Omanthai" WHERE ownerId=2323;
-- ERROR 1142 (42000): UPDATE command denied to user 'staff01'@'localhost' for table `petsdb`.`owner`

-- (15)
mysql -u root -p

GRANT update ON petsDB.* TO staff01@localhost;
FLUSH privileges;

SHOW GRANTS FOR 'staff01'@'localhost';
-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- | GRANT SELECT, INSERT, UPDATE, CREATE ON `petsdb`.* TO `staff01`@`localhost`                                    |
-- +----------------------------------------------------------------------------------------------------------------+

-- (16)
UPDATE owner SET town="Omanthai" WHERE ownerId=2323;
-- Query OK, 1 row affected (0.010 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0

-- (17)
DELETE FROM owner WHERE ownerId=2312;
-- ERROR 1142 (42000): DELETE command denied to user 'staff01'@'localhost' for table `petsdb`.`owner`

-- (18)
mysql -u root -p

GRANT delete ON petsDB.* TO staff01@localhost;
FLUSH privileges;

SHOW GRANTS FOR 'staff01'@'localhost';
-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- | GRANT SELECT, INSERT, UPDATE, DELETE, CREATE ON `petsdb`.* TO `staff01`@`localhost`                            |
-- +----------------------------------------------------------------------------------------------------------------+

-- (19)
DELETE FROM owner WHERE ownerId=2312;
-- Query OK, 1 row affected (0.010 sec)

-- (20)
DROP DATABASE petsDB;
-- ERROR 1044 (42000): Access denied for user 'staff01'@'localhost' to database 'petsdb'

-- (21)
mysql -u root -p

GRANT drop ON petsDB.* TO staff01@localhost;
FLUSH privileges;

SHOW GRANTS FOR 'staff01'@'localhost';
-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- | GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON `petsdb`.* TO `staff01`@`localhost`                      |
-- +----------------------------------------------------------------------------------------------------------------+

-- (22)
DROP DATABASE petsDB;
-- Query OK, 1 row affected (0.035 sec)

SHOW DATABASES;
-- +--------------------+
-- | Database           |
-- +--------------------+
-- | information_schema |
-- | test               |
-- +--------------------+