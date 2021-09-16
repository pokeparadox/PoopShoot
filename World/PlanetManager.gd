extends Node
var Planet = preload("res://Planet/Planet.tscn")
onready var timer = Timer.new()
func _ready() -> void:
	add_child(timer)
	timer.autostart = true
	UpdateNextSpawn()
	timer.connect("timeout", self, "on_timer_timeout")

func UpdateNextSpawn():
	timer.set_wait_time(10 + Random.NextIntRange(0,50))
	timer.start()

func on_timer_timeout():
	var p = Planet.instance()
	p.global_position = Vector2(Random.NextIntRange(0, Resolution.GetWidth()),-100)
	var vec = CalculationCache.DegreesToVector2d(0)
	vec.x = -vec.x
	p.setHeading(vec)
	add_child(p)
	UpdateNextSpawn()

func _on_Rocket_ChangeDirectionEvent(playerHeading) -> void:
	playerHeading.x = -playerHeading.x
	for child in get_children():
		if(not child is Timer):
			playerHeading.y = child.Heading.y
			child.setHeading(playerHeading)
