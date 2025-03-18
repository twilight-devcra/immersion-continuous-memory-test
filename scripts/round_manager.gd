extends Resource
class_name RoundManager

enum DifficultyCurve {
	INCREMENTING,
	AUTO
}

static func diff_curve_name(val:DifficultyCurve) -> String:
	match val:
		DifficultyCurve.INCREMENTING:
			return 'incrementing'
		DifficultyCurve.AUTO:
			return 'auto'
		_:
			return 'undefined'

var symbol_type:SymbolMeta.Types
var difficulty_curve:DifficultyCurve

var current_difficulty: int

var round_results: Array[RoundResultData]

func save_round_results(data:RoundResultData) -> void:
	self.round_results.append(data)
	
func round_count() -> int:
	return len(self.round_results)
	
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
	
func export() -> void:
	var date = Time.get_datetime_string_from_system()
	
	var export_data = {
		'date': date,
		'symbol_type': SymbolMeta.type_name(self.symbol_type),
		'difficulty_curve': diff_curve_name(self.difficulty_curve),
		'rounds': self.round_results.map(func (result):return result.export())
	}
	
	var file_str = '%s.json' % date.replace(':', '')
	var file = FileAccess.open('user://%s' % file_str, FileAccess.WRITE)
	file.store_string(JSON.stringify(export_data, '\t'))
	
			
func _init(symbol_type:SymbolMeta.Types, curve:DifficultyCurve) -> void:
	self.symbol_type = symbol_type
	self.difficulty_curve = curve
	self.current_difficulty = 1
