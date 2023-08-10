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

CREATE TABLE music_albums (
  item_id INTEGER PRIMARY KEY,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  publish_date DATE NOT NULL,
  CONSTRAINT fk_music_genre  FOREIGN key (genre_id) REFERENCES genres(id)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
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


