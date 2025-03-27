-- (i)
CREATE USER 'staff01'@'localhost' IDENTIFIED BY "123";

-- (ii)
USE mysql;

SELECT user, host, password FROM user;

-- +---------+-----------+-------------------------------------------+
-- | User    | Host      | Password                                  |
-- +---------+-----------+-------------------------------------------+
-- | root    | localhost |                                           |
-- | staff01 | localhost | *23AE809DDACAF96AF0FD78ED04B6A265E05AA257 |
-- | root    | 127.0.0.1 |                                           |
-- | root    | ::1       |                                           |
-- | pma     | localhost |                                           |
-- +---------+-----------+-------------------------------------------+

-- (iii)
mysql -u staff01 -p

CREATE database petsDB;

-- ERROR 1044 (42000): Access denied for user 'staff01'@'localhost' to database 'petsdb'

-- (iv)
SHOW GRANTS FOR 'staff01'@'localhost';

-- +----------------------------------------------------------------------------------------------------------------+
-- | Grants for staff01@localhost                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------+
-- | GRANT USAGE ON *.* TO `staff01`@`localhost` IDENTIFIED BY PASSWORD '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257' |
-- +----------------------------------------------------------------------------------------------------------------+

-- (v)
SELECT * FROM user;