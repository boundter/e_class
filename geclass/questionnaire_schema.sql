DROP TABLE IF EXISTS answers_1;
DROP TABLE IF EXISTS answers_2;
DROP TABLE IF EXISTS meta_data;

PRAGMA encoding='UTF-8'

CREATE TABLE answers_1 (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  meta_data_id INTEGER,
  question_1_you INTEGER,
  question_1_expert INTEGER,
  question_2_you INTEGER,
  question_2_expert INTEGER,
  question_3_you INTEGER,
  question_3_expert INTEGER,
  question_4_you INTEGER,
  question_4_expert INTEGER,
  question_5_you INTEGER,
  question_5_expert INTEGER,
  question_6_you INTEGER,
  question_6_expert INTEGER,
  question_7_you INTEGER,
  question_7_expert INTEGER,
  question_8_you INTEGER,
  question_8_expert INTEGER,
  question_9_you INTEGER,
  question_9_expert INTEGER,
  question_10_you INTEGER,
  question_10_expert INTEGER,
  question_11_you INTEGER,
  question_11_expert INTEGER,
  question_12_you INTEGER,
  question_12_expert INTEGER,
  question_13_you INTEGER,
  question_13_expert INTEGER,
  question_14_you INTEGER,
  question_14_expert INTEGER,
  question_15_you INTEGER,
  question_15_expert INTEGER,
  question_16_you INTEGER,
  question_16_expert INTEGER,
  question_17_you INTEGER,
  question_17_expert INTEGER,
  question_18_you INTEGER,
  question_18_expert INTEGER,
  question_19_you INTEGER,
  question_19_expert INTEGER,
  question_20_you INTEGER,
  question_20_expert INTEGER,
  question_21_you INTEGER,
  question_21_expert INTEGER,
  question_22_you INTEGER,
  question_22_expert INTEGER,
  question_23_you INTEGER,
  question_23_expert INTEGER,
  question_24_you INTEGER,
  question_24_expert INTEGER,
  question_25_you INTEGER,
  question_25_expert INTEGER,
  question_26_you INTEGER,
  question_26_expert INTEGER,
  question_27_you INTEGER,
  question_27_expert INTEGER,
  question_28_you INTEGER,
  question_28_expert INTEGER,
  question_29_you INTEGER,
  question_29_expert INTEGER,
  question_30_you INTEGER,
  question_30_expert INTEGER,
  FOREIGN KEY (meta_data_id) REFERENCES meta_data (id)
);

CREATE TABLE answers_2 (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  meta_data_id INTEGER,
  question_1 INTEGER,
  question_2 INTEGER,
  question_3 INTEGER,
  question_4 INTEGER,
  question_5 INTEGER,
  question_6 INTEGER,
  question_7 INTEGER,
  question_8 INTEGER,
  question_9 INTEGER,
  question_10 INTEGER,
  question_11 INTEGER,
  question_12 INTEGER,
  question_13 INTEGER,
  question_14 INTEGER,
  question_15 INTEGER,
  question_16 INTEGER,
  question_17 INTEGER,
  question_18 INTEGER,
  question_19 INTEGER,
  question_20 INTEGER,
  question_21 INTEGER,
  question_22 INTEGER,
  question_23 INTEGER,
  question_24 INTEGER,
  question_25 INTEGER,
  question_26 INTEGER,
  question_27 INTEGER,
  FOREIGN KEY (meta_data_id) REFERENCES meta_data (id)
);

CREATE TABLE meta_data (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id TEXT,
  major TEXT,
  interest_physics TEXT,
  interest_change TEXT,
  gender TEXT,
  future_plans TEXT,
);
