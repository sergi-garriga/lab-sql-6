use sakila;

-- In this activity we are going to do some database maintenance. 
-- In the current database we only have information on movies for 
-- the year 2006. Now we have received the film catalog for 2020 as 
-- well. For this new data we will create another table and bulk insert
-- all the data there. Code to create a new table has been provided below.

drop table if exists films_2020;
CREATE TABLE films_2020 (
  film_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  description text,
  release_year year(4) DEFAULT NULL,
  language_id tinyint(3) unsigned NOT NULL,
  original_language_id tinyint(3) unsigned DEFAULT NULL,
  rental_duration int(6),
  rental_rate decimal(4,2),
  length smallint(5) unsigned DEFAULT NULL,
  replacement_cost decimal(5,2) DEFAULT NULL,
  rating enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (film_id),
  CONSTRAINT FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;



-- Add the new films to the database.
			-- I used the Import Wizard, because syntax like: 
            -- COPY table_name FROM '/path/step/file_name' DELIMITER ' ';
            -- was not working

select * from films_2020;


-- Update information on rental_duration, rental_rate, and replacement_cost.
update films_2020
set rental_duration = 3, rental_rate = 2.99, replacement_cost = 8.99;







