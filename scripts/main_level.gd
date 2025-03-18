extends Node2D

var single_round = preload("res://scenes/single_round.tscn")
var current_round:SingleRound
var manager:RoundManager

@export var rounds:int = 5
@export var round_problem_count:int = 10
@export var symbol_type:SymbolMeta.Types = SymbolMeta.Types.COLORED_SQUARES
@export var difficulty_curve:RoundManager.DifficultyCurve = RoundManager.DifficultyCurve.INCREMENTING

signal session_finished

func new_round() -> void:
	var round_params = manager.make_next_round_params()
	
	self.current_round = single_round.instantiate()
	self.current_round.init(round_params[0], round_params[1], self.round_problem_count)
	self.current_round.round_finished.connect(self._on_round_finished)
	self.add_child(current_round)
	
func delete_current_round() -> void:
	self.remove_child(self.current_round)
	self.current_round.queue_free()
	
func init(symbol_type:SymbolMeta.Types, rounds:int, problems:int, difficulty_curve:RoundManager.DifficultyCurve) -> void:
	self.symbol_type = symbol_type
	self.rounds = rounds
	self.round_problem_count = problems
	self.difficulty_curve = difficulty_curve

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.manager = RoundManager.new(self.symbol_type, self.difficulty_curve)
	self.new_round()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_round_finished(result:RoundResultData):
	self.manager.save_round_results(result)
	self.delete_current_round()
	
	if self.manager.round_count() >= self.rounds:
		# end session.
		self.manager.export()
		self.session_finished.emit()
		self.get_tree().quit()
	else:
		self.new_round()
