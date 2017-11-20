DROP TABLE IF EXISTS animals;

CREATE TABLE animals (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  image TEXT

);

INSERT INTO animals (title , body, image) VALUES ('Lions' , 'This is a Lion', 'https://data.whicdn.com/images/230929611/superthumb.jpg');
INSERT INTO animals (title , body, image) VALUES ('Tigers' , 'This is a Tiger', 'http://makemypromotion.com/demos/courses/wp-content/uploads/2017/04/tiger1-300x250.jpg');
INSERT INTO animals (title , body, image) VALUES ('Bears' , 'This is a Bear', 'http://www.fun-facts.org.uk/images/bear.gif');
