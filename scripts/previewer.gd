extends Node2D

@export var answers_position: Vector2
@export var margin: float

func display(answers:Array[Symbol]) -> void:
	var next_symbol_pos = Vector2(answers_position)
	for i in range(len(answers)):
		var symbol:Symbol = answers[i]
		symbol.position = next_symbol_pos
		self.add_child(symbol)
		next_symbol_pos += Vector2(symbol.area.x + self.margin, 0)
			
func vanish() -> void:
	print('vanish')
	for child in self.get_children():
		self.remove_child(child)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_single_round_answers_generated(answers: Array) -> void:
	print('_on_single_round_answers_generated')
	self.display(answers)
