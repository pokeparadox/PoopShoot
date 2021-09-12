extends Area2D

class_name Shot

export var DirectionVec := Vector2.UP
export var speed : int = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func startShot(startPos, directionVec, heading):
	DirectionVec = directionVec.normalized()
	global_position = startPos + (DirectionVec * $Sprite.texture.get_height())
	rotation_degrees = heading

func _physics_process(delta: float) -> void:
	global_position += delta * speed * DirectionVec


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
