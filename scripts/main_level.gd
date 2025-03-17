extends Node2D

var single_round = preload("res://scenes/single_round.tscn")
var current_round:SingleRound
var manager:RoundManager

func new_round() -> void:
	pass
	
func delete_current_round() -> void:
	self.remove_child(self.current_round)
	self.current_round.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_round = single_round.instantiate()
	current_round.init(SingleRound.SymbolTypes.COLORED_SQUARES, 2, 1)
	current_round.round_finished.connect(self._on_round_finished)
	self.add_child(current_round)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_round_finished(result:RoundResultData):
	print(result.results)
