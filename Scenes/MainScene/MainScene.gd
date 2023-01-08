extends Node2D


func _ready():
	pass


func _on_ButtonPrev_button_up():
	Game.previousLevel()


func _on_ButtonReload_button_up():
	Game.reloadLevel()


func _on_ButtonNext_button_up():
	Game.nextLevel()
