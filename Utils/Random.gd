extends Node

var MaxValue = 1
var MinValue = 0

func SetLimits(minV,  maxV):
	MaxValue = maxV
	MinValue = minV

func QuickNextInt(minV, maxV) -> int:
	return randi()%(int(maxV)+1)+int(minV)

func NextInt() -> int:
	return QuickNextInt(MinValue, MaxValue)

func NextBool() -> bool:
	var val = QuickNextInt(0,1)
	if val == 1:
		return true
	else:
		return false

func QuickNextFloat(minV, maxV) -> float:
	return rand_range(minV,maxV)

func NextFloat() -> float:
	return QuickNextFloat(MinValue, MaxValue)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
