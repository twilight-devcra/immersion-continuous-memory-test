extends Resource
class_name RoundManager

enum DifficultyCurve {
	INCREMENTING,
	AUTO
}

var symbol_type:SingleRound.SymbolTypes
var difficulty_curve:DifficultyCurve

var current_difficulty: int

var round_results: Array[RoundResultData]

func save_round_results(data:RoundResultData) -> void:
	self.round_results.append(data)
	
func next_round_difficulty() -> int:
	match self.difficulty_curve:
		DifficultyCurve.INCREMENTING:
			if len(self.round_results) == 0:
				return 1
			
			return min(self.current_difficulty + 1, self.round_results[-1].round_set.max_level())
		DifficultyCurve.AUTO:
			return 1
		_:
			return 1
	
func make_next_round_params() -> Array:
	self.current_difficulty = self.next_round_difficulty()
	return [self.symbol_type, self.current_difficulty]
			
func _init(symbol_type:SingleRound.SymbolTypes, curve:DifficultyCurve) -> void:
	self.symbol_type = symbol_type
	self.difficulty_curve = curve
	self.current_difficulty = 1
