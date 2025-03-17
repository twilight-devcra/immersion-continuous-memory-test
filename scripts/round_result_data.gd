extends Resource
class_name RoundResultData

var symbol_type:SingleRound.SymbolTypes
var difficulty:int
var round_set:SymbolSet
var results: Array[bool]

func _init(symbol:SingleRound.SymbolTypes, difficulty:int, round_set:SymbolSet, results: Array[bool]) -> void:
	self.symbol_type = symbol
	self.difficulty = difficulty
	self.round_set = round_set
	self.results = results
