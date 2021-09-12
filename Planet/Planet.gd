extends Sprite

const SCROLL_SPEED: int = 10

func _ready():
	Random.SetLimits(0.1,2.0)
	var s := Random.NextFloat()
	scale = Vector2(s,s)

func _physics_process(delta: float) -> void:
	global_position.y += delta * SCROLL_SPEED * (scale.y + Random.NextFloat())


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
