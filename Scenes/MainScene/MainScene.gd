extends Node2D
class_name MainScene

onready var player = get_node("%Player")

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_released("ui_up"):
		movePlayer(Game.DIR_UP)
		player.texture = load("res://Assets/Player/player_02.png")
	elif Input.is_action_just_released("ui_down"):
		movePlayer(Game.DIR_DOWN)
		player.texture = load("res://Assets/Player/player_01.png")
	elif Input.is_action_just_released("ui_left"):
		movePlayer(Game.DIR_LEFT)
		player.texture = load("res://Assets/Player/player_14.png")
	elif Input.is_action_just_released("ui_right"):
		movePlayer(Game.DIR_RIGHT)
		player.texture = load("res://Assets/Player/player_11.png")

func isThereTile(tileGroup, pos):
	for item in get_node("LevelLayer").get_children():
		if item.is_in_group(tileGroup) and item.position == pos:
			return true
	return false

func movePlayer(dir):
	var pos = player.position
	var targetPos = pos+dir
	var theBox
	var foundBox = false
	for box in get_tree().get_nodes_in_group("box"):
		if box.position == targetPos:
			foundBox = true
			theBox = box
	if foundBox:
		var nextPos = targetPos+dir
		if not isThereTile("wall",nextPos) and not isThereTile("box", nextPos):
			theBox.position = nextPos
			player.position = targetPos
			if Game.checkWin():
				Game.nextLevel()
	elif isThereTile("ground",targetPos) or isThereTile("goal", targetPos):
		player.position = targetPos

func _on_ButtonPrev_button_up():
	Game.previousLevel()


func _on_ButtonReload_button_up():
	Game.reloadLevel()


func _on_ButtonNext_button_up():
	Game.nextLevel()


func _on_ButtonInfo_mouse_entered():
	get_node("UILayer/Panel").visible = true


func _on_ButtonInfo_mouse_exited():
	get_node("UILayer/Panel").visible = false
