CREATE DATABASE catalogue_of_things;

CREATE TABLE games(
  item_id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  multiṕlayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  CONSTRAINT fk_games_author FOREIGN KEY(id) REFERENCES authors(id)
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(50),
    color VARCHAR(50),
    PRIMARY KEY(id)
);
CREATE TABLE books(
    id INT GENERATED ALWAYS AS IDENTITY,
    publish_date DATE NOT NULL,
    archived BOOLEAN,
    cover_state VARCHAR(150),
    publisher VARCHAR(150),
    book_color VARCHAR(50),
    books_id INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_labels FOREIGN KEY(books_id) REFERENCES labels(id)
);

