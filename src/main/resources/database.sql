-- Table: users
CREATE TABLE users
(
  id        INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
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

-- Table: categories
CREATE TABLE categories
(
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Table: orders
CREATE TABLE orders
(
  id         INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_id INT NOT NULL,
  user_id    INT NOT NULL,
  date       DATETIME
);

-- Table: producer
CREATE TABLE producers
(
  id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(100)
);

-- Table: products
CREATE TABLE products
(
  id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category_id INT          NOT NULL,
  producer_id INT          NOT NULL,
  order_id    INT,
  model       VARCHAR(64)  NOT NULL,
  price       VARCHAR(32)  NOT NULL,
  description VARCHAR(256) NOT NULL
);

-- Insert data

INSERT INTO users
VALUES (1, 'admin', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG', 'admin', 'admin', 'admin_email',
        'admin_address', '7788');

INSERT INTO roles
VALUES (1, 'ROLE_USER');
INSERT INTO roles
VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles
VALUES (1, 2);

INSERT INTO categories
VALUES (1, 'notebook');
INSERT INTO categories
VALUES (2, 'smartphone');
INSERT INTO categories
VALUES (3, 'tablet');

INSERT INTO producers
VALUES (1, 'asus');
INSERT INTO producers
VALUES (2, 'nokia');
INSERT INTO producers
VALUES (3, 'samsung');

INSERT INTO products
VALUES (1, 1, 1, null, 'first notebook model', '100$', 'this is notebook');
INSERT INTO products
VALUES (2, 2, 2, null, 'first smartphone model', '200$', 'this is smartphone');
INSERT INTO products
VALUES (3, 3, 3, null, 'first tablet model', '300$', 'this is tablet');
