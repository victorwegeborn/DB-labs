-- Population script for Movies in db


INSERT INTO media (title, type, year) VALUES ('Inception', 'Movie', '2010');
CALL add_people_to_media(LAST_INSERT_ID(), '
[
	{
		"first_name": "Christopher",
        "last_name": "Nolan",
        "role": "Director"
    },
    {
		"first_name": "Leonardo",
        "last_name": "DiCaprio",
        "role": "Actor"
    },
    {
		"first_name": "Joseph",
        "last_name": "Gordon-Levitt",
        "role": "Actor"
    },
    {
		"first_name": "Ellen",
        "last_name": "Page",
        "role": "Actor"
    },
    {
		"first_name": "Tom",
        "last_name": "Hardy",
        "role": "Actor"
    },
    {
		"first_name": "Marion",
        "last_name": "Cotillard",
        "role": "Actor"
    },
    {
		"first_name": "Michael",
        "last_name": "Caine",
        "role": "Actor"
    },
    {
		"first_name": "Cillian",
        "last_name": "Murphy",
        "role": "Actor"
    }
]	
');

INSERT INTO media (title, type, year) VALUES ('Interstellar', 'Movie', '2014');
CALL add_people_to_media(LAST_INSERT_ID(), '
[
	{
		"first_name": "Christopher",
        "last_name": "Nolan",
        "role": "Director"
    },
    {
		"first_name": "Matthew",
        "last_name": "McConaughey",
        "role": "Actor"
    },
    {
		"first_name": "John",
        "last_name": "Lithgow",
        "role": "Actor"
    },
    {
		"first_name": "Anne",
        "last_name": "Hathaway",
        "role": "Actor"
    },
    {
		"first_name": "Michael",
        "last_name": "Caine",
        "role": "Actor"
    },
    {
		"first_name": "Matt",
        "last_name": "Damon",
        "role": "Actor"
    },
    {
		"first_name": "Ellen",
        "last_name": "Burstyn",
        "role": "Actor"
    }
]	
');


INSERT INTO media (title, type, year) VALUES ('The Wolf of Wall Street', 'Movie', '2013');
CALL add_people_to_media(LAST_INSERT_ID(), '
[
	{
		"first_name": "Martin",
        "last_name": "Scorsese",
        "role": "Director"
    },
    {
		"first_name": "Leonardo",
        "last_name": "DiCaprio",
        "role": "Actor"
    },
    {
		"first_name": "Jonah",
        "last_name": "Hill",
        "role": "Actor"
    },
    {
		"first_name": "Margot",
        "last_name": "Robbie",
        "role": "Actor"
    },
    {
		"first_name": "Matthew",
        "last_name": "McConaughey",
        "role": "Actor"
    },
    {
		"first_name": "Rob",
        "last_name": "Reiner",
        "role": "Actor"
    },
    {
		"first_name": "Kyle",
        "last_name": "Chandler",
        "role": "Actor"
    }
]	
');


INSERT INTO media (title, type, year) VALUES ('The Revenant', 'Movie', '2015');
CALL add_people_to_media(LAST_INSERT_ID(), '
[
	{
		"first_name": "Alejandro",
        "last_name": "G. Iñárritu",
        "role": "Director"
    },
    {
		"first_name": "Tom",
        "last_name": "Hardy",
        "role": "Actor"
    },
    {
		"first_name": "Domhnall",
        "last_name": "Gleeson",
        "role": "Actor"
    },
    {
		"first_name": "Will",
        "last_name": "Poulter",
        "role": "Actor"
    },
    {
		"first_name": "Paul",
        "last_name": "Anderson",
        "role": "Actor"
    },
    {
		"first_name": "Fabrice",
        "last_name": "Adde",
        "role": "Actor"
    }
]	
');


INSERT INTO media (title, type, year) VALUES ('Shutter Island', 'Movie', '2010');
CALL add_people_to_media(LAST_INSERT_ID(), '
[
	{
		"first_name": "Martin",
        "last_name": "Scorsese",
        "role": "Director"
    },
    {
		"first_name": "Leonardo",
        "last_name": "DiCaprio",
        "role": "Actor"
    },
    {
		"first_name": "Mark",
        "last_name": "Ruffalo",
        "role": "Actor"
    },
    {
		"first_name": "Ben",
        "last_name": "Kingsley",
        "role": "Actor"
    },
    {
		"first_name": "Max",
        "last_name": "von Sydow",
        "role": "Actor"
    },
    {
		"first_name": "Michelle",
        "last_name": "Williams",
        "role": "Actor"
    }
]	
');