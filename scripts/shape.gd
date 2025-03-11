extends Node2D
class_name Shape

var points: PackedVector2Array
var color: Color

func __color(color: ShapeParams.Colors) -> Color:
	match(color):
		ShapeParams.Colors.RED:
			return Color.RED
		ShapeParams.Colors.YELLOW:
			return Color.GOLD
		ShapeParams.Colors.GREEN:
			return Color.LIME_GREEN
		ShapeParams.Colors.BLUE:
			return Color.CYAN
		_:
			return Color.GRAY
			
func __shape_coords(shape: ShapeParams.Shapes, size: float) -> PackedVector2Array:
	match(shape):
		ShapeParams.Shapes.SQUARE:
			return PackedVector2Array([
				Vector2(0, 0),
				Vector2(size, 0),
				Vector2(size, size),
				Vector2(0, size)
			])
		ShapeParams.Shapes.TRIANGLE:
			return PackedVector2Array([
				Vector2(size / 2.0, 0),
				Vector2(size, size),
				Vector2(0, size)
			])
		_:
			return PackedVector2Array()

func set_params(params: ShapeParams) -> Shape:
	self.color = self.__color(params.color)
	self.points = self.__shape_coords(params.shape, params.size)
	return self
	
func _init(draw_method:func) -> void:
	pass

func _draw() -> void:
	self.draw_colored_polygon(self.points, self.color)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
