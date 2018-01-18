ALTER TABLE users ADD userid VARCHAR(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL;

SET GLOBAL log_bin_trust_function_creators = 1;

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

