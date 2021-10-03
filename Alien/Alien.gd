extends Area2D

signal AlienPoopEvent(myPos, target)

const direction := Vector2(0,1)
const SPEED = 100
const maxPoops: int = 10
const lifeTime = 10
var currentPoops: int = 0

func _ready() -> void:
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(lifeTime)
	timer.start()
	add_to_group("Aliens")

func _physics_process(delta: float) -> void:
	global_position += delta * SPEED * direction
	var rVal = Random.NextIntRange(0,1000)

	if($Dead.playing):
		visible = !visible

	elif(not $Talk.playing and rVal <= 6):
		$Talk.pitch_scale = (global_position.y/Resolution.GetHeight()) + 0.2
		$Talk.play()
	elif(not $Talk.playing and rVal >= 950):
		Shoot()

func Shoot() -> void:
	if(currentPoops < maxPoops):
		emit_signal("AlienPoopEvent", global_position, direction)
		currentPoops += 1

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_Area2D_area_entered(area: Area2D) -> void:
	if(not $Dead.playing):
		$Dead.play()

func _on_Dead_finished() -> void:
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
