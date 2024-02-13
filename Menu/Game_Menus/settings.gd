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


func _on_back_pressed():
	press.play()
	await press.finished
	get_tree().quit()
