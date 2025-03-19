extends Node2D

var single_round = preload("res://scenes/single_round.tscn")
var final_result_scene = preload("res://scenes/final_result.tscn")
var current_round:SingleRound
var manager:RoundManager

@export var rounds:int = 5
@export var round_problem_count:int = 10
@export var symbol_type:SymbolMeta.Types = SymbolMeta.Types.COLORED_SQUARES
@export var difficulty_curve:RoundManager.DifficultyCurve = RoundManager.DifficultyCurve.INCREMENTING
@export var score_increment:int = 1000
@export var correct_streak_trigger:int = 5
@export var incorrect_streak_trigger:int = 2

var score:int = 0
var correct_streak:int = 0
var incorrect_streak:int = 0
var total_problem_count:int
var current_problem_count:int = 0

func new_round() -> void:
	self.correct_streak = 0
	self.incorrect_streak = 0
	
	var round_params = manager.make_next_round_params()
	
	self.current_round = single_round.instantiate()
	self.current_round.init(round_params[0], round_params[1], min(self.round_problem_count, self.total_problem_count - self.current_problem_count))
	self.current_round.round_finished.connect(self._on_round_finished)
	self.current_round.question_processed.connect(self._on_question_processed)
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
	self.total_problem_count = self.rounds * self.round_problem_count
	self.manager = RoundManager.new(self.symbol_type, self.difficulty_curve)
	self.new_round()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_round_finished(result:RoundResultData) -> void:
	self.manager.save_round_results(result)
	self.delete_current_round()
	
	#if self.manager.round_count() >= self.rounds:
	if self.current_problem_count >= self.total_problem_count:
		# end session.
		self.manager.export()
		
		var final_result = final_result_scene.instantiate()
		final_result.init(self.score)
		
		self.get_tree().root.add_child(final_result)
		self.get_node('/root/MainLevel').queue_free()
	else:
		self.new_round()

func _on_question_processed(difficulty:int, is_correct:bool) -> void:
	self.current_problem_count += 1
	
	if is_correct:
		self.correct_streak += 1
		self.incorrect_streak = 0
		self.score += difficulty * self.score_increment
		$ScoreContainer.set_score(self.score)
	else:
		self.correct_streak = 0
		self.incorrect_streak += 1
		
	if self.difficulty_curve == RoundManager.DifficultyCurve.AUTO_EARLY and \
	(self.correct_streak >= self.correct_streak_trigger or self.incorrect_streak >= self.incorrect_streak_trigger):
		# prematurly end this round.
		self.current_round.stop_flag = true
