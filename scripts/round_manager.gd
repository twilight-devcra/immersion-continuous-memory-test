extends Resource
class_name RoundManager

enum DifficultyCurve {
	INCREMENTING,
	AUTO
}

var symbol_type:SingleRound.SymbolTypes
var difficulty_curve:DifficultyCurve

var round_results: Array[RoundResultData]

func save_round_results(data:RoundResultData) -> void:
	self.round_results.append(data)

func _init(symbol_type:SingleRound.SymbolTypes, curve:DifficultyCurve) -> void:
	self.symbol_type = symbol_type
	self.difficulty_curve = curve
