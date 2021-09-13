extends Node

var AngleToVectorLookup = {}

func DegreesToVector2d(heading: float) -> Vector2:
	heading = clamp(abs(heading), 0, 360)
	if(not AngleToVectorLookup.has(heading)):
		var rad = deg2rad(heading)
		AngleToVectorLookup[heading] = Vector2(sin(rad), cos(rad))
	return AngleToVectorLookup[heading]
