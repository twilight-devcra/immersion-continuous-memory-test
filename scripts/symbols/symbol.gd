extends Node2D
class_name Symbol

@export var anchor: Vector2

# a string describing this specific symbol (for result printing)
func describe() -> String:
	return 'base symbol'

func _draw() -> void:
	self.position = self.anchor

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# init the position to the given anchor.
	#self.position = self.anchor
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
