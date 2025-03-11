extends Node2D

const shape_factory = preload("res://scenes/shape.tscn")
const shape_params_factory = preload("res://scripts/shape_params.gd")
var rng:RandomNumberGenerator
@export var spawn_origin: Vector2
@export var spawn_size: Vector2

func spawn_shape() -> void:
	var shape:Shape = shape_factory.instantiate()
	var shape_params:ShapeParams = shape_params_factory.new()
	shape_params.color = ShapeParams.Colors.values().pick_random()
	shape_params.shape = ShapeParams.Shapes.values().pick_random()
	
	shape.set_params(shape_params)
	
	var x = self.spawn_origin.x + self.spawn_size.x * rng.randf()
	var y = self.spawn_origin.y + self.spawn_size.y * rng.randf()
	shape.position = Vector2(x, y)
	
	self.add_child(shape)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.rng = RandomNumberGenerator.new()
	
	for x in range(100):
		self.spawn_shape()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
