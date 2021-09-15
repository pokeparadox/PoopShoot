extends Node

var Star = preload("res://Stars/Star.tscn")
var SmallStar = preload("res://Stars/LittleStar.tscn")

onready var timer = Timer.new()

func _ready() -> void:
	add_child(timer)
	timer.autostart = true
	UpdateNextSpawn()
	timer.connect("timeout", self, "on_timer_timeout")

func UpdateNextSpawn():
	timer.set_wait_time(1 + Random.NextIntRange(0,5))
	timer.start()

func on_timer_timeout():
	var s = Star.instance()
	s.global_position = Vector2(Random.NextIntRange(0, Resolution.GetWidth()),-50)
	var vec = CalculationCache.DegreesToVector2d(0)
	vec.x = -vec.x
	s.setHeading(vec)
	add_child(s)

	for i in range(0,5):
		var ss = SmallStar.instance()
		ss.global_position = Vector2(Random.NextIntRange(0, Resolution.GetWidth()),-5)
		ss.setHeading(vec)
		add_child(ss)

	UpdateNextSpawn()

func _on_Rocket_ChangeDirectionEvent(playerHeading) -> void:
	playerHeading.x = -playerHeading.x
	for child in get_children():
		if(not child is Timer):
			playerHeading.y = child.Heading.y
			child.setHeading(playerHeading)
