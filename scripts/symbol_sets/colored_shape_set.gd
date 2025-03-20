extends SymbolSet
class_name ColoredShapeSet

# Difficulty knobs:
# 1. Answer symbol count
# 2. Whether wrong questions share a common factor with an answer symbol.

var colored_shape_factory = preload("res://scripts/symbols/colored_shape.gd")
const colors: Array = [
	Color('e6194b'),
	Color('f58231'),
	Color('ffe119'),
	Color('3cb44b'),
	Color('42d4f4'),
	Color('4363d8'),
	Color('f032e6'),
	Color('a9a9a9'),
	Color('fabed4'),
	Color('aaffc3'),
	Color('dcbeff')
]
var shapes: Array = SymbolMeta.Shapes.values()
var symbols: Array[Symbol]
var size:float = 100.0

func max_level() -> int:
	return 4

func answer_count(level:int) -> int:
	return min(level, self.max_level())

func make_correct() -> Array[Symbol]:
	self.symbols.shuffle()
	return self.symbols.slice(0, self.answer_count(self.level))
	
func has_common_property(symbol:ColoredShape) -> bool:
	for answer in self.correct:
		if answer.shape == symbol.shape or answer.color == symbol.color:
			return true
	return false
	
func make_incorrect() -> Array[Symbol]:
	# assumes that make_correct was already called.
	var candidates = self.symbols.slice(self.answer_count(self.level), -1)
	candidates = candidates.filter(self.has_common_property)
	return candidates

func _init(level:int=1) -> void:
	self.symbols = []
	for color in colors:
		for shape in shapes:
			var symbol:ColoredShape = colored_shape_factory.new(self.size, shape, color)
			self.symbols.append(symbol)
	
	super._init(level)
