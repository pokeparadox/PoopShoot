extends Area2D

const direction := Vector2(0,1)
const SPEED = 100

func _physics_process(delta: float) -> void:
	global_position += delta * SPEED * direction


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	queue_free()
