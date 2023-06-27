create table if not exists genre (
id SERIAL primary key,
name VARCHAR(60) unique not null
);

create table if not exists songwriter (
	id SERIAL primary key,
	name VARCHAR(60) not null
);

create table if not exists genre_songwriter (
	genre_id INTEGER references genre(id),
	songwriter_id INTEGER references songwriter(id),
	constraint pk primary key (genre_id,
songwriter_id)
);

create table if not exists album (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	year INTEGER check(year>1900)
);

create table if not exists songwriter_album (
	songwriter_id INTEGER references songwriter(id),
	album_id INTEGER references album(id),
	constraint sa primary key (songwriter_id,
album_id)
);

create table if not exists track (
	id SERIAL primary key,
	album_id INTEGER not null references album(id),
	name VARCHAR(60) not null,
	time INTEGER not null
	);

create table if not exists collection (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	year INTEGER check(year>1900)
);

create table if not exists collection_track (
	collection_id INTEGER not null references collection(id),
	track_id INTEGER not null references track(id)
);

