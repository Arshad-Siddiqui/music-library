TRUNCATE TABLE albums, artists RESTART IDENTITY;

INSERT INTO artists (id, name, genre) VALUES(1, 'Kanye West', 'Rap');
INSERT INTO artists (id, name, genre) VALUES(2, 'Taylor Swift', 'Pop');
INSERT INTO artists (id, name, genre) VALUES(3, 'Dua Lipa', 'pop');
INSERT INTO artists (id, name, genre) VALUES(4, 'Phineas and the Ferbets', 'Pop');
INSERT INTO artists (id, name, genre) VALUES(5, 'Goofy Goobers', 'Rock');


INSERT INTO albums (id, title, release_year, artist_id) VALUES(1, 'Donda', 2021, 1);
INSERT INTO albums (id, title, release_year, artist_id) VALUES(2, 'Midnights', 2022, 2);
INSERT INTO albums (id, title, release_year, artist_id) VALUES(3, 'Future Nostalgia', 2020, 3);
INSERT INTO albums (id, title, release_year, artist_id) VALUES(4, 'Folklore', 2020, 2);




