extends Area2D

signal PlayerShotEvent(playerPos, playerHeading)
signal ChangeDirectionEvent(playerHeading)

const speed :int = 300
var directionV := Vector2.ZERO
const TURN_ANGLE :int = 5
const FORWARD :int = 360
var LEFT :int = FORWARD - TURN_ANGLE
var RIGHT :int = TURN_ANGLE

func _ready() -> void:
	# Precache some angle to vectors
	var _a = CalculationCache.DegreesToVector2d(LEFT)
	_a = CalculationCache.DegreesToVector2d(RIGHT)
	_a = CalculationCache.DegreesToVector2d(FORWARD)

func _physics_process(delta):
	var oldDirection = directionV
	directionV.x = Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft")
	directionV.y = Input.get_action_strength("MoveDown") - Input.get_action_strength("MoveUp")
	directionV = directionV.normalized()
	global_position += directionV * speed * delta
	if(oldDirection != directionV):
		emit_signal("ChangeDirectionEvent", directionV)

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

