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
  phone     INT(9)       NOT NULL
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
  id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id     INT          NOT NULL,
  status_id   INT          NOT NULL,
  total_price DOUBLE       NOT NULL,
  comment     VARCHAR(1000),
  address     VARCHAR(120) NOT NULL,
  phone       INT(9)       NOT NULL,
  date        DATETIME     NOT NULL
);

-- Table: status
CREATE TABLE status
(
  id     INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  status VARCHAR(255) NOT NULL
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
  picture     BLOB,
  category_id INT          NOT NULL,
  producer_id INT          NOT NULL,
  model       VARCHAR(64)  NOT NULL,
  price       DOUBLE       NOT NULL,
  description VARCHAR(256) NOT NULL,

  FOREIGN KEY (category_id) REFERENCES categories (id),
  FOREIGN KEY (producer_id) REFERENCES producers (id)
);

-- Table: for mapping products and orders: product_orders
CREATE TABLE product_orders
(
  product_id INT NOT NULL,
  order_id   INT NOT NULL,

  FOREIGN KEY (product_id) REFERENCES products (id),
  FOREIGN KEY (order_id) REFERENCES orders (id)

);

-- Insert data

INSERT INTO users
VALUES (1, 'admin', '$2a$10$CLqxLnm6Brrs39Qae2vOs.cU8BW9/h2f3szZAG4ZzbsUUkdu3r3Z2', 'admin', 'admin', 'admin@email.com',
        'admin_address', 7788);

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
VALUES (1, NULL, 1, 1, 'first notebook model', 100, 'this is notebook');
INSERT INTO products
VALUES (2, NULL, 2, 2, 'first smartphone model', 100, 'this is smartphone');
INSERT INTO products
VALUES (3, NULL, 3, 3, 'first tablet model', 100, 'this is tablet');

INSERT INTO status
VALUES (1, 'accepted');
INSERT INTO status
VALUES (2, 'processing');
INSERT INTO status
VALUES (3, 'canceled');
INSERT INTO status
VALUES (4, 'filling');