-- Функція отримання жанрів гри за game_id.
-- Використовується для повернення набору назв жанрів, до яких належить гра.

CREATE OR REPLACE FUNCTION get_game_genres(game_id INT)
RETURNS SETOF VARCHAR(50)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
    SELECT genre.name
    FROM genre
    INNER JOIN game_genre ON genre.genre_id = game_genre.genre_id
    WHERE game_genre.game_id = get_game_genres.game_id;
END;
$$;
