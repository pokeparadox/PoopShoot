extends Node
var Alien = preload("res://Alien/Alien.tscn")
onready var timer = Timer.new()
func _ready() -> void:
	add_child(timer)
	timer.autostart = true
	UpdateNextSpawn()
	timer.connect("timeout", self, "on_timer_timeout")

func UpdateNextSpawn():
	timer.set_wait_time(1 + Random.NextIntRange(0,10))
	timer.start()

func on_timer_timeout():
	var a = Alien.instance()
	a.global_position = Vector2(Random.NextIntRange(150, Resolution.GetWidth()),-150)
	add_child(a)
	UpdateNextSpawn()
