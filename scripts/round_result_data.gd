extends Resource
class_name RoundResultData

var symbol_type:SingleRound.SymbolTypes
var difficulty:int
var questions: Array[QuestionData]
var results: Array[bool]

func _init(symbol:SingleRound.SymbolTypes, difficulty:int, questions: Array[QuestionData], results: Array[bool]) -> void:
	self.symbol_type = symbol
	self.difficulty = difficulty
	self.questions = questions
	self.results = results
