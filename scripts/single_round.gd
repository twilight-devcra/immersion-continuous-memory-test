extends Node2D
class_name SingleRound

enum SymbolTypes {
	COLORED_SQUARES
}

enum RoundState {
	SHOW_ANSWER,
	SHOW_QUESTION,
	SHOW_QUESTION_RESULT,
	SHOW_ROUND_RESULT
}

signal guess_updated
	

@export var difficulty: int = 0
@export var type: SymbolTypes = SymbolTypes.COLORED_SQUARES
@export var answer_time: float
@export var answer_timer_color: Color
@export var question_time: float
@export var question_timer_color: Color

var symbol_set: SymbolSet
var results: Array[bool]
var state: RoundState
var current_guess: bool # the user's guess of whether the current question is among the answer symbols.

func __delay(amount:float) -> void:
	await self.get_tree().create_timer(amount).timeout
	
func run_state() -> void:
	match self.state:
		RoundState.SHOW_ANSWER:
			self.show_answer()
		RoundState.SHOW_QUESTION:
			self.show_next_question()
		RoundState.SHOW_QUESTION_RESULT:
			self.process_question_results()
			await self.__delay(0.8)
			self.advance_state()
			self.run_state()
			return

# cleanup previous state and advance state.
func advance_state() -> void:
	match self.state:
		RoundState.SHOW_ANSWER:
			$Previewer.vanish()
			await self.__delay(1)
			self.state = RoundState.SHOW_QUESTION
			return 
		RoundState.SHOW_QUESTION:
			$QuestionDisplay.vanish()
			self.state = RoundState.SHOW_QUESTION_RESULT
			return
		RoundState.SHOW_QUESTION_RESULT:
			$QuestionResult.vanish()
			await self.__delay(0.5)
			if len(self.results) >= len(self.symbol_set.questions):
				# round is over
				self.state = RoundState.SHOW_ROUND_RESULT
			else:
				self.state = RoundState.SHOW_QUESTION
			return
			
func show_next_question() -> void:
	self.current_guess = false
	$QuestionDisplay.display(self.symbol_set.questions[len(self.results)].symbol)
	$TimerBar.start_timer(self.question_time, self.question_timer_color)
	
func process_question_results() -> void:
	var is_correct = self.current_guess == self.symbol_set.questions[len(self.results)].is_answer
	self.results.append(is_correct)
	$QuestionResult.display(is_correct)
			
func show_answer() -> void:
	$Previewer.display(self.symbol_set.correct_symbols())
	$TimerBar.start_timer(self.answer_time, self.answer_timer_color)

func generate_round_data() -> void:
	self.symbol_set = ColoredSquareSet.new(self.difficulty)
	self.symbol_set.make()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.state = RoundState.SHOW_ANSWER
	self.generate_round_data()
	self.run_state()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("confirm")):
		if(self.state == RoundState.SHOW_QUESTION):
			self.current_guess = !self.current_guess
			self.guess_updated.emit(self.current_guess)


func _on_timer_timeout() -> void:
	print('advance_state')
	self.advance_state()
	self.run_state()
