extends Node


var Shot = preload("res://Shot/Shot.tscn")
var AngleToVectorLookup = {}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO fire all angles on init and then delete the shots immediately to cache the vectors to the dictionary before playing
	pass

func GetHeadingVec(heading: float) -> Vector2:
	if(not AngleToVectorLookup.has(heading)):
		var rad = deg2rad(heading)
		AngleToVectorLookup[heading] = -Vector2(2*sin(-rad), cos(rad))
	return AngleToVectorLookup[heading]

func ShootPlayerLaser(position, heading):
	var shot = Shot.instance()
	shot.add_to_group("PlayerShots")
	shot.startShot(position, GetHeadingVec(heading), heading)
	add_child(shot)



func _on_Rocket_PlayerShotEvent(playerPos, playerHeading) -> void:
	ShootPlayerLaser(playerPos, playerHeading)
