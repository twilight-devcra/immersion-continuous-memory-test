extends Node2D

var result_label = preload("res://scenes/single_result.tscn")
var cur_x_offset: float
@export var label_width: float

func add_result(is_correct:bool) -> void:
	var label:SingleResult = result_label.instantiate()
	label.init(is_correct)
	label.position = Vector2(self.cur_x_offset, 0)
	self.add_child(label)
	
	self.cur_x_offset += self.label_width

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.cur_x_offset = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
