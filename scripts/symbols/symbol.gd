extends Node2D
class_name Symbol

var anchor: Vector2

func _draw() -> void:
	assert(false, "Called the base Symbol's _draw() function") 

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# init the position to the given anchor.
	self.position = self.anchor


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
