CREATE DATABASE catalogue_of_things;

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  genre_id INTEGER REFERENCES genres(id),
  author_id INTEGER REFERENCES authors(id),
  label_id INTEGER REFERENCES label(id),
  archived BOOLEAN,
  publish_date DATE,
  archived BOOLEAN
);

CREATE TABLE games(
  item_id SERIAL PRIMARY KEY,
  multiṕlayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  CONSTRAINT fk_games_items FOREIGN KEY (item_id) REFERENCES items(id),
  CONSTRAINT fk_games_author FOREIGN KEY(id) REFERENCES authors(id)
);

CREATE TABLE music_albums (
  item_id INTEGER PRIMARY KEY,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  CONSTRAINT fk_music_items FOREIGN KEY (item_id) REFERENCES items(id)
  CONSTRAINT fk_music_genre  FOREIGN key (genre_id) REFERENCES genres(id)
);

CREATE TABLE books (
  item_id INTEGER PRIMARY KEY,
  cover_state VARCHAR(50),
  publisher VARCHAR(50),
  CONSTRAINT fk_books_items FOREIGN KEY (item_id) REFERENCES items(id)
  CONSTRAINT fk_books_label FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE label (
  id SERIAL PRIMARY KEY,
  color VARCHAR(50),
  title VARCHAR(50),
);
