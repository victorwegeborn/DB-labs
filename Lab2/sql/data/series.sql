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
');




INSERT INTO media (title, type, year) VALUES ('Chernobyl', 'Series', '2019');
SET @midx = LAST_INSERT_ID();

CALL add_people_to_media(@midx,
'
[
	{ "first_name": "Johan", 
	  "last_name": "Renck", 
      "role": "Director"
	},
	{ "first_name": "Jessie", 
	  "last_name": "Buckley", 
      "role": "Actor"
	},
	{ "first_name": "Jared", 
	  "last_name": "Harris", 
      "role": "Actor"
	},
	{ "first_name": "Stellan", 
	  "last_name":  "Skarsgard", 
      "role": "Actor"
	},
	{ "first_name": "Adam", 
      "last_name": "Nagaitis", 
      "role": "Actor"
	},
	{ "first_name": "Emily", 
      "last_name": "Watson", 
      "role": "Actor"
	},
	{ "first_name": "Paul", 
	  "last_name": "Ritter", 
      "role": "Actor"
	},
	{ "first_name": "Robert", 
	  "last_name": "Emms", 
      "role": "Actor"
	},
	{ "first_name": "Sam", 
	  "last_name": "Troughton", 
      "role": "Actor"
	},
	{ "first_name": "Karl", 
	  "last_name": "Davies", 
      "role": "Actor"
	},
	{ "first_name": "Laura", 
	  "last_name": "Elphinstone", 
      "role": "Actor"
	},
	{ "first_name": "Jan", 
	  "last_name": "Ricica", 
      "role": "Actor"
	},
	{ "first_name": "Alan", 
      "last_name": "Williams", 
      "role": "Actor"
	},
	{ "first_name": "Adrian", 
	  "last_name": "Rawlin", 
      "role": "Actor"
	},
    { "first_name": "Con OViktor", 
      "last_name": "Bryukhanov", 
      "role": "Actor"
	},
	{ "first_name": "Douggie", 
	  "last_name": "McMeekin", 
      "role": "Actor"
	},
	{ "first_name": "Nadia", 
      "last_name": "Clifford", 
      "role": "Actor"
	},
	{ "first_name": "David",
	  "last_name": "Dencik", 
      "role": "Actor"
	},
	{ "first_name": "Gerard", 
	  "last_name": "Kearns", 
      "role": "Actor"
	},
	{ "first_name": "Adam", 
      "last_name": "Lundgren", 
      "role": "Actor"
	},
	{ "first_name": "Mark", 
      "last_name": "Lewis", 
      "role": "Actor"
	},
	{ "first_name": "Michael", 
      "last_name": "Shaeffer", 
      "role": "Actor"
	},
	{ "first_name": "Jay", 
      "last_name": "Simpson", 
      "role": "Actor"
	},
	{ "first_name": "Jamie", 
      "last_name": "Sives", 
      "role": "Actor"
	},
	{ "first_name": "Ron", 
	  "last_name": "Cook", 
	  "role": "Actor"
	},
	{ "first_name": "Povilas", 
      "last_name": "Jatkevicius", 
      "role": "Actor"
	},
    { "first_name": "Joshua", 
      "last_name": "Leese", 
      "role": "Actor"
	},
    { "first_name": "Ross", 
	  "last_name": "Armstrong", 
      "role": "Actor"
	}
]
');

CALL add_episodes_to_season_by_media_id(@midx,
'
	[
		{
			"season": 1,
            "year": "2019",
            "episodes": [
							  { "title": "1:23:45", "number": 1 },
				{ "title": "Please Remain Calm", "number": 2 },
                { "title": "Open Wide, O Earth", "number": 3 },
                { "title": "The Happiness of All Mankind", "number": 4 },
                { "title": "Vichnaya Pamyat", "number": 5 }
            ]
        }
    ]
');
