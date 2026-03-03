DROP DATABASE IF EXISTS movie_catalog;
CREATE DATABASE movie_catalog
    DEFAULT CHARACTER SET utf8mb4;

USE movie_catalog;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS video;
DROP TABLE IF EXISTS user_review;
DROP TABLE IF EXISTS didyouknow;
DROP TABLE IF EXISTS didyouknow_type;
DROP TABLE IF EXISTS movie_genre;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS movie_person;
DROP TABLE IF EXISTS role_type;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS movie_interest;
DROP TABLE IF EXISTS interest;
DROP TABLE IF EXISTS rating;
DROP TABLE IF EXISTS movie;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    classification VARCHAR(50),
    runtime_mins INT,
    poster VARCHAR(500),
    description VARCHAR(1000),
    storyline VARCHAR(4000),
    tagline VARCHAR(255),
    budget_usd BIGINT UNSIGNED,
    gross_worldwide_usd BIGINT UNSIGNED,
    UNIQUE (movie_title, release_date)
);

CREATE TABLE rating (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    rating_value INT NOT NULL CHECK (rating_value BETWEEN 1 AND 10),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE
);

CREATE TABLE interest (
    interest_id INT AUTO_INCREMENT PRIMARY KEY,
    interest_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE movie_interest (
    movie_id INT NOT NULL,
    interest_id INT NOT NULL,
    PRIMARY KEY (movie_id, interest_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE,
    FOREIGN KEY (interest_id) REFERENCES interest (interest_id) ON DELETE RESTRICT
);

CREATE TABLE person (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    person_name VARCHAR(255) NOT NULL,
    roles VARCHAR(255),
    bio VARCHAR(2000),
    date_of_birth DATE
);

CREATE TABLE role_type (
    role_type_id INT AUTO_INCREMENT PRIMARY KEY,
    role_type_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE movie_person (
    movie_id INT NOT NULL,
    person_id INT NOT NULL,
    role_type_id INT NOT NULL,
    character_name VARCHAR(255),
    PRIMARY KEY (movie_id, person_id, role_type_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE,
    FOREIGN KEY (person_id) REFERENCES person (person_id) ON DELETE RESTRICT,
    FOREIGN KEY (role_type_id) REFERENCES role_type (role_type_id) ON DELETE RESTRICT
);

CREATE TABLE genre (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE movie_genre (
    movie_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (genre_id) ON DELETE RESTRICT
);

CREATE TABLE didyouknow_type (
    dyk_type_id INT AUTO_INCREMENT PRIMARY KEY,
    dyk_type_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE didyouknow (
    didyouknow_id INT AUTO_INCREMENT PRIMARY KEY,
    didyouknow_note VARCHAR(1000),
    movie_id INT NOT NULL,
    didyouknow_type_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE,
    FOREIGN KEY (didyouknow_type_id) REFERENCES didyouknow_type (dyk_type_id) ON DELETE RESTRICT
);

CREATE TABLE user_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    review_title VARCHAR(255),
    review_body VARCHAR(4000),
    rating_value INT NOT NULL CHECK (rating_value BETWEEN 1 AND 10),
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE
);

CREATE TABLE video (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT NOT NULL,
    video_title VARCHAR(255),
    video_location VARCHAR(500),
    FOREIGN KEY (movie_id) REFERENCES movie (movie_id) ON DELETE CASCADE
);
