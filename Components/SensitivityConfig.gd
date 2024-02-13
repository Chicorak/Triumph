extends Node

var sens: float
var save_file = FileAccess.open("user://sens.dat", FileAccess.READ_WRITE)


func _ready():
	if FileAccess.file_exists("user://sens.dat"):
		sens = load_file()
		print("set sens = " + str(sens))
	else:
		save(sens)
		print("created file, sens = " + str(sens))
		
func save(_sens: float):
	var file = FileAccess.open("user://sens.dat", FileAccess.WRITE)
	file.store_float(_sens)
	sens = _sens
	print("set sens = " + str(sens))

func load_file():
	var file = FileAccess.open("user://sens.dat", FileAccess.READ)
	var content = file.get_float()
	return content
