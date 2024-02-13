extends Control


@onready var press = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/main_menu/start_button.grab_focus() # Replace with function body.
	$Panel/settings_menu/volume_slider.value = VolumeConfig.volume
	$Panel/settings_menu/sens_slider.value = SensitivityConfig.sens

func _on_start_button_pressed():
	SceneTransition.change_scene("res://scenes/train_map/train_world.tscn") # Replace with function body.
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	press.play()
	
func _on_options_button_pressed():
	$Panel/main_menu.hide()
	$Panel/settings_menu.show()
	press.play()
	
func _on_quit_button_pressed():
	press.play()
	await press.finished
	get_tree().quit() # Replace with function body.



func _on_back_button_pressed():
	$Panel/main_menu.show()
	$Panel/settings_menu.hide()
	press.play()


func _on_volume_slider_value_changed(value):
	VolumeConfig.save(value)
	VolumeConfig.update()
	press.play()


func _on_sens_slider_value_changed(value):
	SensitivityConfig.save(value)
	press.play()
