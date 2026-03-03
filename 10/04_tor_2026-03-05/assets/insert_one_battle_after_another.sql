START TRANSACTION;

-- 1) MOVIE
INSERT INTO movie (
  movie_title,
  release_date,
  classification,
  runtime_mins,
  poster,
  description,
  storyline,
  tagline,
  budget_usd,
  gross_worldwide_usd
) VALUES (
  'One Battle After Another',
  '2025-09-26',
  'R',
  150,
  'https://example.com/posters/one-battle-after-another.jpg',
  'A contemporary drama exploring political unrest, personal loyalty, and shifting alliances.',
  'When long-standing friendships collide with escalating public tensions, a small group is forced to confront the cost of conviction and compromise.',
  'Nothing ends. It only escalates.',
  120000000,
  0
);

SET @movie_id := LAST_INSERT_ID();

-- 2) RATING
INSERT INTO rating (movie_id, rating_value)
VALUES (@movie_id, 8);

-- 3) GENRE (insert-if-missing)
INSERT INTO genre (genre_name)
SELECT 'Drama'
WHERE NOT EXISTS (SELECT 1 FROM genre WHERE genre_name = 'Drama');

-- 4) MOVIE_GENRE
INSERT INTO movie_genre (movie_id, genre_id)
SELECT @movie_id, g.genre_id
FROM genre g
WHERE g.genre_name = 'Drama';

-- 5) INTERESTS (insert-if-missing)
INSERT INTO interest (interest_name)
SELECT 'Political'
WHERE NOT EXISTS (SELECT 1 FROM interest WHERE interest_name = 'Political');

INSERT INTO interest (interest_name)
SELECT 'Character-driven'
WHERE NOT EXISTS (SELECT 1 FROM interest WHERE interest_name = 'Character-driven');

-- 6) MOVIE_INTEREST
INSERT INTO movie_interest (movie_id, interest_id)
SELECT @movie_id, i.interest_id
FROM interest i
WHERE i.interest_name IN ('Political', 'Character-driven');

-- 7) ROLE TYPES (insert-if-missing)
INSERT INTO role_type (role_type_name)
SELECT 'Director'
WHERE NOT EXISTS (SELECT 1 FROM role_type WHERE role_type_name = 'Director');

INSERT INTO role_type (role_type_name)
SELECT 'Actor'
WHERE NOT EXISTS (SELECT 1 FROM role_type WHERE role_type_name = 'Actor');

SELECT role_type_id INTO @role_director_id
FROM role_type
WHERE role_type_name = 'Director'
LIMIT 1;

SELECT role_type_id INTO @role_actor_id
FROM role_type
WHERE role_type_name = 'Actor'
LIMIT 1;

-- 8) PEOPLE

-- Director
INSERT INTO person (person_name, roles, bio, date_of_birth)
VALUES (
  'Paul Thomas Anderson',
  'Director,Writer',
  'Filmmaker known for character-focused dramas and ensemble storytelling.',
  '1970-06-26'
);
SET @pta_id := LAST_INSERT_ID();

-- Lead Actor
INSERT INTO person (person_name, roles, bio, date_of_birth)
VALUES (
  'Leonardo DiCaprio',
  'Actor',
  'Actor known for dramatic leading roles across a wide range of genres.',
  '1974-11-11'
);
SET @leo_id := LAST_INSERT_ID();

-- 9) MOVIE_PERSON
INSERT INTO movie_person (
  movie_id,
  person_id,
  role_type_id,
  character_name
) VALUES
(@movie_id, @pta_id, @role_director_id, NULL),
(@movie_id, @leo_id, @role_actor_id, 'TBD');

-- 10) DIDYOUKNOW TYPE (insert-if-missing)
INSERT INTO didyouknow_type (dyk_type_name)
SELECT 'Trivia'
WHERE NOT EXISTS (
  SELECT 1 FROM didyouknow_type WHERE dyk_type_name = 'Trivia'
);

-- 11) DIDYOUKNOW ENTRY
INSERT INTO didyouknow (
  didyouknow_note,
  movie_id,
  didyouknow_type_id
)
SELECT
  'The production marked another collaboration between the director and a major studio on a large-scale original screenplay.',
  @movie_id,
  d.dyk_type_id
FROM didyouknow_type d
WHERE d.dyk_type_name = 'Trivia'
LIMIT 1;

-- 12) VIDEO
INSERT INTO video (
  movie_id,
  video_title,
  video_location
) VALUES (
  @movie_id,
  'Teaser Trailer (placeholder)',
  'https://example.com/videos/one-battle-after-another-teaser.mp4'
);

-- 13) USER REVIEW
INSERT INTO user_review (
  review_title,
  review_body,
  rating_value,
  movie_id
) VALUES (
  'Ambitious and tense',
  'A layered political drama that balances large-scale themes with intimate character moments. Strong performances anchor the escalating narrative.',
  8,
  @movie_id
);

COMMIT;