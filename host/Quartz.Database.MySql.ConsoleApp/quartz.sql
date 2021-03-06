ALTER DATABASE CHARACTER SET utf8mb4;
CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET utf8mb4;

START TRANSACTION;

ALTER DATABASE CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_CALENDARS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `CALENDAR_NAME` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
    `CALENDAR` longblob NOT NULL,
    CONSTRAINT `PK_QRTZ_CALENDARS` PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`)
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `ENTRY_ID` varchar(140) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_NAME` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
    `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
    `FIRED_TIME` bigint NOT NULL,
    `SCHED_TIME` bigint NOT NULL,
    `PRIORITY` int NOT NULL,
    `STATE` varchar(16) CHARACTER SET utf8mb4 NOT NULL,
    `JOB_NAME` varchar(200) CHARACTER SET utf8mb4 NULL,
    `JOB_GROUP` varchar(200) CHARACTER SET utf8mb4 NULL,
    `IS_NONCONCURRENT` tinyint(1) NULL,
    `REQUESTS_RECOVERY` tinyint(1) NULL,
    CONSTRAINT `PK_QRTZ_FIRED_TRIGGERS` PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`)
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_JOB_DETAILS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `JOB_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `JOB_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 NULL,
    `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
    `IS_DURABLE` tinyint(1) NOT NULL,
    `IS_NONCONCURRENT` tinyint(1) NOT NULL,
    `IS_UPDATE_DATA` tinyint(1) NOT NULL,
    `REQUESTS_RECOVERY` tinyint(1) NOT NULL,
    `JOB_DATA` longblob NULL,
    CONSTRAINT `PK_QRTZ_JOB_DETAILS` PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_LOCKS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_QRTZ_LOCKS` PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`)
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_QRTZ_PAUSED_TRIGGER_GRPS` PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`)
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_SCHEDULER_STATE` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `INSTANCE_NAME` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
    `LAST_CHECKIN_TIME` bigint NOT NULL,
    `CHECKIN_INTERVAL` bigint NOT NULL,
    CONSTRAINT `PK_QRTZ_SCHEDULER_STATE` PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`)
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_TRIGGERS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `JOB_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `JOB_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 NULL,
    `NEXT_FIRE_TIME` bigint NULL,
    `PREV_FIRE_TIME` bigint NULL,
    `PRIORITY` int NULL,
    `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 NOT NULL,
    `START_TIME` bigint NOT NULL,
    `END_TIME` bigint NULL,
    `CALENDAR_NAME` varchar(200) CHARACTER SET utf8mb4 NULL,
    `MISFIRE_INSTR` smallint NULL,
    `JOB_DATA` longblob NULL,
    CONSTRAINT `PK_QRTZ_TRIGGERS` PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `FK_QRTZ_TRIGGERS_QRTZ_JOB_DETAILS_SCHED_NAME_JOB_NAME_JOB_GROUP` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE CASCADE
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `BLOB_DATA` longblob NULL,
    CONSTRAINT `PK_QRTZ_BLOB_TRIGGERS` PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `FK_QRTZ_BLOB_TRIGGERS_QRTZ_TRIGGERS_SCHED_NAME_TRIGGER_NAME_TRI~` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE CASCADE
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_CRON_TRIGGERS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `CRON_EXPRESSION` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
    `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_QRTZ_CRON_TRIGGERS` PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `FK_QRTZ_CRON_TRIGGERS_QRTZ_TRIGGERS_SCHED_NAME_TRIGGER_NAME_TRI~` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE CASCADE
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `REPEAT_COUNT` bigint NOT NULL,
    `REPEAT_INTERVAL` bigint NOT NULL,
    `TIMES_TRIGGERED` bigint NOT NULL,
    CONSTRAINT `PK_QRTZ_SIMPLE_TRIGGERS` PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `FK_QRTZ_SIMPLE_TRIGGERS_QRTZ_TRIGGERS_SCHED_NAME_TRIGGER_NAME_T~` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE CASCADE
) CHARACTER SET utf8mb4;

CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
    `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_NAME` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `TRIGGER_GROUP` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 NULL,
    `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 NULL,
    `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 NULL,
    `INT_PROP_1` int NULL,
    `INT_PROP_2` int NULL,
    `LONG_PROP_1` bigint NULL,
    `LONG_PROP_2` bigint NULL,
    `DEC_PROP_1` decimal(13,4) NULL,
    `DEC_PROP_2` decimal(13,4) NULL,
    `BOOL_PROP_1` tinyint(1) NULL,
    `BOOL_PROP_2` tinyint(1) NULL,
    `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 NULL,
    CONSTRAINT `PK_QRTZ_SIMPROP_TRIGGERS` PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`),
    CONSTRAINT `FK_QRTZ_SIMPROP_TRIGGERS_QRTZ_TRIGGERS_SCHED_NAME_TRIGGER_NAME_~` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE CASCADE
) CHARACTER SET utf8mb4;

CREATE INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`);

CREATE INDEX `IDX_QRTZ_FT_J_G` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);

CREATE INDEX `IDX_QRTZ_FT_JG` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `JOB_GROUP`);

CREATE INDEX `IDX_QRTZ_FT_T_G` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`);

CREATE INDEX `IDX_QRTZ_FT_TG` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `TRIGGER_GROUP`);

CREATE INDEX `IDX_QRTZ_FT_TRIG_INST_NAME` ON `QRTZ_FIRED_TRIGGERS` (`SCHED_NAME`, `INSTANCE_NAME`);

CREATE INDEX `IDX_QRTZ_J_GRP` ON `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_GROUP`);

CREATE INDEX `IDX_QRTZ_J_REQ_RECOVERY` ON `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `REQUESTS_RECOVERY`);

CREATE INDEX `IDX_QRTZ_T_C` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `CALENDAR_NAME`);

CREATE INDEX `IDX_QRTZ_T_G` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_GROUP`);

CREATE INDEX `IDX_QRTZ_T_J` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`);

CREATE INDEX `IDX_QRTZ_T_JG` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `JOB_GROUP`);

CREATE INDEX `IDX_QRTZ_T_N_G_STATE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`);

CREATE INDEX `IDX_QRTZ_T_N_STATE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`);

CREATE INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `NEXT_FIRE_TIME`);

CREATE INDEX `IDX_QRTZ_T_NFT_MISFIRE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`);

CREATE INDEX `IDX_QRTZ_T_NFT_ST` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`);

CREATE INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`);

CREATE INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`);

CREATE INDEX `IDX_QRTZ_T_STATE` ON `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_STATE`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20210726171138_InitMigration', '5.0.8');

COMMIT;

