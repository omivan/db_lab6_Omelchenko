-- Процедура збільшує кількість користувачів гри(p_game_id) на вказану величину(users_increment)
CREATE OR REPLACE PROCEDURE update_game_info(p_game_id INT, users_increment INT)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    UPDATE game
    SET users_number = users_number + users_increment
    WHERE game_id = p_game_id;
END;
$$;

-- CALL update_game_info(101, 1);