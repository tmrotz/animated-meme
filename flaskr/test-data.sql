
INSERT INTO user (id, role_id, email, first, last, password)
  VALUES (1, 1, 'tmrotz@gmail.com', 'Travis', 'Rotz', 'scrypt:32768:8:1$YRuWCT8twaOVVNoQ$85a626cd35ca4b963b956336eb1d9cf97a8c7d81f8d66625b416e4adff6b825394becbabbc2a75e967e3f73eee9e2913c3fae7a45639ce33e0b55dab6b035514');
INSERT INTO user (id, role_id, email, first, last, password)
  VALUES (2, 2, 'worker@gmail.com', 'Worker', 'Worker', 'scrypt:32768:8:1$YRuWCT8twaOVVNoQ$85a626cd35ca4b963b956336eb1d9cf97a8c7d81f8d66625b416e4adff6b825394becbabbc2a75e967e3f73eee9e2913c3fae7a45639ce33e0b55dab6b035514');
INSERT INTO user (id, role_id, email, first, last, password)
  VALUES (3, 3, 'client1@gmail.com', '1st', 'Client', 'scrypt:32768:8:1$YRuWCT8twaOVVNoQ$85a626cd35ca4b963b956336eb1d9cf97a8c7d81f8d66625b416e4adff6b825394becbabbc2a75e967e3f73eee9e2913c3fae7a45639ce33e0b55dab6b035514');
INSERT INTO user (id, role_id, email, first, last, password)
  VALUES (4, 3, 'client2@gmail.com', '2nd', 'Client', 'scrypt:32768:8:1$YRuWCT8twaOVVNoQ$85a626cd35ca4b963b956336eb1d9cf97a8c7d81f8d66625b416e4adff6b825394becbabbc2a75e967e3f73eee9e2913c3fae7a45639ce33e0b55dab6b035514');

INSERT INTO worker_client (worker_id, client_id)
  VALUES (2, 3);
INSERT INTO worker_client (worker_id, client_id)
  VALUES (2, 3);

INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'You shouldnt see this', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (3, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO lead (owner_id, name, first_name, linkedin, connected, last_text, last_email)
  VALUES (4, 'Travis Rotz', 'Travis', 'https://www.linkedin.com/tmrotz', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

