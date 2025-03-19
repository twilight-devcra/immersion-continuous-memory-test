extends Node2D

@export var margin: float
@export var symbol_width: float
@export var row_symbols: int = 5

func __symbol_position(index, total) -> Vector2:
	var row_index = index / self.row_symbols
	var cur_row_symbols = min(self.row_symbols, total - self.row_symbols * row_index)
	var position = -(self.symbol_width * cur_row_symbols + self.margin * (cur_row_symbols - 1)) / 2.0 + self.symbol_width / 2.0
	
	for x in range(index % self.row_symbols):
		position += self.symbol_width + self.margin
	return Vector2(position, self.symbol_width * row_index)

func display(answers:Array[Symbol]) -> void:
	$ReadyLabel.visible = true
	for i in range(len(answers)):
		var symbol:Symbol = answers[i]
		symbol.anchor = self.__symbol_position(i, len(answers))
		self.add_child(symbol)
			
func vanish() -> void:
	$ReadyLabel.visible = false
	for child in self.get_children():
		self.remove_child(child)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$ReadyLabel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
