extends Node

var MaxValue = 1
var MinValue = 0

func SetLimits(minV,  maxV):
	MaxValue = maxV
	MinValue = minV

func QuickNextInt(minV, maxV):
	return randi()%(int(maxV)+1)+int(minV)

func NextInt():
	return QuickNextInt(MinValue, MaxValue)

func NextBool():
	var val = QuickNextInt(0,1)
	if val == 1:
		return true
	else:
		return false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	randomize()
