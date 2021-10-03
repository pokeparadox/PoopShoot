extends Area2D

const direction := Vector2(0,1)
const SPEED = 200
const lifeTime = 10
var hasEnterred := false

func _ready() -> void:
	$AudioStreamPlayer2D.pitch_scale = Random.NextFloatRange(0.3,1.2)
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(lifeTime)
	timer.start()

func _physics_process(delta: float) -> void:
	global_position += delta * SPEED * direction


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_VisibilityNotifier2D_screen_entered() -> void:
	hasEnterred = true

func _on_timer_timeout() -> void:
	queue_free()
