/*
	Add people as JSON array to media by ID.

	JSON-format:

	[
		{
			"first_name": "...",
			"last_name": "...",
			"role": "..."
		},
		.
		.
		.
	]


*/



DROP PROCEDURE IF EXISTS add_people_as_JSON_to_media_by_id;
DELIMITER $$
CREATE PROCEDURE add_people_to_media(
		param_media_id INT,
    param_people_obj JSON
)
BEGIN
	-- drop and create temporary table, which will be deleted automatically when session ends.
		DROP TABLE IF EXISTS tmp_table;
		CREATE TEMPORARY TABLE tmp_table AS (SELECT first_name, last_name, role FROM
       JSON_TABLE(param_people_obj,
         "$[*]"
         COLUMNS(
           rowid FOR ORDINALITY,
           first_name VARCHAR(45) PATH "$.first_name" NULL ON ERROR,
		   last_name  VARCHAR(45) PATH "$.last_name" NULL ON ERROR,
           role VARCHAR(45) PATH "$.role" NULL ON EMPTY
         )
       ) AS tt);


	-- insert people into people table from parsed jason
	INSERT INTO people (first_name, last_name)
    SELECT
		first_name,
        last_name
	FROM tmp_table t
    WHERE NOT EXISTS (
		SELECT
			p.first_name,
            p.last_name
		FROM people p
        WHERE t.first_name = p.first_name AND
			  t.last_name = p.last_name
	);

	-- insert crew connections based on the parsed json
    INSERT INTO crew (media_id, people_id, role)
    SELECT
		    param_media_id,
        p.people_id,
        t.role
		FROM people p
    	JOIN tmp_table t
				ON p.first_name = t.first_name AND p.last_name = t.last_name;
END $$
DELIMITER ;
