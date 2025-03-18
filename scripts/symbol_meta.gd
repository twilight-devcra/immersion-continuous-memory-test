extends Resource
class_name SymbolMeta

enum Types {
	COLORED_SQUARES
}

static func type_name(val:Types) -> String:
	match val:
		Types.COLORED_SQUARES:
			return 'Colored Squares'
		_:
			return 'undefined'
