extends SymbolSet
class_name ColoredSquareSet

var colored_square_factory = preload("res://scripts/symbols/colored_square.gd")
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
var squares: Array[Symbol]

func max_level() -> int:
	return 4

func answer_count(level:int) -> int:
	return min(level, self.max_level())

func make_correct() -> Array[Symbol]:
	self.squares.shuffle()
	return self.squares.slice(0, self.answer_count(self.level))
	
func make_incorrect() -> Array[Symbol]:
	# assumes that make_correct was already called.
	return self.squares.slice(self.answer_count(self.level), self.answer_count(self.level) * 2 + 1)

func _init(level:int=1) -> void:
	self.squares = []
	for color in colors:
		var square:ColoredSquare = colored_square_factory.new(100.0, color)
		self.squares.append(square)
	
	super._init(level)
