extends Sprite
const SCROLL_SPEED: int = 5
var maxScroll : float
var startScroll: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startScroll = global_position.y
	maxScroll = startScroll + self.texture.get_height() * 2

func _physics_process(delta: float) -> void:
	global_position.y += SCROLL_SPEED * delta

	if (global_position.y > maxScroll):
		global_position.y = startScroll

