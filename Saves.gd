extends Node

const SAVE_PATH = "user://saves.sav"

var level_completed = {
"level":0,
"character":""
}

func save_game():
	var save_game = File.new()
	save_game.open(SAVE_PATH, File.READ_WRITE)
	save_game.store_line(to_json(level_completed))
	save_game.close()
	

func load_game():
	var save_game = File.new()
	if not save_game.file_exists(SAVE_PATH):
		return # Error! No hay archivo que guardar
	save_game.open(SAVE_PATH, File.READ)
	level_completed = parse_json(save_game.get_line())
	save_game.close()
