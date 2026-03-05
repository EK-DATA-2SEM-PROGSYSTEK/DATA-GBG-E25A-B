
USE movie_catalog;

-- Hard reset for convenience 
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE video;
TRUNCATE TABLE user_review;
TRUNCATE TABLE didyouknow;
TRUNCATE TABLE movie_person;
TRUNCATE TABLE movie_genre;
TRUNCATE TABLE movie_interest;
TRUNCATE TABLE rating;
TRUNCATE TABLE movie;
TRUNCATE TABLE person;
TRUNCATE TABLE genre;
TRUNCATE TABLE interest;
TRUNCATE TABLE role_type;
TRUNCATE TABLE didyouknow_type;

SET FOREIGN_KEY_CHECKS = 1;

START TRANSACTION;

-- Lookup tables
INSERT INTO genre (genre_id, genre_name) VALUES
(1,'Drama'),
(2,'Crime'),
(3,'Action'),
(4,'Adventure'),
(5,'Sci-Fi'),
(6,'Fantasy'),
(7,'Romance'),
(8,'Comedy'),
(9,'Animation'),
(10,'Thriller'),
(11,'Horror'),
(12,'Biography');

INSERT INTO interest (interest_id, interest_name) VALUES
(1,'Award winner'),
(2,'Based on a book'),
(3,'Based on true events'),
(4,'Cult classic'),
(5,'Family friendly'),
(6,'Mind-bender'),
(7,'Epic saga'),
(8,'Heist'),
(9,'Superhero'),
(10,'Time travel');

INSERT INTO role_type (role_type_id, role_type_name) VALUES
(1,'Director'),
(2,'Actor'),
(3,'Writer'),
(4,'Producer');

INSERT INTO didyouknow_type (dyk_type_id, dyk_type_name) VALUES
(1,'Trivia'),
(2,'Goof'),
(3,'Behind the scenes');

-- People (core + additional cast)
INSERT INTO person (person_id, person_name, roles, bio, date_of_birth) VALUES
(1,'Christopher Nolan','Director,Writer','Known for large-scale, puzzle-box narratives and practical filmmaking.','1970-07-30'),
(2,'Leonardo DiCaprio','Actor','Actor known for intense dramatic roles across genres.','1974-11-11'),
(3,'Joseph Gordon-Levitt','Actor','Actor with roles in indie films and big studio productions.','1981-02-17'),
(4,'Quentin Tarantino','Director,Writer','Director celebrated for dialogue-driven crime stories and genre homage.','1963-03-27'),
(5,'John Travolta','Actor','Actor known for iconic roles spanning decades.','1954-02-18'),
(6,'Samuel L. Jackson','Actor','Actor known for commanding performances and memorable lines.','1948-12-21'),
(7,'Frank Darabont','Director,Writer','Director associated with acclaimed prison and redemption dramas.','1959-01-28'),
(8,'Tim Robbins','Actor','Actor known for thoughtful dramatic performances.','1958-10-16'),
(9,'Morgan Freeman','Actor','Actor known for distinctive voice and steady screen presence.','1937-06-01'),
(10,'Francis Ford Coppola','Director,Writer','Director known for landmark American crime epics.','1939-04-07'),
(11,'Marlon Brando','Actor','Influential actor associated with classic cinema.','1924-04-03'),
(12,'Al Pacino','Actor','Actor known for intense dramatic portrayals.','1940-04-25'),
(13,'Peter Jackson','Director,Writer','Director known for large-scale fantasy filmmaking.','1961-10-31'),
(14,'Elijah Wood','Actor','Actor known for fantasy and independent films.','1981-01-28'),
(15,'Ian McKellen','Actor','Actor known for stage and screen roles.','1939-05-25'),
(16,'Lana Wachowski','Director,Writer','Filmmaker known for science fiction action.','1965-06-21'),
(17,'Keanu Reeves','Actor','Actor known for action and science fiction roles.','1964-09-02'),
(18,'Carrie-Anne Moss','Actor','Actor known for action roles and television work.','1967-08-21'),
(19,'David Fincher','Director','Director known for meticulous thrillers and dark dramas.','1962-08-28'),
(20,'Brad Pitt','Actor','Actor known for versatile roles in drama and action.','1963-12-18'),
(21,'Edward Norton','Actor','Actor known for intense performances.','1969-08-18'),
(22,'Ridley Scott','Director','Director known for sci-fi and historical epics.','1937-11-30'),
(23,'Russell Crowe','Actor','Actor known for dramatic leading roles.','1964-04-07'),
(24,'Joaquin Phoenix','Actor','Actor known for transformative roles.','1974-10-28'),
(25,'Bong Joon-ho','Director,Writer','Director known for social satire and genre blending.','1969-09-14'),
(26,'Song Kang-ho','Actor','Actor known for acclaimed Korean cinema roles.','1967-01-17'),
(27,'Greta Gerwig','Director,Writer','Director known for character-driven comedy-dramas.','1983-08-04'),
(28,'Saoirse Ronan','Actor','Actor known for period dramas and contemporary roles.','1994-04-12'),
(29,'Steven Spielberg','Director,Producer','Director associated with blockbuster adventure and drama.','1946-12-18'),
(30,'Harrison Ford','Actor','Actor known for adventure and sci-fi franchises.','1942-07-13'),
(31,'George Lucas','Writer,Producer','Creator associated with blockbuster adventure storytelling.','1944-05-14'),
(32,'James Cameron','Director,Writer','Director known for large-scale action and sci-fi filmmaking.','1954-08-16'),
(33,'Kate Winslet','Actor','Actor known for dramatic roles and period pieces.','1975-10-05'),
(34,'Denis Villeneuve','Director','Director known for atmospheric science fiction and thrillers.','1967-10-03'),
(35,'Amy Adams','Actor','Actor known for drama and sci-fi roles.','1974-08-20'),
(36,'Ryan Gosling','Actor','Actor known for drama and action roles.','1980-11-12'),
(37,'Damien Chazelle','Director,Writer','Director known for music-centered dramas.','1985-01-19'),
(38,'Emma Stone','Actor','Actor known for comedy-drama performances.','1988-11-06'),
(39,'Jordan Peele','Director,Writer','Director known for modern horror with social commentary.','1979-02-21'),
(40,'Daniel Kaluuya','Actor','Actor known for drama and thriller roles.','1989-02-24'),
(41,'Tom Hardy','Actor','Actor known for intense supporting and leading roles.','1977-09-15'),
(42,'Elliot Page','Actor','Actor known for dramatic and genre roles.','1987-02-21'),
(43,'Uma Thurman','Actor','Actor known for iconic 1990s roles.','1970-04-29'),
(44,'Bruce Willis','Actor','Actor known for action and drama films.','1955-03-19'),
(45,'Bob Gunton','Actor','Character actor known for authority roles.','1945-11-15'),
(46,'James Caan','Actor','Actor known for crime dramas.','1940-03-26'),
(47,'Sean Astin','Actor','Actor known for fantasy and adventure roles.','1971-02-25'),
(48,'Hugo Weaving','Actor','Actor known for sci-fi and fantasy villains.','1960-04-04'),
(49,'Helena Bonham Carter','Actor','Actor known for eccentric roles.','1966-05-26'),
(50,'Connie Nielsen','Actor','Actor known for historical dramas.','1965-07-03'),
(51,'Choi Woo-shik','Actor','Actor known for Korean cinema roles.','1990-03-26'),
(52,'Florence Pugh','Actor','Actor known for period and modern dramas.','1996-01-03'),
(53,'Karen Allen','Actor','Actor known for adventure films.','1951-10-05'),
(54,'Mark Hamill','Actor','Actor known for sci-fi roles.','1951-09-25'),
(55,'Billy Zane','Actor','Actor known for supporting antagonist roles.','1966-02-24'),
(56,'Jeremy Renner','Actor','Actor known for action and drama roles.','1971-01-07'),
(57,'Ana de Armas','Actor','Actor known for modern thrillers.','1988-04-30'),
(58,'John Legend','Actor','Performer appearing in musical films.','1978-12-28'),
(59,'Allison Williams','Actor','Actor known for thriller roles.','1988-04-13'),
(60,'Gary Oldman','Actor','Actor known for transformative roles.','1958-03-21');

-- Movies (20)
INSERT INTO movie (
  movie_id, movie_title, release_date, classification, runtime_mins, poster,
  description, storyline, tagline, budget_usd, gross_worldwide_usd
) VALUES
(1,'Inception','2010-07-16','PG-13',148,'https://example.com/posters/inception.jpg',
 'A specialist in covert extraction is offered a chance to erase his past by attempting the inverse: planting an idea.',
 'A team enters layered dreamscapes where time bends and reality becomes negotiable, racing a deadline set by the mind itself.',
 'Your mind is the scene of the crime.',160000000,836800000),
(2,'Pulp Fiction','1994-10-14','R',154,'https://example.com/posters/pulp-fiction.jpg',
 'Intersecting stories of criminals and chance encounters unfold over a chaotic weekend.',
 'A box, a briefcase, a comeback, and a series of bad decisions collide into a crime mosaic told out of order.',
 'Stories don’t stay in one piece.',8000000,213900000),
(3,'The Shawshank Redemption','1994-09-23','R',142,'https://example.com/posters/shawshank.jpg',
 'A banker is sentenced to prison and slowly builds a life through friendship and quiet determination.',
 'Over decades behind bars, resilience and small acts of agency become a long game against an unforgiving system.',
 'Hope can be a stubborn thing.',25000000,73300000),
(4,'The Godfather','1972-03-24','R',175,'https://example.com/posters/godfather.jpg',
 'A family business built on loyalty and fear passes from father to reluctant son.',
 'As pressures mount, a successor learns that power is a language—spoken fluently only at a cost.',
 'Power has a price.',6000000,250000000),
(5,'The Lord of the Rings: The Fellowship of the Ring','2001-12-19','PG-13',178,'https://example.com/posters/lotr-fellowship.jpg',
 'A young hobbit inherits a dangerous ring and leaves home with allies of many kinds.',
 'A fragile fellowship crosses hostile lands, hunted by shadows, while the burden of a single object tests every bond.',
 'One journey begins.',93000000,897700000),
(6,'The Matrix','1999-03-31','R',136,'https://example.com/posters/matrix.jpg',
 'A hacker discovers the world is not what it seems and chooses to fight for the truth.',
 'Reality fractures as a reluctant hero learns the rules can be rewritten—if he’s willing to pay the consequence.',
 'Reality is negotiable.',63000000,466000000),
(7,'Fight Club','1999-10-15','R',139,'https://example.com/posters/fight-club.jpg',
 'An insomniac office worker forms an underground club that spirals into something larger.',
 'What begins as catharsis becomes ideology, and identity becomes the battleground no one sees coming.',
 'Control is an illusion.',63000000,101200000),
(8,'Gladiator','2000-05-05','R',155,'https://example.com/posters/gladiator.jpg',
 'A betrayed general is forced into the arena and seeks justice in front of an empire.',
 'Thrown from command to captivity, one man turns spectacle into reckoning, forcing Rome to watch what it created.',
 'Vengeance becomes legend.',103000000,460500000),
(9,'Parasite','2019-11-08','R',132,'https://example.com/posters/parasite.jpg',
 'A struggling family infiltrates a wealthy household through clever reinvention.',
 'Small deceptions stack into a precarious new life—until a hidden truth turns class tension into catastrophe.',
 'The line between upstairs and downstairs breaks.',11400000,258800000),
(10,'Little Women','2019-12-25','PG',135,'https://example.com/posters/little-women.jpg',
 'Four sisters navigate love, ambition, and family obligations during a changing era.',
 'As dreams diverge and hardships press in, sisterhood becomes both anchor and argument in the search for a life well-lived.',
 'Growing up is an art.',40000000,218900000),
(11,'Raiders of the Lost Ark','1981-06-12','PG',115,'https://example.com/posters/raiders.jpg',
 'An archaeologist races rivals to recover an ancient artifact with dangerous implications.',
 'Puzzles, traps, and moral compromises trail a quest where history is a weapon and belief is the fuse.',
 'Fortune favors the bold.',20000000,389900000),
(12,'Star Wars: Episode IV - A New Hope','1977-05-25','PG',121,'https://example.com/posters/star-wars-iv.jpg',
 'A farm boy joins rebels against an empire after crossing paths with a mysterious mentor.',
 'A rescue mission becomes a rebellion’s spark, and a novice learns that courage can be trained—like a skill.',
 'A galaxy learns to hope.',11000000,775400000),
(13,'Titanic','1997-12-19','PG-13',195,'https://example.com/posters/titanic.jpg',
 'Two strangers meet aboard an ill-fated voyage and fall in love under strict social rules.',
 'A brief romance unfolds against a clock no one believes, until the sea demands its due and choices become irreversible.',
 'Love doesn’t float—people do.',200000000,2264000000),
(14,'Arrival','2016-11-11','PG-13',116,'https://example.com/posters/arrival.jpg',
 'A linguist is recruited to communicate with visitors whose language reshapes perception.',
 'As global tensions rise, decoding meaning becomes a race; understanding the message also rewires the messenger.',
 'Meaning changes everything.',47000000,203400000),
(15,'Blade Runner 2049','2017-10-06','R',164,'https://example.com/posters/br2049.jpg',
 'A replicant officer uncovers a secret that could destabilize society’s fragile order.',
 'Clues lead through decaying megacities and abandoned dreams, pushing a manufactured life toward a very human question.',
 'What does it mean to be real?',150000000,267500000),
(16,'La La Land','2016-12-09','PG-13',128,'https://example.com/posters/la-la-land.jpg',
 'Two artists fall in love while chasing careers that pull them in different directions.',
 'Jazz clubs, auditions, and compromise turn romance into a negotiation between dream and daily life.',
 'Dreams cost something.',30000000,446100000),
(17,'Get Out','2017-02-24','R',104,'https://example.com/posters/get-out.jpg',
 'A weekend visit to meet the parents turns unsettling in ways no one warned about.',
 'Polite smiles and odd behavior hide a methodical plan, and survival depends on seeing the pattern early enough.',
 'The quietest rooms are the loudest.',4500000,255700000),
(18,'The Dark Knight','2008-07-18','PG-13',152,'https://example.com/posters/dark-knight.jpg',
 'A vigilante faces a criminal mastermind who turns the city’s rules against itself.',
 'As chaos escalates, every institution is tested; victory becomes indistinguishable from sacrifice.',
 'Chaos has a strategy.',185000000,1005000000),
(19,'Interstellar','2014-11-07','PG-13',169,'https://example.com/posters/interstellar.jpg',
 'A team travels beyond known space to secure humanity’s future as Earth declines.',
 'Distance, time dilation, and grief collide as explorers gamble on equations and faith to bridge impossible gaps.',
 'Mankind was born on Earth. It was never meant to die here.',165000000,701800000),
(20,'The Terminator','1984-10-26','R',107,'https://example.com/posters/terminator.jpg',
 'A relentless machine is sent back in time to change the future by eliminating one person.',
 'A chase across neon nights becomes a lesson in inevitability: the future is written by those who survive long enough to write it.',
 'The future is coming.',6400000,78300000);

-- Ratings (integers 1..10 for your CHECK constraint)
INSERT INTO rating (rating_id, movie_id, rating_value) VALUES
(1,1,9),(2,2,9),(3,3,9),(4,4,9),(5,5,9),
(6,6,9),(7,7,9),(8,8,9),(9,9,9),(10,10,8),
(11,11,9),(12,12,9),(13,13,8),(14,14,8),(15,15,8),
(16,16,8),(17,17,8),(18,18,9),(19,19,9),(20,20,8);

-- Movie interests (1..2 per movie)
INSERT INTO movie_interest (movie_id, interest_id) VALUES
(1,6),(1,10),
(2,4),(2,2),
(3,1),(3,4),
(4,1),(4,7),
(5,7),(5,5),
(6,6),(6,5),
(7,4),(7,6),
(8,1),
(9,1),
(10,2),
(11,4),
(12,7),
(13,7),
(14,6),(14,10),
(15,6),
(16,7),
(17,10),
(18,9),
(19,6),(19,7),
(20,10);

-- Movie genres (1..3 per movie)
INSERT INTO movie_genre (movie_id, genre_id) VALUES
(1,3),(1,5),(1,10),
(2,2),(2,8),
(3,1),
(4,1),(4,2),
(5,4),(5,6),
(6,3),(6,5),
(7,1),(7,10),
(8,1),(8,3),(8,4),
(9,1),(9,10),
(10,1),(10,7),
(11,3),(11,4),
(12,4),(12,6),
(13,1),(13,7),
(14,1),(14,5),
(15,5),(15,10),
(16,7),(16,8),
(17,10),
(18,3),(18,10),
(19,4),(19,5),
(20,3),(20,10);

-- Movie people: directors + 5–10 actors per movie (role_type_id = 2)
INSERT INTO movie_person (movie_id, person_id, role_type_id, character_name) VALUES
-- Inception
(1,1,1,NULL),(1,2,2,'Cobb'),(1,3,2,'Arthur'),(1,41,2,'Eames'),(1,42,2,'Ariadne'),

-- Pulp Fiction
(2,4,1,NULL),(2,5,2,'Vincent Vega'),(2,6,2,'Jules Winnfield'),(2,43,2,'Mia Wallace'),(2,44,2,'Butch Coolidge'),

-- The Shawshank Redemption
(3,7,1,NULL),(3,8,2,'Andy Dufresne'),(3,9,2,'Red'),(3,45,2,'Warden Norton'),

-- The Godfather
(4,10,1,NULL),(4,11,2,'Vito Corleone'),(4,12,2,'Michael Corleone'),(4,46,2,'Sonny Corleone'),

-- LOTR: Fellowship
(5,13,1,NULL),(5,14,2,'Frodo'),(5,15,2,'Gandalf'),(5,47,2,'Samwise'),(5,48,2,'Elrond'),

-- The Matrix
(6,16,1,NULL),(6,17,2,'Neo'),(6,18,2,'Trinity'),(6,48,2,'Agent Smith'),

-- Fight Club
(7,19,1,NULL),(7,20,2,'Tyler Durden'),(7,21,2,'The Narrator'),(7,49,2,'Marla Singer'),

-- Gladiator
(8,22,1,NULL),(8,23,2,'Maximus'),(8,24,2,'Commodus'),(8,50,2,'Lucilla'),

-- Parasite
(9,25,1,NULL),(9,26,2,NULL),(9,51,2,NULL),(9,24,2,NULL),

-- Little Women
(10,27,1,NULL),(10,28,2,'Jo'),(10,52,2,'Amy'),(10,35,2,NULL),

-- Raiders of the Lost Ark
(11,29,1,NULL),(11,30,2,'Indy'),(11,53,2,'Marion Ravenwood'),(11,9,2,NULL),

-- Star Wars: Episode IV
(12,29,4,NULL),(12,31,3,NULL),(12,30,2,'Han Solo'),(12,54,2,'Luke Skywalker'),

-- Titanic
(13,32,1,NULL),(13,2,2,NULL),(13,33,2,NULL),(13,55,2,'Cal Hockley'),

-- Arrival
(14,34,1,NULL),(14,35,2,NULL),(14,24,2,NULL),(14,56,2,NULL),

-- Blade Runner 2049
(15,34,1,NULL),(15,36,2,NULL),(15,15,2,NULL),(15,57,2,NULL),

-- La La Land
(16,37,1,NULL),(16,38,2,NULL),(16,36,2,NULL),(16,58,2,NULL),

-- Get Out
(17,39,1,NULL),(17,40,2,NULL),(17,38,2,NULL),(17,59,2,NULL),

-- The Dark Knight
(18,1,1,NULL),(18,12,2,NULL),(18,6,2,NULL),(18,60,2,'Commissioner Gordon'),

-- Interstellar
(19,1,1,NULL),(19,2,2,NULL),(19,23,2,NULL),(19,41,2,NULL),

-- The Terminator
(20,32,1,NULL),(20,6,2,NULL),(20,33,2,NULL),(20,44,2,NULL);

-- Did you know notes (original)
INSERT INTO didyouknow (didyouknow_id, didyouknow_note, movie_id, didyouknow_type_id) VALUES
(1,'Several hallway and gravity effects were achieved with rotating sets rather than digital simulation.',1,3),
(2,'The film’s chapters are arranged to emphasize thematic echoes, not chronology.',2,1),
(3,'Many prison scenes were staged to highlight routine and repetition over spectacle.',3,3),
(4,'The family’s internal rules are communicated as much through silence as through dialogue.',4,1),
(5,'Large-scale landscapes were blended with miniature work to keep the world tactile.',5,3),
(6,'Fight choreography favors readable motion over quick cutting to preserve spatial clarity.',6,3),
(7,'Lighting shifts subtly as the protagonist’s self-perception changes.',7,1),
(8,'Arena crowds were enhanced with careful compositing to extend real extras.',8,3),
(9,'Small props and set dressing are used to signal class differences before characters speak.',9,1),
(10,'Costume choices evolve with each sister’s ambition and constraints.',10,3);

-- User reviews (original)
INSERT INTO user_review (review_id, review_title, review_body, rating_value, movie_id) VALUES
(1,'A thrilling puzzle that still feels human',
 'Even with big set-pieces, the emotional through-line stays clear. The rules are dense but the momentum never drops.',9,1),
(2,'Sharp, funny, and oddly tender',
 'The structure is playful, but it’s the character moments that make it stick. Every scene feels like it has a point.',9,2),
(3,'Quietly devastating and deeply hopeful',
 'It earns its catharsis by building trust with the audience over time. The friendship at the center is the anchor.',10,3),
(4,'A masterclass in pressure and principle',
 'The moral dilemmas are as exciting as the action. The antagonist forces everyone to reveal who they really are.',9,18),
(5,'Balances spectacle with genuine emotion',
 'It manages to be entertaining without losing thematic depth. The pacing keeps things engaging from start to finish.',8,2);

-- Videos (placeholders)
INSERT INTO video (video_id, movie_id, video_title, video_location) VALUES
(1,1,'Trailer (placeholder)','https://example.com/videos/inception-trailer.mp4'),
(2,6,'Trailer (placeholder)','https://example.com/videos/matrix-trailer.mp4'),
(3,9,'Trailer (placeholder)','https://example.com/videos/parasite-trailer.mp4'),
(4,18,'Trailer (placeholder)','https://example.com/videos/dark-knight-trailer.mp4');

COMMIT;
