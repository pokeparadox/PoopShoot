extends Node

var Planet = preload("res://Planet/Planet.tscn")
var AngleToVectorLookup = {}
var ShotCount: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO fire all angles on init and then delete the shots immediately to cache the vectors to the dictionary before playing
	pass

func GetHeadingVec(heading: float) -> Vector2:
	if(not AngleToVectorLookup.has(heading)):
		var rad = deg2rad(heading)
		AngleToVectorLookup[heading] = -Vector2(2*sin(-rad), cos(rad))
	return AngleToVectorLookup[heading]

func _on_Rocket_PlayerShotEvent(playerPos, playerHeading) -> void:
	ShotCount += 1
	if(ShotCount > 10):
		ShotCount = 0
		var p = Planet.instance()
		p.global_position = Vector2(Random.QuickNextInt(0, Resolution.GetWidth()),-100)
		add_child(p)
