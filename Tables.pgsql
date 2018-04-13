CREATE TABLE RATER(
    userID INTEGER UNIQUE PRIMARY KEY,
    email VARCHAR,
    name VARCHAR,
    type VARCHAR check(type = 'Food Critic' OR type = 'Blog' OR type = 'Online'), --Types of Raters (blog,online,foodCritic)
    joinDate DATE,
    reputation INTEGER DEFAULT 1 CHECK (reputation > 0 AND reputation <6) -- Num between 1 and  - DEFAULT 1
);

CREATE TABLE RESTAURANT(
    restaurantID INTEGER UNIQUE PRIMARY KEY,
    name VARCHAR,
    type VARCHAR , -- Type of cuisine (Italian, Indian, Middle Eastern...)
    url VARCHAR -- Webstie URL
);

CREATE TABLE RATING(
    ratingID INTEGER PRIMARY KEY,
    userID INTEGER REFERENCES RATER,
    date DATE,
    price INTEGER CHECK (price > 0 AND price <6),
    food INTEGER CHECK (food > 0 AND food <6),
    mood INTEGER CHECK (mood > 0 AND mood <6), 
    staff INTEGER CHECK (staff > 0 AND staff <6),
    comments VARCHAR,
    restaurantID INTEGER REFERENCES RESTAURANT
);

CREATE TABLE LOCATION(
    locationID INTEGER UNIQUE PRIMARY KEY,
    firstOpenDate DATE,
    managerName VARCHAR,
    phoneNumber VARCHAR,
    streetAddress VARCHAR,
    hoursOpen VARCHAR, -- Maybe use time instead??
    hoursClosed VARCHAR, -- ^^
    restaurantID INTEGER REFERENCES RESTAURANT
);

CREATE TABLE MENUITEM(
    itemID INTEGER UNIQUE PRIMARY KEY,
    name VARCHAR,
    type VARCHAR CHECK (type = 'food' OR type = 'beverage'), -- food or beverage
    category VARCHAR CHECK (category = 'starter' OR category = 'main' OR category = 'dessert'), -- (starter, main, dessert)
    description VARCHAR,
    price DECIMAL(2),
    restaurantID INTEGER REFERENCES RESTAURANT
);

CREATE TABLE RATINGITEM ( --All menu items should be selected from a list
    ratingItemID INTEGER UNIQUE PRIMARY KEY,
    userID INTEGER REFERENCES RATER,
    ratingID INTEGER REFERENCES RATING,
    itemID INTEGER REFERENCES MENUITEM,
    rating INTEGER check (rating >0 AND rating <6),
    comment VARCHAR
);