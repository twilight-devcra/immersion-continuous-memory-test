extends Node2D
class_name SingleRound

enum SymbolTypes {
	COLORED_SQUARES
}
	

@export var difficulty: int = 0
@export var type: SymbolTypes = SymbolTypes.COLORED_SQUARES

const colored_square = preload("res://scripts/symbols/colored_square.gd")

func generate_round_data() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var square = colored_square.new()
	self.add_child(square)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
