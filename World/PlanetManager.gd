extends Node

var Planet = preload("res://Planet/Planet.tscn")
var ShotCount: int = 0
var NextSpawn: int = 0

func _ready() -> void:
	UpdateNextSpawn()

func UpdateNextSpawn():
	NextSpawn = 10 + Random.QuickNextInt(0,100)

func _on_Rocket_PlayerShotEvent(_playerPos, playerAngleDeg) -> void:
	ShotCount += 1
	if(ShotCount > NextSpawn):
		ShotCount = 0
		UpdateNextSpawn()
		var p = Planet.instance()
		p.global_position = Vector2(Random.QuickNextInt(0, Resolution.GetWidth()),-100)
		var vec = CalculationCache.DegreesToVector2d(playerAngleDeg)
		vec.x = -vec.x
		p.setHeading(vec)
		add_child(p)


func _on_Rocket_ChangeDirectionEvent(playerHeading) -> void:
	playerHeading.x = -playerHeading.x
	for child in get_children():
		playerHeading.y = child.Heading.y
		child.setHeading(playerHeading)
