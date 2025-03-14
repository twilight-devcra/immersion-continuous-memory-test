# An abstract class representing a set of symbols.
# Supports generating a distinct set of 'answer' symbols, and generating correct / incorrect symbols.
extends Resource
class_name SymbolSet

var symbols: Array[Symbol]
var correct: Array[Symbol]
var incorrect: Array[Symbol]
var questions: Array[QuestionData]
var level: int

func make(question_amount:int=10) -> void:
	self.correct = self.make_correct()
	self.incorrect = self.make_incorrect()
	self.questions = self.make_questions(question_amount)
	
func make_correct() -> Array[Symbol]:
	assert(false, 'implement make_correct()')
	return []
	
func make_incorrect() -> Array[Symbol]:
	assert(false, 'implement make_incorrect()')
	return []
	
func make_questions(amount:int) -> Array[QuestionData]:
	var questions:Array[QuestionData] = []
	for x in range(amount):
		var appeared = randi() % 2 == 0
		
		var symbol
		if appeared:
			symbol = self.correct_symbol()
		else:
			symbol = self.incorrect_symbol()
		
		questions.append(QuestionData.new(symbol, appeared))
	return questions
	
func correct_symbols() -> Array[Symbol]:
	return self.correct

func correct_symbol() -> Symbol:
	return self.correct.pick_random()
	
func incorrect_symbol() -> Symbol:
	return self.incorrect.pick_random()

func _init(level:int=1) -> void:
	self.level = level
