extends Node2D

export var NumStars = 10

func _ready():
	var res = Resolution.GetResolution()
	Random.SetLimits(20, res.x *0.5)

	for i in range(0, NumStars):
		var ins = preload("res://MiniGames/RocketEscape/Stars/Star.tscn").instance()
		var pos = Vector2(Random.NextInt(), 0)
		if i > 0:
			pos = pos + get_child(i-1).get_pos()
		if pos.x > res.x:
			pos.x = pos.x - res.x
		ins.set_pos(pos)
		self.add_child(ins)
	Random.SetLimits(20, res.y *0.5)
	for i in range(0, get_child_count()):
		var pos = get_child(i).get_pos()
		pos.y = Random.NextInt()
		if i > 0:
			pos.y = pos.y + get_child(i-1).get_pos().y
		if pos.y > res.y:
			pos.y =  pos.y - res.y
		get_child(i).set_pos(pos)
