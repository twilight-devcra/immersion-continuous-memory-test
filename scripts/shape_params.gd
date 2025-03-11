extends Resource
class_name ShapeParams

enum Colors {
	RED,
	YELLOW,
	GREEN,
	BLUE
}

enum Shapes {
	SQUARE,
	TRIANGLE
}

var color: Colors
var shape: Shapes
var size: float

func _init(color:Colors = Colors.RED, shape:Shapes = Shapes.SQUARE, size: float = 50) -> void:
	self.color = color
	self.shape = shape
	self.size = size
