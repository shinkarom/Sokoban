extends Node

const totalLevels = 5

var levelNumber = 0

func setLevel(param):
	if param >= 0 and param < totalLevels:
		get_tree().change_scene("res://Levels/Level"+str(param)+".tscn")

func nextLevel():
	setLevel((levelNumber+1)%totalLevels)
	
func previousLevel():
	setLevel((levelNumber-1)%totalLevels)

func reloadLevel():
	setLevel(levelNumber)

func _ready():
	pass
