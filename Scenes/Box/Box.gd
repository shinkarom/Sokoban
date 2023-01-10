extends "res://Scenes/GameEntity/GameEntity.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var covering = false
	for goal in get_tree().get_nodes_in_group("goal"):
		if goal.position == self.position:
			covering = true
	if covering:
		self.texture = load("res://Assets/crate_03.png")
	else:
		self.texture = load("res://Assets/crate_02.png")
