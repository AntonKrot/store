-- Table: users
CREATE TABLE users
(
  id       INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username  VARCHAR(255) NOT NULL,
  password  VARCHAR(255) NOT NULL,
  firstname VARCHAR(64)  NOT NULL,
  lastname  VARCHAR(64)  NOT NULL,
  email     VARCHAR(64)  NOT NULL,
  address   VARCHAR(64)  NOT NULL,
  phone     VARCHAR(32)  NOT NULL
)
;

-- Table: roles
CREATE TABLE roles
(
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Table: for mapping user and roles: user_roles
CREATE TABLE user_roles
(
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
);

-- Insert data

INSERT INTO users
VALUES (1, 'admin', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'admin', 'admin', 'admin_email', 'admin_address', '7788');

INSERT INTO roles
VALUES (1, 'ROLE_USER');
INSERT INTO roles
VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);