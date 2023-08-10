CREATE DATABASE catalogue_of_things;

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  author_id INTEGER REFERENCES authors(id),
  archived BOOLEAN,
  publish_date DATE,
);

CREATE TABLE games(
  item_id SERIAL PRIMARY KEY,
  multiṕlayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  CONSTRAINT fk_games_items FOREIGN KEY (item_id) REFERENCES items(id),
  CONSTRAINT fk_games_author FOREIGN KEY(id) REFERENCES authors(id)
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

