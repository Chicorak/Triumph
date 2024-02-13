extends Node2D
@onready var press = $AudioStreamPlayer

func _process(delta):
	if get_tree().paused == true:
		show()
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$Panel/Pause/Resume.grab_focus() 
	$Panel/Options/VolumeSlider.value = VolumeConfig.volume
	$Panel/Options/SenSlider.value = SensitivityConfig.sens

func pause():
	get_tree().paused = true

func unpause():
	get_tree().paused = false
	
func _on_resume_pressed():
	press.play()
	unpause()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_options_pressed():
	press.play()
	$Panel/Options.show()
	$Panel/Pause.hide()
	

func _on_back_pressed():
	press.play()
	await press.finished
	get_tree().quit()


func _on_volume_slider_value_changed(value):
	VolumeConfig.save(value)
	VolumeConfig.update()
	press.play()

func _on_sen_slider_value_changed(value):
	SensitivityConfig.save(value)
	press.play()

func _on_back_2_pressed():
	press.play()
	$Panel/Options.hide()
	$Panel/Pause.show()
