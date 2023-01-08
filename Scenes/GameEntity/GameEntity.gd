extends Sprite

export var x = 0 setget setX, getX
export var y = 0 setget setY, getY


func getX():
	return int(round(self.position.x/64))

func setX(param):
	self.position.x = param * 64
	
func getY():
	return int(round(self.position.y/64))
	
func setY(param):
	self.position.y = param * 64

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
