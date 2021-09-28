extends Node


var Shot = preload("res://Poop/Poop.tscn")

func GetHeadingVec(angle: float) -> Vector2:
	var vec = -CalculationCache.DegreesToVector2d(angle)
	vec.x = -vec.x * 2
	return vec

func ShootEnemyPoop(enemyPos, targetPos):
	var shot = Shot.instance()
	shot.global_position = enemyPos
	#shot.startShot(position, GetHeadingVec(heading), heading)
	add_child(shot)

func _on_DummyAlien_AlienPoopEvent(myPos, target) -> void:
	ShootEnemyPoop(myPos, target)
