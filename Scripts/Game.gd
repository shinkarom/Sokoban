extends Node

const totalLevels = 5

var levelNumber = 0

const DIR_UP = Vector2(0, -64)
const DIR_DOWN = Vector2(0, 64)
const DIR_LEFT = Vector2(-64, 0)
const DIR_RIGHT = Vector2(64, 0)

func setLevel(param):
	if param >= 0 and param < totalLevels:
		get_tree().change_scene("res://Levels/Level"+str(param)+".tscn")
		levelNumber = param

func nextLevel():
	setLevel((levelNumber+1)%totalLevels)
	
func previousLevel():
	var prevNumber = levelNumber - 1
	if prevNumber < 0:
		prevNumber = totalLevels - 1 
	setLevel(prevNumber)

func reloadLevel():
	setLevel(levelNumber)

func checkWin():
	for goal in get_tree().get_nodes_in_group("goal"):
		var covered = false
		for box in get_tree().get_nodes_in_group("box"):
			if box.position == goal.position:
				covered = true
		if not covered:
			return false
	return true

func _ready():
	pass
