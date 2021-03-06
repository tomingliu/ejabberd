ALTER TABLE users ADD userid VARCHAR(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL;

DELIMITER ;;
CREATE TRIGGER fill_userid
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
  IF NEW.userid IS NULL THEN
    SET NEW.userid = REPLACE(UUID(),'-','');
  END IF;
END
;;

