/* Procedure for adding episodes to media and connecting them by season.

JSON format

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
'
*/

DROP PROCEDURE IF EXISTS add_episodes_to_season_by_media_id;
DELIMITER $$
CREATE PROCEDURE add_episodes_to_season_by_media_id(
	param_media_id INT,
    param_episode_obj JSON
)
BEGIN
	DROP TABLE IF EXISTS tmp_table;
	CREATE TEMPORARY TABLE tmp_table AS (SELECT * FROM
       JSON_TABLE(param_episode_obj,
         "$[*]"
         COLUMNS(
			season_number INT PATH "$.season",
			year  INT PATH "$.year",
			NESTED PATH "$.episodes[*]" COLUMNS(
				title VARCHAR(45) PATH "$.title",
                episode_number INT PATH "$.number"
			)
         )
       ) AS tt);


	INSERT INTO episodes (title, number)
	SELECT
		title,
		episode_number
	FROM
		tmp_table;

	SET @first_id = LAST_INSERT_ID();

	INSERT INTO seasons (media_id, episode_id, number, year)
	SELECT
		param_media_id,
		e.episode_id,
		t.season_number,
		t.year
	FROM episodes e
	JOIN tmp_table t ON e.title = t.title
	WHERE e.episode_id >= @first_id;
END $$
DELIMITER ;
