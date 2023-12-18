-- Створення таблиці game_log для логування змін у таблиці game.
-- Створення функції та тригера для автоматичного додавання записів у game_log при модифікації гри.

DROP TABLE IF EXISTS game_log;
CREATE TABLE game_log (
    log_id SERIAL PRIMARY KEY,
    game_id INT,
    modification_time TIMESTAMP);


CREATE OR REPLACE FUNCTION log_game_modifications()
RETURNS TRIGGER
LANGUAGE 'plpgsql'
AS $$
BEGIN
    
    INSERT INTO game_log (game_id, modification_time)
    VALUES (NEW.game_id, CURRENT_TIMESTAMP);

    RETURN NEW;
END;
$$;


CREATE TRIGGER log_game_modifications_trigger
AFTER UPDATE ON game
FOR EACH ROW
EXECUTE FUNCTION log_game_modifications();