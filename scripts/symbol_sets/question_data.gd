extends Resource
class_name QuestionData

var symbol:Symbol
var is_answer:bool

func _init(symbol:Symbol, is_answer:bool):
	self.symbol = symbol
	self.is_answer = is_answer
