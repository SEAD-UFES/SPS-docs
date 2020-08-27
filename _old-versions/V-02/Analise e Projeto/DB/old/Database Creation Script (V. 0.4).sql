-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema spss
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `spss` ;

-- -----------------------------------------------------
-- Schema spss
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spss` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `spss` ;

-- -----------------------------------------------------
-- Table `spss`.`State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`State` ;

CREATE TABLE IF NOT EXISTS `spss`.`State` (
  `StateOID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Abbreviation` CHAR(2) NULL,
  PRIMARY KEY (`StateOID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spss`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`City` ;

CREATE TABLE IF NOT EXISTS `spss`.`City` (
  `CityOID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Cit_Sta_StateOID` INT NOT NULL,
  PRIMARY KEY (`CityOID`),
  INDEX `FK_Cit_Sta_StateOID_idx` (`Cit_Sta_StateOID` ASC),
  CONSTRAINT `FK_Cit_Sta_StateOID`
    FOREIGN KEY (`Cit_Sta_StateOID`)
    REFERENCES `spss`.`State` (`StateOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spss`.`Person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Person` ;

CREATE TABLE IF NOT EXISTS `spss`.`Person` (
  `PersonOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Address` ;

CREATE TABLE IF NOT EXISTS `spss`.`Address` (
  `AddressOID` INT(11) NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `District` VARCHAR(45) NULL DEFAULT NULL,
  `Number` VARCHAR(45) NULL DEFAULT NULL,
  `Zip` VARCHAR(45) NULL DEFAULT NULL,
  `Complement` VARCHAR(45) NULL DEFAULT NULL,
  `Add_Cit_CityOID` INT NOT NULL,
  `Add_Per_PersonOID` INT NOT NULL,
  PRIMARY KEY (`AddressOID`),
  INDEX `FK_Add_Cit_CityOID_idx` (`Add_Cit_CityOID` ASC),
  INDEX `FK_Add_Per_PersonOID_idx` (`Add_Per_PersonOID` ASC),
  CONSTRAINT `FK_Add_Cit_CityOID`
    FOREIGN KEY (`Add_Cit_CityOID`)
    REFERENCES `spss`.`City` (`CityOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Add_Per_PersonOID`
    FOREIGN KEY (`Add_Per_PersonOID`)
    REFERENCES `spss`.`Person` (`PersonOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `spss`.`KnowledgeArea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`KnowledgeArea` ;

CREATE TABLE IF NOT EXISTS `spss`.`KnowledgeArea` (
  `KnowledgeAreaOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `GrandArea` INT NULL,
  PRIMARY KEY (`KnowledgeAreaOID`),
  INDEX `fk_GrandArea_Kno_KnowledgeOID_idx` (`GrandArea` ASC),
  CONSTRAINT `fk_GrandArea_Kno_KnowledgeOID`
    FOREIGN KEY (`GrandArea`)
    REFERENCES `spss`.`KnowledgeArea` (`KnowledgeAreaOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`ActivityCategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`ActivityCategory` ;

CREATE TABLE IF NOT EXISTS `spss`.`ActivityCategory` (
  `ActivityCategoryOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ActivityCategoryOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`ActivityType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`ActivityType` ;

CREATE TABLE IF NOT EXISTS `spss`.`ActivityType` (
  `ActivityTypeOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  `Aty_Aca_ActivityCategoryOID` INT NOT NULL,
  PRIMARY KEY (`ActivityTypeOID`),
  INDEX `FK_Aty_Aca_ActivityCategoryOID_idx` (`Aty_Aca_ActivityCategoryOID` ASC),
  CONSTRAINT `FK_Aty_Aca_ActivityCategoryOID`
    FOREIGN KEY (`Aty_Aca_ActivityCategoryOID`)
    REFERENCES `spss`.`ActivityCategory` (`ActivityCategoryOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Designation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Designation` ;

CREATE TABLE IF NOT EXISTS `spss`.`Designation` (
  `DesignationOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`DesignationOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Ethnicity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Ethnicity` ;

CREATE TABLE IF NOT EXISTS `spss`.`Ethnicity` (
  `EthnicityOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`EthnicityOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`MaritalStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`MaritalStatus` ;

CREATE TABLE IF NOT EXISTS `spss`.`MaritalStatus` (
  `MaritalStatusOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`MaritalStatusOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`User` ;

CREATE TABLE IF NOT EXISTS `spss`.`User` (
  `UserOID` INT NOT NULL AUTO_INCREMENT,
  `Login` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `UfesLogin` VARCHAR(45) NULL,
  `UfesPasswordHash` VARCHAR(45) NULL,
  `Authorized` TINYINT NULL,
  PRIMARY KEY (`UserOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Gender`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Gender` ;

CREATE TABLE IF NOT EXISTS `spss`.`Gender` (
  `GenderOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`GenderOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`PhysicalPerson`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`PhysicalPerson` ;

CREATE TABLE IF NOT EXISTS `spss`.`PhysicalPerson` (
  `Phy_Per_PersonOID` INT NOT NULL,
  `Cpf` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NULL,
  `BirthDate` DATE NULL,
  `Nationality` VARCHAR(45) NULL,
  `RgNumber` VARCHAR(45) NULL,
  `RgIssuingAgency` VARCHAR(45) NULL,
  `BirthPlace` INT NOT NULL,
  `Phy_Eth_EthnicityOID` INT NOT NULL,
  `Phy_Mar_MaritalStatusOID` INT NOT NULL,
  `Phy_Use_UserOID` INT NOT NULL,
  `Phy_Gen_GenderOID` INT NOT NULL,
  `RgState` INT NOT NULL,
  PRIMARY KEY (`Phy_Per_PersonOID`),
  INDEX `FK_Phy_Eth_EthnicityOID_idx` (`Phy_Eth_EthnicityOID` ASC),
  INDEX `FK_Phy_Mar_MaritalStatusOID_idx` (`Phy_Mar_MaritalStatusOID` ASC),
  INDEX `FK_Phy_Use_UserOID_idx` (`Phy_Use_UserOID` ASC),
  INDEX `FK_BirthPlace_Cit_CityOID_idx` (`BirthPlace` ASC),
  INDEX `FK_RgState_Sta_StateOID_idx` (`RgState` ASC),
  INDEX `FK_Phy_Gen_GenderOID_idx` (`Phy_Gen_GenderOID` ASC),
  CONSTRAINT `FK_PhyPer_PersonoOID`
    FOREIGN KEY (`Phy_Per_PersonOID`)
    REFERENCES `spss`.`Person` (`PersonOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Phy_Eth_EthnicityOID`
    FOREIGN KEY (`Phy_Eth_EthnicityOID`)
    REFERENCES `spss`.`Ethnicity` (`EthnicityOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Phy_Mar_MaritalStatusOID`
    FOREIGN KEY (`Phy_Mar_MaritalStatusOID`)
    REFERENCES `spss`.`MaritalStatus` (`MaritalStatusOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Phy_Use_UserOID`
    FOREIGN KEY (`Phy_Use_UserOID`)
    REFERENCES `spss`.`User` (`UserOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BirthPlace_Cit_CityOID`
    FOREIGN KEY (`BirthPlace`)
    REFERENCES `spss`.`City` (`CityOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RgState_Sta_StateOID`
    FOREIGN KEY (`RgState`)
    REFERENCES `spss`.`State` (`StateOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Phy_Gen_GenderOID`
    FOREIGN KEY (`Phy_Gen_GenderOID`)
    REFERENCES `spss`.`Gender` (`GenderOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Candidate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Candidate` ;

CREATE TABLE IF NOT EXISTS `spss`.`Candidate` (
  `CandidateOID` INT NOT NULL AUTO_INCREMENT,
  `Poor` TINYINT NULL,
  `Can_Phy_PhysicalPersonOID` INT NOT NULL,
  PRIMARY KEY (`CandidateOID`),
  INDEX `FK_Can_Phy_PhysicalPersonOID_idx` (`Can_Phy_PhysicalPersonOID` ASC),
  CONSTRAINT `FK_Can_Phy_PhysicalPersonOID`
    FOREIGN KEY (`Can_Phy_PhysicalPersonOID`)
    REFERENCES `spss`.`PhysicalPerson` (`Phy_Per_PersonOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`GraduationType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`GraduationType` ;

CREATE TABLE IF NOT EXISTS `spss`.`GraduationType` (
  `GraduationTypeOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`GraduationTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Course` ;

CREATE TABLE IF NOT EXISTS `spss`.`Course` (
  `CourseOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Cou_Gra_GraduationTypeOID` INT NULL,
  `Cou_Kno_KnowledgeAreaOID` INT NULL,
  PRIMARY KEY (`CourseOID`),
  INDEX `FK_Cou_Gra_GraduationTypeOID_idx` (`Cou_Gra_GraduationTypeOID` ASC),
  INDEX `FK_Cou_Kno_KnowledgeAreaOID_idx` (`Cou_Kno_KnowledgeAreaOID` ASC),
  CONSTRAINT `FK_Cou_Gra_GraduationTypeOID`
    FOREIGN KEY (`Cou_Gra_GraduationTypeOID`)
    REFERENCES `spss`.`GraduationType` (`GraduationTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Cou_Kno_KnowledgeAreaOID`
    FOREIGN KEY (`Cou_Kno_KnowledgeAreaOID`)
    REFERENCES `spss`.`KnowledgeArea` (`KnowledgeAreaOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`SelectiveProcess`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`SelectiveProcess` ;

CREATE TABLE IF NOT EXISTS `spss`.`SelectiveProcess` (
  `SelectiveProcessOID` INT NOT NULL AUTO_INCREMENT,
  `Number` VARCHAR(45) NULL,
  `Year` YEAR NULL,
  `Sel_Cou_CourseOID` INT NOT NULL,
  PRIMARY KEY (`SelectiveProcessOID`),
  INDEX `FK_Sel_Cou_CourseOID_idx` (`Sel_Cou_CourseOID` ASC),
  CONSTRAINT `FK_Sel_Cou_CourseOID`
    FOREIGN KEY (`Sel_Cou_CourseOID`)
    REFERENCES `spss`.`Course` (`CourseOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Call`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Call` ;

CREATE TABLE IF NOT EXISTS `spss`.`Call` (
  `CallOID` INT NOT NULL AUTO_INCREMENT,
  `Number` VARCHAR(45) NULL,
  `EnrollmentOpeningDate` DATETIME NULL,
  `EnrollmentClosureDate` DATETIME NULL,
  `ResultDate` DATETIME NULL,
  `Cal_Sel_SelectiveProcessOID` INT NOT NULL,
  PRIMARY KEY (`CallOID`),
  INDEX `FK_Cal_Sel_SelectiveProcessOID_idx` (`Cal_Sel_SelectiveProcessOID` ASC),
  CONSTRAINT `FK_Cal_Sel_SelectiveProcessOID`
    FOREIGN KEY (`Cal_Sel_SelectiveProcessOID`)
    REFERENCES `spss`.`SelectiveProcess` (`SelectiveProcessOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`ContactType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`ContactType` ;

CREATE TABLE IF NOT EXISTS `spss`.`ContactType` (
  `ContactTypeOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ContactTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Contact` ;

CREATE TABLE IF NOT EXISTS `spss`.`Contact` (
  `ContactOID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NULL,
  `Con_Cty_ContactTypeOID` INT NULL,
  `Con_Per_PersonOID` INT NULL,
  `Con_Cou_CourseOID` INT NULL,
  PRIMARY KEY (`ContactOID`),
  INDEX `FK_Con_Cty_ContactTypeOID_idx` (`Con_Cty_ContactTypeOID` ASC),
  INDEX `FK_Con_Per_PersonOID_idx` (`Con_Per_PersonOID` ASC),
  INDEX `FK_Con_Cou_CouseOID_idx` (`Con_Cou_CourseOID` ASC),
  CONSTRAINT `FK_Con_Cty_ContactTypeOID`
    FOREIGN KEY (`Con_Cty_ContactTypeOID`)
    REFERENCES `spss`.`ContactType` (`ContactTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Con_Per_PersonOID`
    FOREIGN KEY (`Con_Per_PersonOID`)
    REFERENCES `spss`.`Person` (`PersonOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Con_Cou_CouseOID`
    FOREIGN KEY (`Con_Cou_CourseOID`)
    REFERENCES `spss`.`Course` (`CourseOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Restriction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Restriction` ;

CREATE TABLE IF NOT EXISTS `spss`.`Restriction` (
  `RestrictionOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`RestrictionOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Vacancy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Vacancy` ;

CREATE TABLE IF NOT EXISTS `spss`.`Vacancy` (
  `VacancyOID` INT NOT NULL AUTO_INCREMENT,
  `Quantity` SMALLINT NULL,
  `Reservation` TINYINT NULL,
  `Vac_Des_DesignationOID` INT NOT NULL,
  `Vac_Cal_CallOID` INT NOT NULL,
  `Vac_Res_RestrictionOID` INT NULL,
  `Vac_Sel_SelectiveProcessOID` INT NOT NULL,
  PRIMARY KEY (`VacancyOID`),
  INDEX `FK_Vac_Des_DesignationOID_idx` (`Vac_Des_DesignationOID` ASC),
  INDEX `FK_Vac_Cal_CallOID_idx` (`Vac_Cal_CallOID` ASC),
  INDEX `FK_Vac_Res_RestrictionOID_idx` (`Vac_Res_RestrictionOID` ASC),
  INDEX `FK_Vac_Sel_SelectiveProcessOID_idx` (`Vac_Sel_SelectiveProcessOID` ASC),
  CONSTRAINT `FK_Vac_Des_DesignationOID`
    FOREIGN KEY (`Vac_Des_DesignationOID`)
    REFERENCES `spss`.`Designation` (`DesignationOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vac_Cal_CallOID`
    FOREIGN KEY (`Vac_Cal_CallOID`)
    REFERENCES `spss`.`Call` (`CallOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vac_Res_RestrictionOID`
    FOREIGN KEY (`Vac_Res_RestrictionOID`)
    REFERENCES `spss`.`Restriction` (`RestrictionOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vac_Sel_SelectiveProcessOID`
    FOREIGN KEY (`Vac_Sel_SelectiveProcessOID`)
    REFERENCES `spss`.`SelectiveProcess` (`SelectiveProcessOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Enrollment` ;

CREATE TABLE IF NOT EXISTS `spss`.`Enrollment` (
  `EnrollmentOID` INT NOT NULL AUTO_INCREMENT,
  `Number` VARCHAR(45) NULL,
  `CreationTimeStamp` DATETIME NULL,
  `FinalGrade` DECIMAL NULL,
  `Enr_Can_CandidateOID` INT NOT NULL,
  `Enr_Vac_VacancyOID` INT NOT NULL,
  `Enr_Cur_CurriculumOID` INT NOT NULL,
  PRIMARY KEY (`EnrollmentOID`),
  INDEX `FK_Enr_Can_CandidateOID_idx` (`Enr_Can_CandidateOID` ASC),
  INDEX `FK_Enr_Vac_VacancyOID_idx` (`Enr_Vac_VacancyOID` ASC),
  INDEX `FK_Enr_Cur_CurriculumOID_idx` (`Enr_Cur_CurriculumOID` ASC),
  CONSTRAINT `FK_Enr_Can_CandidateOID`
    FOREIGN KEY (`Enr_Can_CandidateOID`)
    REFERENCES `spss`.`Candidate` (`CandidateOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Enr_Vac_VacancyOID`
    FOREIGN KEY (`Enr_Vac_VacancyOID`)
    REFERENCES `spss`.`Vacancy` (`VacancyOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Enr_Cur_CurriculumOID`
    FOREIGN KEY (`Enr_Cur_CurriculumOID`)
    REFERENCES `spss`.`Curriculum` (`CurriculumOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Curriculum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Curriculum` ;

CREATE TABLE IF NOT EXISTS `spss`.`Curriculum` (
  `CurriculumOID` INT NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` DATETIME NULL,
  `LattesAddress` VARCHAR(45) NULL,
  `Cur_Can_CandidateOID` INT NOT NULL,
  `Cur_Enr_EnrollmentOID` INT NULL,
  PRIMARY KEY (`CurriculumOID`),
  INDEX `FK_Cur_Can_CandidateOID_idx` (`Cur_Can_CandidateOID` ASC),
  INDEX `FK_Cur_Enr_EnrollmentOID_idx` (`Cur_Enr_EnrollmentOID` ASC),
  CONSTRAINT `FK_Cur_Can_CandidateOID`
    FOREIGN KEY (`Cur_Can_CandidateOID`)
    REFERENCES `spss`.`Candidate` (`CandidateOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Cur_Enr_EnrollmentOID`
    FOREIGN KEY (`Cur_Enr_EnrollmentOID`)
    REFERENCES `spss`.`Enrollment` (`EnrollmentOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`StageType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`StageType` ;

CREATE TABLE IF NOT EXISTS `spss`.`StageType` (
  `StageTypeOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`StageTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Stage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Stage` ;

CREATE TABLE IF NOT EXISTS `spss`.`Stage` (
  `StageOID` INT NOT NULL AUTO_INCREMENT,
  `AppealOpeningDate` DATETIME NULL,
  `AppealClosureDate` DATETIME NULL,
  `AppealResultDate` DATETIME NULL,
  `ResultDate` DATETIME NULL,
  `Sta_Cal_CallOID` INT NOT NULL,
  `Sta_Sty_StageTypeOID` INT NOT NULL,
  PRIMARY KEY (`StageOID`),
  INDEX `FK_Sta_Cal_CallOID_idx` (`Sta_Cal_CallOID` ASC),
  INDEX `FK_Sta_Sty_StageTypeOID_idx` (`Sta_Sty_StageTypeOID` ASC),
  CONSTRAINT `FK_Sta_Cal_CallOID`
    FOREIGN KEY (`Sta_Cal_CallOID`)
    REFERENCES `spss`.`Call` (`CallOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sta_Sty_StageTypeOID`
    FOREIGN KEY (`Sta_Sty_StageTypeOID`)
    REFERENCES `spss`.`StageType` (`StageTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Graduation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Graduation` ;

CREATE TABLE IF NOT EXISTS `spss`.`Graduation` (
  `GraduationOID` INT NOT NULL AUTO_INCREMENT,
  `Course` VARCHAR(45) NULL,
  `Workload` INT NULL,
  `StartDate` DATETIME NULL,
  `EndDate` DATETIME NULL,
  `Institution` VARCHAR(45) NULL,
  `Gra_Cur_CurriculumOID` INT NOT NULL,
  `Gra_Kno_KnowledgeAreaOID` INT NOT NULL,
  `Gra_Gty_GraduationTypeOID` INT NOT NULL,
  PRIMARY KEY (`GraduationOID`),
  INDEX `FK_Gra_Cur_CurriculumOID_idx` (`Gra_Cur_CurriculumOID` ASC),
  INDEX `FK_Gra_Kno_KnowledgeAreaOID_idx` (`Gra_Kno_KnowledgeAreaOID` ASC),
  INDEX `FK_Gra_Gty_GraduationTypeOID_idx` (`Gra_Gty_GraduationTypeOID` ASC),
  CONSTRAINT `FK_Gra_Cur_CurriculumOID`
    FOREIGN KEY (`Gra_Cur_CurriculumOID`)
    REFERENCES `spss`.`Curriculum` (`CurriculumOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Gra_Kno_KnowledgeAreaOID`
    FOREIGN KEY (`Gra_Kno_KnowledgeAreaOID`)
    REFERENCES `spss`.`KnowledgeArea` (`KnowledgeAreaOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Gra_Gty_GraduationTypeOID`
    FOREIGN KEY (`Gra_Gty_GraduationTypeOID`)
    REFERENCES `spss`.`GraduationType` (`GraduationTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`RoleType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`RoleType` ;

CREATE TABLE IF NOT EXISTS `spss`.`RoleType` (
  `RoleTypeOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`RoleTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Role` ;

CREATE TABLE IF NOT EXISTS `spss`.`Role` (
  `RoleOID` INT NOT NULL AUTO_INCREMENT,
  `Rol_Rty_RoleTypeOID` INT NOT NULL,
  `Rol_Use_UserOID` INT NOT NULL,
  PRIMARY KEY (`RoleOID`),
  INDEX `FK_Rol_Rty_RoleTypeOID_idx` (`Rol_Rty_RoleTypeOID` ASC),
  INDEX `FK_Rol_Use_UserOID_idx` (`Rol_Use_UserOID` ASC),
  CONSTRAINT `FK_Rol_Rty_RoleTypeOID`
    FOREIGN KEY (`Rol_Rty_RoleTypeOID`)
    REFERENCES `spss`.`RoleType` (`RoleTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Rol_Use_UserOID`
    FOREIGN KEY (`Rol_Use_UserOID`)
    REFERENCES `spss`.`User` (`UserOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Polo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Polo` ;

CREATE TABLE IF NOT EXISTS `spss`.`Polo` (
  `Pol_Per_PersonOID` INT NOT NULL,
  PRIMARY KEY (`Pol_Per_PersonOID`),
  CONSTRAINT `FK_Pol_Per_PersonOID`
    FOREIGN KEY (`Pol_Per_PersonOID`)
    REFERENCES `spss`.`Person` (`PersonOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`PublicationType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`PublicationType` ;

CREATE TABLE IF NOT EXISTS `spss`.`PublicationType` (
  `PublicationTypeOID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`PublicationTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Publication` ;

CREATE TABLE IF NOT EXISTS `spss`.`Publication` (
  `PublicationOID` INT NOT NULL AUTO_INCREMENT,
  `PublicationDate` DATETIME NULL,
  `Description` VARCHAR(45) NULL,
  `Path` VARCHAR(45) NULL,
  `Valid` TINYINT NULL,
  `Pub_Sel_SelectiveProcessOID` INT NULL,
  `Pub_Cal_CallOID` INT NULL,
  `Pub_Sta_StageOID` INT NULL,
  `Pub_Pty_PublicationTypeOID` INT NOT NULL,
  PRIMARY KEY (`PublicationOID`),
  INDEX `FK_Pub_Sel_SelectiveProcessOID_idx` (`Pub_Sel_SelectiveProcessOID` ASC),
  INDEX `FK_Pub_Cal_CallOID_idx` (`Pub_Cal_CallOID` ASC),
  INDEX `FK_Pub_Sta_StageOID_idx` (`Pub_Sta_StageOID` ASC),
  INDEX `FK_Pub_Pty_PublicationTypeOID_idx` (`Pub_Pty_PublicationTypeOID` ASC),
  CONSTRAINT `FK_Pub_Sel_SelectiveProcessOID`
    FOREIGN KEY (`Pub_Sel_SelectiveProcessOID`)
    REFERENCES `spss`.`SelectiveProcess` (`SelectiveProcessOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pub_Cal_CallOID`
    FOREIGN KEY (`Pub_Cal_CallOID`)
    REFERENCES `spss`.`Call` (`CallOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pub_Sta_StageOID`
    FOREIGN KEY (`Pub_Sta_StageOID`)
    REFERENCES `spss`.`Stage` (`StageOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pub_Pty_PublicationTypeOID`
    FOREIGN KEY (`Pub_Pty_PublicationTypeOID`)
    REFERENCES `spss`.`PublicationType` (`PublicationTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`StageResult`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`StageResult` ;

CREATE TABLE IF NOT EXISTS `spss`.`StageResult` (
  `StageResultOID` INT NOT NULL AUTO_INCREMENT,
  `Grade` DECIMAL NULL,
  `Sta_Sge_StageOID` INT NOT NULL,
  `Sta_Enr_EnrollmentOID` INT NOT NULL,
  PRIMARY KEY (`StageResultOID`),
  INDEX `FK_Sta_Sge_StageOID_idx` (`Sta_Sge_StageOID` ASC),
  INDEX `FK_Sta_Enr_EnrollmentOID_idx` (`Sta_Enr_EnrollmentOID` ASC),
  CONSTRAINT `FK_Sta_Sge_StageOID`
    FOREIGN KEY (`Sta_Sge_StageOID`)
    REFERENCES `spss`.`Stage` (`StageOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sta_Enr_EnrollmentOID`
    FOREIGN KEY (`Sta_Enr_EnrollmentOID`)
    REFERENCES `spss`.`Enrollment` (`EnrollmentOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`PresentialVacancy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`PresentialVacancy` ;

CREATE TABLE IF NOT EXISTS `spss`.`PresentialVacancy` (
  `Pre_Vac_VacancyOID` INT NOT NULL,
  `Pre_Pol_PoloOID` INT NOT NULL,
  PRIMARY KEY (`Pre_Vac_VacancyOID`),
  INDEX `FK_Pre_Pol_PoloOID_idx` (`Pre_Pol_PoloOID` ASC),
  CONSTRAINT `FK_Pre_Vac_VacancyOID`
    FOREIGN KEY (`Pre_Vac_VacancyOID`)
    REFERENCES `spss`.`Vacancy` (`VacancyOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Pre_Pol_PoloOID`
    FOREIGN KEY (`Pre_Pol_PoloOID`)
    REFERENCES `spss`.`Polo` (`Pol_Per_PersonOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`TargetType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`TargetType` ;

CREATE TABLE IF NOT EXISTS `spss`.`TargetType` (
  `TargetTypeOID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`TargetTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Action` ;

CREATE TABLE IF NOT EXISTS `spss`.`Action` (
  `ActionOID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ActionOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Permission` ;

CREATE TABLE IF NOT EXISTS `spss`.`Permission` (
  `PermissionOID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(45) NULL,
  `Per_Tar_TargetTypeOID` INT NOT NULL,
  `Per_Act_ActionOID` INT NOT NULL,
  PRIMARY KEY (`PermissionOID`),
  INDEX `FK_Per_Tar_TargetTypeOID_idx` (`Per_Tar_TargetTypeOID` ASC),
  INDEX `FK_Per_Act_ActionOID_idx` (`Per_Act_ActionOID` ASC),
  CONSTRAINT `FK_Per_Tar_TargetTypeOID`
    FOREIGN KEY (`Per_Tar_TargetTypeOID`)
    REFERENCES `spss`.`TargetType` (`TargetTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Per_Act_ActionOID`
    FOREIGN KEY (`Per_Act_ActionOID`)
    REFERENCES `spss`.`Action` (`ActionOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`ActionLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`ActionLog` ;

CREATE TABLE IF NOT EXISTS `spss`.`ActionLog` (
  `ActionLogOID` INT NOT NULL AUTO_INCREMENT,
  `CreationTimeStamp` DATETIME NULL,
  `TargetInstance` VARCHAR(45) NULL,
  `IpAddress` VARCHAR(45) NULL,
  `Log_Use_UserOID` INT NOT NULL,
  `Log_Tar_TargetTypeOID` INT NOT NULL,
  `Log_Act_ActionOID` INT NOT NULL,
  PRIMARY KEY (`ActionLogOID`),
  INDEX `FK_Log_Use_UserOID_idx` (`Log_Use_UserOID` ASC),
  INDEX `FK_Log_Tar_TargetTypeOID_idx` (`Log_Tar_TargetTypeOID` ASC),
  INDEX `FK_Log_Act_ActionOID_idx` (`Log_Act_ActionOID` ASC),
  CONSTRAINT `FK_Log_Use_UserOID`
    FOREIGN KEY (`Log_Use_UserOID`)
    REFERENCES `spss`.`User` (`UserOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Log_Tar_TargetTypeOID`
    FOREIGN KEY (`Log_Tar_TargetTypeOID`)
    REFERENCES `spss`.`TargetType` (`TargetTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Log_Act_ActionOID`
    FOREIGN KEY (`Log_Act_ActionOID`)
    REFERENCES `spss`.`Action` (`ActionOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Permission_RoleType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Permission_RoleType` ;

CREATE TABLE IF NOT EXISTS `spss`.`Permission_RoleType` (
  `Prt_Per_PermissionOID` INT NOT NULL,
  `Prt_Rty_RoleTypeOID` INT NOT NULL,
  PRIMARY KEY (`Prt_Per_PermissionOID`, `Prt_Rty_RoleTypeOID`),
  INDEX `FK_Prt_Rty_RoleTypeOID_idx` (`Prt_Rty_RoleTypeOID` ASC),
  CONSTRAINT `FK_Prt_Per_PermissionOID`
    FOREIGN KEY (`Prt_Per_PermissionOID`)
    REFERENCES `spss`.`Permission` (`PermissionOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Prt_Rty_RoleTypeOID`
    FOREIGN KEY (`Prt_Rty_RoleTypeOID`)
    REFERENCES `spss`.`RoleType` (`RoleTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Role_Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Role_Course` ;

CREATE TABLE IF NOT EXISTS `spss`.`Role_Course` (
  `Rco_Rol_RoleOID` INT NOT NULL,
  `Rco_Cou_CourseOID` INT NOT NULL,
  PRIMARY KEY (`Rco_Rol_RoleOID`, `Rco_Cou_CourseOID`),
  INDEX `FK_Rco_Cou_CourseOID_idx` (`Rco_Cou_CourseOID` ASC),
  CONSTRAINT `FK_Rco_Rol_RoleOID`
    FOREIGN KEY (`Rco_Rol_RoleOID`)
    REFERENCES `spss`.`Role` (`RoleOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Rco_Cou_CourseOID`
    FOREIGN KEY (`Rco_Cou_CourseOID`)
    REFERENCES `spss`.`Course` (`CourseOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`Activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`Activity` ;

CREATE TABLE IF NOT EXISTS `spss`.`Activity` (
  `ActivityOID` INT NOT NULL,
  `Quantity` SMALLINT NULL,
  `Act_Aty_ActivityTypeOID` INT NOT NULL,
  `Act_Kno_KnowledgeAreaOID` INT NOT NULL,
  `Act_Cur_CurriculumOID` INT NOT NULL,
  PRIMARY KEY (`ActivityOID`),
  INDEX `FK_Act_Aty_ActivityTypeOID_idx` (`Act_Aty_ActivityTypeOID` ASC),
  INDEX `FK_Act_Kno_KnowledgeAreaOID_idx` (`Act_Kno_KnowledgeAreaOID` ASC),
  INDEX `FK_Act_Cur_CurriculumOID_idx` (`Act_Cur_CurriculumOID` ASC),
  CONSTRAINT `FK_Act_Aty_ActivityTypeOID`
    FOREIGN KEY (`Act_Aty_ActivityTypeOID`)
    REFERENCES `spss`.`ActivityType` (`ActivityTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Act_Kno_KnowledgeAreaOID`
    FOREIGN KEY (`Act_Kno_KnowledgeAreaOID`)
    REFERENCES `spss`.`KnowledgeArea` (`KnowledgeAreaOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Act_Cur_CurriculumOID`
    FOREIGN KEY (`Act_Cur_CurriculumOID`)
    REFERENCES `spss`.`Curriculum` (`CurriculumOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`ErrorType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`ErrorType` ;

CREATE TABLE IF NOT EXISTS `spss`.`ErrorType` (
  `ErrorTypeOID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`ErrorTypeOID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spss`.`ErrorLog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spss`.`ErrorLog` ;

CREATE TABLE IF NOT EXISTS `spss`.`ErrorLog` (
  `ErrorLogOID` INT NOT NULL,
  `CreationTimeStamp` DATETIME NULL,
  `Description` VARCHAR(45) NULL,
  `Err_Ety_ErrorTypeOID` INT NOT NULL,
  PRIMARY KEY (`ErrorLogOID`),
  INDEX `FK_Err_Ety_ErrorTypeOID_idx` (`Err_Ety_ErrorTypeOID` ASC),
  CONSTRAINT `FK_Err_Ety_ErrorTypeOID`
    FOREIGN KEY (`Err_Ety_ErrorTypeOID`)
    REFERENCES `spss`.`ErrorType` (`ErrorTypeOID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
