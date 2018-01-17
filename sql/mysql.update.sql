alter table users add userid varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL;

DELIMITER ;;
CREATE TRIGGER before_add_user
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
  IF NEW.userid IS NULL THEN
    SET NEW.userid = REPLACE(UUID(),'-','');
  END IF;
END
;;

