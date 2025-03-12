extends Node2D
class_name SingleRound

enum SymbolTypes {
	COLORED_SQUARES
}

enum RoundState {
	SHOW_ANSWER,
	SHOW_QUESTION
}

signal answers_generated
	

@export var difficulty: int = 0
@export var type: SymbolTypes = SymbolTypes.COLORED_SQUARES
var symbol_set: SymbolSet
var state: RoundState

func generate_round_data() -> void:
	self.symbol_set = ColoredSquareSet.new(1)
	self.symbol_set.make()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.state = RoundState.SHOW_ANSWER
	self.generate_round_data()
	self.answers_generated.emit(self.symbol_set.correct_symbols())
	$TimerBar.start_timer(4.3, Color.AQUA)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
