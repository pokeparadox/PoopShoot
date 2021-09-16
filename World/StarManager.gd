extends Node

var Star = preload("res://Stars/Star.tscn")
var SmallStar = preload("res://Stars/LittleStar.tscn")

onready var timer = Timer.new()

func _ready() -> void:
	InitStarField()
	add_child(timer)
	timer.autostart = true
	UpdateNextSpawn()
	timer.connect("timeout", self, "on_timer_timeout")

func SpawnStar(pos = Vector2.ZERO):
	var s = Star.instance()
	if(pos != Vector2.ZERO):
		s.global_position = pos
	else:
		s.global_position = Vector2(Random.NextIntRange(0, Resolution.GetWidth()),-50)
	var vec = CalculationCache.DegreesToVector2d(0)
	var scaler = Random.NextFloatRange(0.1,1)
	vec *= scaler
	vec.x = -vec.x
	s.setHeading(vec)
	add_child(s)

func SpawnSmallStars(pos = Vector2.ZERO):
	var rang := 5
	if (pos != Vector2.ZERO):
		rang = 1
	for i in range(0,rang):
		var ss = SmallStar.instance()
		if(pos != Vector2.ZERO):
			ss.global_position = pos
		else:
			ss.global_position = Vector2(Random.NextIntRange(0, Resolution.GetWidth()),-50)
		var vec = CalculationCache.DegreesToVector2d(0)
		ss.setHeading(vec)
		add_child(ss)

func InitStarField():
	var SCALER := 25
	for y in range(0, Resolution.GetHeight()/SCALER):
		for x in range(0, Resolution.GetWidth()/SCALER):
			var val := Random.NextIntRange(0,100)
			if(val < 25):
				SpawnSmallStars(SCALER*Vector2(x,y))
			elif(val < 20 or val > 98):
				SpawnStar(SCALER*Vector2(x,y))

func UpdateNextSpawn():
	timer.set_wait_time(1 + Random.NextIntRange(0,5))
	timer.start()

func on_timer_timeout():
	SpawnStar()
	SpawnSmallStars()
	UpdateNextSpawn()

func _on_Rocket_ChangeDirectionEvent(playerHeading) -> void:
	playerHeading.x = -playerHeading.x
	for child in get_children():
		if(not child is Timer):
			playerHeading.y = child.Heading.y
			child.setHeading(playerHeading)
