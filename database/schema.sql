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

CREATE TABLE music_albums (
  item_id INTEGER PRIMARY KEY,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  CONSTRAINT fk_music_items FOREIGN KEY (item_id) REFERENCES items(id)
  CONSTRAINT fk_music_genre  FOREIGN key (genre_id) REFERENCES genres(id)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
