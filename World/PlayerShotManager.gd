extends Node


var Shot = preload("res://Shot/Shot.tscn")

func GetHeadingVec(angle: float) -> Vector2:
	var vec = -CalculationCache.DegreesToVector2d(angle)
	vec.x = -vec.x * 2
	return vec

func ShootPlayerLaser(position, heading):
	var shot = Shot.instance()
	shot.startShot(position, GetHeadingVec(heading), heading)
	add_child(shot)



func _on_Rocket_PlayerShotEvent(playerPos, playerHeading) -> void:
	ShootPlayerLaser(playerPos, playerHeading)
