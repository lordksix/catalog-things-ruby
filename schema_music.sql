CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  label VARCHAR(255),
  genre_id INTEGER REFERENCES genres(id)
);

CREATE TABLE music_albums (
  id INTEGER PRIMARY KEY REFERENCES items(id),
  on_spotify BOOLEAN,
  release_year INTEGER,
  artist VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);
