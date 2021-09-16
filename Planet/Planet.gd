extends Sprite
class_name Planet
const SCROLL_SPEED: int = 10
var Heading := Vector2.ZERO

func _ready():
	Random.SetLimits(0.1,2.0)
	var s := Random.NextFloat()
	scale = Vector2(s,s)
	z_index = -10 -(20 - (scale.x*10))

func setHeading(heading) -> void:
	Heading = heading.normalized()

func _physics_process(delta: float) -> void:
	var resultant = Heading + Vector2(scale.x*0.0001,scale.y)
	global_position += delta * SCROLL_SPEED * resultant

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
