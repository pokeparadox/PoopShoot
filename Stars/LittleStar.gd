extends Node2D
class_name LittleStar

const SCROLL_SPEED: int = 2
const lifeTime = 240
var Heading := Vector2(0, 1)

export var Colour1 = Color(0.5, 0.5 , 0.5)
export var Colour2 = Color(1,1,0)
export var Colour3 = Color(1, 1 , 1)
export var Colour4 = Color(0.25, 0.25, 1)
export var Dimensions = Vector2(1,1)
var ActiveColour = Colour1
onready var timer = Timer.new()
func _ready() -> void:
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.set_wait_time(lifeTime)
	timer.start()

func setHeading(heading) -> void:
	Heading = Vector2(0, 1)

func _physics_process(delta: float) -> void:
	var colour = Random.NextIntRange(1,4)
	if colour == 1:
		ActiveColour = Colour1
	elif colour == 2:
		ActiveColour = Colour2
	elif colour == 3:
		ActiveColour = Colour3
	else:
		ActiveColour = Colour4
	if Random.NextBool():
		update()
	global_position += delta * SCROLL_SPEED * Heading
func _draw():
	draw_rect(Rect2(get_position(), Dimensions), ActiveColour)

func reset(pos = Vector2.ZERO):
	if(timer != null):
		timer.start()

	if(pos != Vector2.ZERO):
		global_position = pos
	else:
		var offset: int = 50
		global_position = Vector2(Random.NextIntRange(offset, Resolution.GetWidth()-offset),-Random.NextIntRange(offset, 2*offset))

func _on_VisibilityNotifier2D_screen_exited() -> void:
	reset()

func _on_timer_timeout() -> void:
	reset()
