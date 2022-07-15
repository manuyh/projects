CREATE DATABASE IF NOT EXISTS ops;
USE ops;

CREATE TABLE IF NOT EXISTS catalogs (
      id              BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
      name            TEXT        CHARACTER SET utf8mb4 NOT NULL,
      created_at      DATETIME    DEFAULT CURRENT_TIMESTAMP,
      updated_at      DATETIME    DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS catalogs_items (
      id              BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
      identifier      BIGINT      NOT NULL,
      label           TEXT        CHARACTER SET utf8mb4 NOT NULL,
      catalog_id      BIGINT      NOT NULL,
      created_at      DATETIME    DEFAULT CURRENT_TIMESTAMP,
      updated_at      DATETIME    DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
      FOREIGN KEY (catalog_id)
      REFERENCES catalogs(id)
);

CREATE TABLE IF NOT EXISTS responses (
      id                                   BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
      identifier                           BIGINT      NOT NULL,
      gender                               BIGINT      NOT NULL,
      age                                  BIGINT      NOT NULL,
      age_unit                             BIGINT      NOT NULL,
      birthdate                            TEXT        NOT NULL,
      deathdate                            TEXT        NOT NULL,
      variable1                            TEXT        NOT NULL,
      variable2                            TEXT        NOT NULL,
      a                                    TEXT        NOT NULL,
      time_a                               BIGINT      NOT NULL,
      time_unit_a                          BIGINT      NOT NULL,
      b                                    TEXT        NOT NULL,
      time_b                               BIGINT      NOT NULL,
      time_unit_b                          BIGINT      NOT NULL,
      c                                    TEXT        NOT NULL,
      time_c                               BIGINT      NOT NULL,
      time_unit_c                          BIGINT      NOT NULL,
      d                                    TEXT        NOT NULL,
      time_d                               BIGINT      NOT NULL,
      time_unit_d                          BIGINT      NOT NULL,
      part_2                               TEXT        NOT NULL,
      time_part_2                          BIGINT      NOT NULL,
      time_unit_part_2                     BIGINT      NOT NULL,
      surgery                              BIGINT      NOT NULL,
      surgery_date                         TEXT        NOT NULL,
      autopsy                              BIGINT      NOT NULL,
      used_foundings                       BIGINT      NOT NULL,
      manner_of_death                      BIGINT      NOT NULL,
      place_of_death                       BIGINT      NOT NULL,
      multiple_pregnancy                   BIGINT      NOT NULL,
      hours_alive                          BIGINT      NOT NULL,
      weight_in_grams                      BIGINT      NOT NULL,
      full_weeks_of_pregnancy              BIGINT      NOT NULL,
      mother_age_in_years                  BIGINT      NOT NULL,
      woman_pregnancy_condition            BIGINT      NOT NULL,
      pregnancy_contribution_to_death      BIGINT      NOT NULL,
      created_at                           DATETIME    DEFAULT CURRENT_TIMESTAMP,
      updated_at                           DATETIME    DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);
