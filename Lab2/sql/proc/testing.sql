-- Populate media with series


INSERT INTO media (title, type, year) VALUES ('Game of Thrones', 'Series', '2011');
SET @midx = LAST_INSERT_ID();

CALL add_people_to_media(@midx,
'
[
	{
		"first_name": "David",
        "last_name": "Benioff",
        "role": "Director"
    },
    {
		"first_name": "D.B.",
        "last_name": " Weiss",
        "role": "Director"
    },
    {
		"first_name": "Peter",
        "last_name": "Dinklage",
        "role": "Actor"
    },
    {
		"first_name": "Lena",
        "last_name": "Headey",
        "role": "Actor"
    },
    {
		"first_name": "Emilia",
        "last_name": "Clarke",
        "role": "Actor"
    },
    {
		"first_name": "Kit",
        "last_name": "Harington",
        "role": "Actor"
    },
    {
		"first_name": "Sophie",
        "last_name": "Turner",
        "role": "Actor"
    },
    {
		"first_name": "Maisie",
        "last_name": "Williams",
        "role": "Actor"
    },
    {
		"first_name": "Nikolaj",
        "last_name": "Coster-Waldau",
        "role": "Actor"
    },
    {
		"first_name": "Iain",
        "last_name": "Glen",
        "role": "Actor"
    },
    {
		"first_name": "John",
        "last_name": "Bradley",
        "role": "Actor"
    },
    {
		"first_name": "Alfie",
        "last_name": "Allen",
        "role": "Actor"
    },
    {
		"first_name": "Conleth",
        "last_name": "Hill",
        "role": "Actor"
    },
    {
		"first_name": "Liam",
        "last_name": "Cunningham",
        "role": "Actor"
    },
    {
		"first_name": "Gwendoline",
        "last_name": "Christie",
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
CALL add_episodes_to_season_by_media_id(@midx,
'
	[
		{
			"season": 1,
            "year": "2011",
            "episodes": [
				{ "title": "Winter Is Coming", "number": 1 },
                { "title": "The Kingsroad", "number": 2 },
                { "title": "Lord Snow", "number": 3 },
                { "title": "Cripples, Bastards, and Broken Things", "number": 4 },
                { "title": "The Wolf and the Lion", "number": 5 },
				{ "title": "A Golden Crown", "number": 6 },
				{ "title": "You Win or You Die", "number": 7 },
				{ "title": "The Pointy End", "number": 8 },
				{ "title": "Baelor", "number": 9 },
				{ "title": "Fire and Blood", "number": 10 }
            ] 
        },
        {
			"season": 2,
            "year": "2012",
            "episodes": [
				{ "title": "The North Remembers", "number": 1 },
                { "title": "The Night Lands", "number": 2 },
                { "title": "What Is Dead May Never Die", "number": 3 },
                { "title": "Garden of Bones", "number": 4 },
                { "title": "The Ghost of Harrenhaln", "number": 5 },
				{ "title": "The Old Gods and the New", "number": 6 },
				{ "title": "A Man Without Honore", "number": 7 },
				{ "title": "The Prince of Winterfell", "number": 8 },
				{ "title": "Blackwater", "number": 9 },
				{ "title": "Valar Morghulis", "number": 10 }
            ] 
        }
    ]
')

