extends Node

const totalLevels = 5

var levelNumber = 0

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

func _ready():
	pass
