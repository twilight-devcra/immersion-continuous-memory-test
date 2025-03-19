extends Resource
class_name SymbolMeta

enum Types {
	COLORED_SQUARES,
	COLORED_SHAPES
}

enum Shapes {
	SQUARE,
	CIRCLE,
	TRIANGLE,
	DIAMOND,
	PENTAGON
}

static func type_name(val:Types) -> String:
	match val:
		Types.COLORED_SQUARES:
			return 'Colored Squares'
		_:
			return 'undefined'

static func shape_name(val:Shapes) -> String:
	match val:
		Shapes.SQUARE:
			return 'square'
		Shapes.CIRCLE:
			return 'circle'
		Shapes.TRIANGLE:
			return 'triangle'
		Shapes.DIAMOND:
			return 'diamond'
		Shapes.PENTAGON:
			return 'pentagon'
		_:
			return 'undefined'
