extends Node

var volume: float
var save_file = FileAccess.open("user://volume.dat", FileAccess.READ_WRITE)
@export var audio_bus_name := "Master"

@onready var _bus := AudioServer.get_bus_index(audio_bus_name)

func _ready():
	if FileAccess.file_exists("user://volume.dat"):
		volume = load_file()
		AudioServer.set_bus_volume_db(_bus, linear_to_db(volume))
		print("set volume = " + str(volume))
	else:
		save(linear_to_db(AudioServer.get_bus_volume_db(_bus)))
		print("created file, volume = " + str(volume))
		
func save(_volume: float):
	var file = FileAccess.open("user://volume.dat", FileAccess.WRITE)
	file.store_float(_volume)
	volume = _volume
	print("set volume = " + str(volume))

func load_file():
	var file = FileAccess.open("user://volume.dat", FileAccess.READ)
	var content = file.get_float()
	return content
