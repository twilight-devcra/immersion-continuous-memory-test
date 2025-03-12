extends Node2D
class_name Symbol

var area: Vector2

func _draw() -> void:
	assert("Called the base Symbol's _draw() function") 

func _init(area:Vector2 = Vector2(200, 200)) -> void:
	self.area = area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# init the position to the center of the given area.
	self.position += self.area / 2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
