DROP TABLE IF EXISTS bounty_properties;

CREATE TABLE bounty_properties (
id SERIAL2 PRIMARY KEY,
name VARCHAR(255),
species VARCHAR(255),
bounty_value INT2,
danger_level VARCHAR(255)
);


