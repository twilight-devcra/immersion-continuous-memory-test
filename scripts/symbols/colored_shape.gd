extends Symbol
class_name ColoredShape

@export var size:float = 100.0
@export var shape:SymbolMeta.Shapes
var color:Color
var border_width:float = 2.0

func describe() -> String:
	return '(%s, %s, %s)' % [self.color.r8, self.color.g8, self.color.b8]
	
func draw_shape() -> void:
	var points:Array = []
	match self.shape:
		SymbolMeta.Shapes.SQUARE:
			var start = self.size * 0.1
			var end = self.size * 0.9
			points = [
				Vector2(start, start),
				Vector2(start, end),
				Vector2(end, end),
				Vector2(end, start)
			]
		SymbolMeta.Shapes.CIRCLE:
			# treat circles differently, because these aren't polygons.
			self.position += Vector2(size / 2.0, size / 2.0)
			self.draw_circle(Vector2(0, 0), self.size / 2.3, self.color)
			self.draw_circle(Vector2(0, 0), self.size / 2.3, Color.WHITE, false, self.border_width, true)
			return
		SymbolMeta.Shapes.DIAMOND:
			points = [
				Vector2(self.size / 2.0, 0),
				Vector2(self.size, self.size / 2.0),
				Vector2(self.size / 2.0, self.size),
				Vector2(0, self.size / 2.0)
			]
		SymbolMeta.Shapes.TRIANGLE:
			points = [
				Vector2(self.size * 0.5, self.size * 0.1),
				Vector2(self.size * 1.0, self.size * 0.9),
				Vector2(self.size * 0.0, self.size * 0.9)
			]
		SymbolMeta.Shapes.PENTAGON:
			points = [
				Vector2(self.size * 0.5, self.size * 0.0),
				Vector2(self.size * 1.0, self.size * 0.4),
				Vector2(self.size * 0.8, self.size * 0.9),
				Vector2(self.size * 0.2, self.size * 0.9),
				Vector2(self.size * 0.0, self.size * 0.4)
			]
	
	var packed_points = PackedVector2Array(points)
	self.draw_colored_polygon(packed_points, self.color)
	packed_points.append(points[0])
	self.draw_polyline(packed_points, Color.WHITE, self.border_width, true)
		
			

func _draw() -> void:
	super._draw()
	self.position -= Vector2(size / 2.0, size / 2.0)
	
	self.draw_shape()
	

func _init(size:float = 50.0, shape:SymbolMeta.Shapes = SymbolMeta.Shapes.SQUARE, color:Color = Color.RED) -> void:
	super._init()
	self.size = size
	self.shape = shape
	self.color = color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	#self.position -= Vector2(size / 2.0, size / 2.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
