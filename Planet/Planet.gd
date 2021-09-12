extends Sprite

func _ready():
	var pos = Resolution.GetResolution()
	pos.x = pos.x  * randf()
	pos.y = pos.y * randf()
	set_position(pos)
