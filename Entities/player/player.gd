extends CharacterBody3D



@export var fast: bool = false
@onready var speed_effect = $UI/SpeedEffect

#movement_animator
@onready var movement = $Movement


@onready var sprite = $MeshInstance3D
@onready var cam_origin = $CamOrigin

@export var max_speed = 25.0
var speed = max_speed

var jump_velocity = 20

var max_health = 100
var health = max_health

var follow_cam = false

@export var mouse_sensitivity: float = SensitivityConfig.sens

var min_yaw: float = 0
var max_yaw: float = 360
var min_pitch: float = -90
var max_pitch: float = 90

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	if fast:
		speed_effect.visible = true
	else:
		speed_effect.visible = false
	
	

func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion :
		mouse_sensitivity = SensitivityConfig.sens
		rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity))

		cam_origin.rotate_x(deg_to_rad(-event.relative.y * mouse_sensitivity))
		cam_origin.rotation.x = clamp(cam_origin.rotation.x, deg_to_rad(-45), deg_to_rad(45))

func _physics_process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().paused = true;
		

	# Add the gravity.
	if not is_on_floor():
		speed = max_speed / 2.5
		velocity.y -= 3 * gravity * delta
	else:
		speed = max_speed
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		#sprite.global_rotation.y 
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		movement.play("walk")
		follow_cam = true
	else:
		movement.play("idle")
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		follow_cam = false

	move_and_slide()
