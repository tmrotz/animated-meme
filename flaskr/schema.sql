-- Initialize the database.
-- Drop any existing data and create empty tables.

DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS stage;
DROP TABLE IF EXISTS pipeline;
DROP TABLE IF EXISTS lead;

CREATE TABLE role (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

INSERT INTO role (id, name) VALUES (1, 'admin');
INSERT INTO role (id, name) VALUES (2, 'worker');
INSERT INTO role (id, name) VALUES (4, 'client');

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  role_id INTEGER NOT NULL DEFAULT 4,
  first TEXT NOT NULL,
  last TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES role (id)
);

CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);

CREATE TABLE stage (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL
);

INSERT INTO stage (name) VALUES ('Non-Contacted');
INSERT INTO stage (name) VALUES ('1st Contacted');
INSERT INTO stage (name) VALUES ('2nd Contacted');
INSERT INTO stage (name) VALUES ('3rd Contacted');
INSERT INTO stage (name) VALUES ('4th Contacted');
INSERT INTO stage (name) VALUES ('5th Contacted');
INSERT INTO stage (name) VALUES ('6th Contacted');
INSERT INTO stage (name) VALUES ('Called');
INSERT INTO stage (name) VALUES ('Monthly Follow-up');
INSERT INTO stage (name) VALUES ('3 Month Follow-up');
INSERT INTO stage (name) VALUES ('6 Month Follow-up');
INSERT INTO stage (name) VALUES ('Other');
INSERT INTO stage (name) VALUES ('Rejected');
INSERT INTO stage (name) VALUES ('Interviewing');
INSERT INTO stage (name) VALUES ('Finished');
INSERT INTO stage (name) VALUES ('Old Connections');
INSERT INTO stage (name) VALUES ('Linkedin Talking');
INSERT INTO stage (name) VALUES ('Email Talking');

CREATE TABLE pipeline (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  owner_id INTEGER NOT NULL,
  worker_id INTEGER NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES user (id),
  FOREIGN KEY (worker_id) REFERENCES user (id)
);

CREATE TABLE lead (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  stage_id INTEGER NOT NULL DEFAULT 1,
  pipeline_id INTEGER NOT NULL,
  name TEXT NOT NULL,
  first_name TEXT NOT NULL,
  linkedin TEXT NOT NULL,
  position TEXT,
  phone TEXT,
  email TEXT,
  company TEXT,
  location TEXT,
  headline TEXT,
  connected TIMESTAMP,
  last_text TIMESTAMP,
  last_email TIMESTAMP,
  FOREIGN KEY (stage_id) REFERENCES stage (id),
  FOREIGN KEY (pipeline_id) REFERENCES pipeline (id)
);

