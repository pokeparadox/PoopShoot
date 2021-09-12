extends Area2D

signal PlayerShotEvent(playerPos, playerHeading)

const speed :int = 300
var directionV := Vector2.ZERO
const TURN_ANGLE :int = 5
const FORWARD :int = 360
var LEFT :int = FORWARD - TURN_ANGLE
var RIGHT :int = FORWARD + TURN_ANGLE


func _physics_process(delta):
	directionV.x = Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft")
	directionV.y = Input.get_action_strength("MoveDown") - Input.get_action_strength("MoveUp")
	directionV = directionV.normalized()
	global_position += directionV * speed * delta
	steer_ship(directionV.x)

func steer_ship(xDirection):
	if(xDirection == 0):
		rotation_degrees = FORWARD
	elif(xDirection < 0):
		rotation_degrees = LEFT
	else:
		rotation_degrees = RIGHT

func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("Shoot")):
		shoot()

func shoot() -> void:
	emit_signal("PlayerShotEvent", global_position, rotation_degrees)

