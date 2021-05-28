CREATE TABLE `edu`.`studymaterial` (
  `sm_id` INT NOT NULL AUTO_INCREMENT,
  `sm_name` VARCHAR(45) NOT NULL,
  `sm_des` VARCHAR(500) NULL DEFAULT NULL,
  `sm_path` VARCHAR(500) NULL DEFAULT NULL,
  `course_id` INT NOT NULL,
  `sm_type` VARCHAR(45) NOT NULL,
  `sm_time` DATE NOT NULL,
  PRIMARY KEY (`sm_id`),
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `edu`.`course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
