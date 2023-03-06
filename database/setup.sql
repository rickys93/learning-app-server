DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS tokens;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS user_answers;

CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE tokens (
  id INT PRIMARY KEY,
  user_id INT NOT NULL,
  token VARCHAR(255) NOT NULL,
  expiration TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(500) NOT NULL
);

CREATE TABLE questions (
  id INT PRIMARY KEY,
  category_id INT NOT NULL,
  question TEXT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE answers (
  id INT PRIMARY KEY,
  question_id INT NOT NULL,
  answer TEXT NOT NULL,
  correct BOOLEAN NOT NULL,
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE user_answers (
  user_id INT NOT NULL,
  question_id INT NOT NULL,
  answer_id INT NOT NULL,
  correct BOOLEAN NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (answer_id) REFERENCES answers(id),
  PRIMARY KEY (user_id, question_id, timestamp)
);

INSERT INTO categories (id, name, description)
VALUES
  (1, 'History', 'Questions related to historical events'),
  (2, 'Science', 'Questions related to scientific concepts'),
  (3, 'Geography', 'Questions related to locations and maps');

INSERT INTO questions (id, category_id, question)
VALUES
  (1, 1, 'In what year did World War II end?'),
  (2, 1, 'Who was the first president of the United States?'),
  (3, 2, 'What is the atomic number of oxygen?'),
  (4, 2, 'What is the process by which plants convert light into energy called?'),
  (5, 3, 'What is the capital of France?');

INSERT INTO answers (id, question_id, answer, correct)
VALUES
  (1, 1, '1945', true),
  (2, 1, '1939', false),
  (3, 2, 'George Washington', true),
  (4, 2, 'Thomas Jefferson', false),
  (5, 3, '8', false),
  (6, 3, '16', false),
  (7, 3, '17', false),
  (8, 3, '6', true),
  (9, 4, 'Photosynthesis', true),
  (10, 4, 'Cellular respiration', false),
  (11, 5, 'Paris', true),
  (12, 5, 'London', false);
