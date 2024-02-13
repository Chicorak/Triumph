extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body_entered:
		for body in get_overlapping_bodies():
			if body is CharacterBody3D:
				SceneTransition.change_scene("res://Menu/devland.tscn")
