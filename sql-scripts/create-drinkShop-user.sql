CREATE USER 'drinkshopuser'@'localhost' IDENTIFIED BY 'drinkshop';

GRANT ALL PRIVILEGES ON * . * TO 'drinkshopuser'@'localhost';

ALTER USER 'drinkshopuser'@'localhost' IDENTIFIED WITH mysql_native_password BY 'drinkshop';