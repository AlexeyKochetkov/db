CREATE TABLE IF NOT EXISTS genre (
id SERIAL PRIMARY KEY,
name VARCHAR(60) not NULL
);

CREATE TABLE IF NOT EXISTS songwriter (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) not NULL
);

CREATE TABLE IF NOT EXISTS genre_songwriter (
	genre_id INTEGER REFERENCES genre(id),
	songwriter_id INTEGER REFERENCES songwriter(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, songwriter_id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) not null,
	year INTEGER
);

CREATE TABLE IF NOT EXISTS songwriter_album (
	songwriter_id INTEGER REFERENCES songwriter(id),
	album_id INTEGER REFERENCES album(id),
	CONSTRAINT sa PRIMARY KEY (songwriter_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	name VARCHAR(60) not null,
	time NUMERIC
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES track(id),
	album_id INTEGER NOT NULL REFERENCES album(id),
	name VARCHAR(60) not null,
	year INTEGER
);
