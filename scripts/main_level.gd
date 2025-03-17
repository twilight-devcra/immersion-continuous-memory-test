extends Node2D

var single_round = preload("res://scenes/single_round.tscn")
var current_round:SingleRound
var manager:RoundManager

@export var round_problem_count:int = 10

func new_round() -> void:
	var round_params = manager.make_next_round_params()
	
	self.current_round = single_round.instantiate()
	self.current_round.init(round_params[0], round_params[1], self.round_problem_count)
	self.current_round.round_finished.connect(self._on_round_finished)
	self.add_child(current_round)
	
func delete_current_round() -> void:
	self.remove_child(self.current_round)
	self.current_round.queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.manager = RoundManager.new(SingleRound.SymbolTypes.COLORED_SQUARES, RoundManager.DifficultyCurve.INCREMENTING)
	self.new_round()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_round_finished(result:RoundResultData):
	print(result.results)
