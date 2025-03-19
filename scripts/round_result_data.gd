extends Resource
class_name RoundResultData

var symbol_type:SymbolMeta.Types
var difficulty:int
var round_set:SymbolSet
var results: Array[bool]

func export() -> Dictionary:
	var data = {
		'symbol_type': SymbolMeta.type_name(self.symbol_type),
		'difficulty': self.difficulty,
		'answers': self.round_set.correct.map(func(symbol): return symbol.describe()),
		'history': []
	}
	
	for i in range(len(results)):
		data['history'].append({
			'symbol': self.round_set.questions[i].symbol.describe(),
			'correct': results[i]
		})
		
	return data
	
func correct_ratio() -> float:
	return float(len(results.filter(func (result): return result))) / len(results)

func _init(symbol:SymbolMeta.Types, difficulty:int, round_set:SymbolSet, results: Array[bool]) -> void:
	self.symbol_type = symbol
	self.difficulty = difficulty
	self.round_set = round_set
	self.results = results
