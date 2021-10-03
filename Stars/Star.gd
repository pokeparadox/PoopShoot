extends Sprite
class_name Star

const SCROLL_SPEED: int = 3
const lifeTime = 240
var Heading := Vector2.ZERO

func _ready():
	var fr = randi()%4
	self.set_frame(fr)
	Random.SetLimits(0.1,1.0)
	var s := Random.NextFloat()
	scale = Vector2(s,s)
	z_index = -int((1/s))*30
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(lifeTime)
	timer.start()

func setHeading(heading) -> void:
	Heading = heading.normalized()

func _physics_process(delta: float) -> void:
	var resultant = Heading + Vector2(scale.x*0.0000001,scale.y)
	global_position += delta * SCROLL_SPEED * resultant

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
