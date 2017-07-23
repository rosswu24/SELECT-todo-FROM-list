DROP DATABASE IF EXISTS todo_app; 
DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app; 
\c todo_app;


CREATE TABLE tasks (
id SERIAL NOT NULL,
title VARCHAR (255),
description text,
created_at timestamp,
updated_at timestamp,
completed boolean
);


ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at timestamp;
ALTER TABLE tasks ADD COLUMN completed_at DEFAULT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;


INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES('Study SQL','Complete this exercis', NOW(), NOW(),NULL);


INSERT INTO tasks (title, description)
VALUES('Study POSTgreSQL','Read all the documentation');

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NUll;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES('mistake 1','a test entry');

INSERT INTO tasks(title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title DESC;
