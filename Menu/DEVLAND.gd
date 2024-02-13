extends Node2D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
func _on_train_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	SceneTransition.change_scene("res://scenes/train_map/train_world.tscn")


func _on_church_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	SceneTransition.change_scene("res://scenes/church_map/church.tscn")
