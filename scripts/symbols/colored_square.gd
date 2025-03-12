extends Symbol
class_name ColoredSquare

var size:float
var color:Color

func _draw() -> void:
	# draw the square.
	self.draw_rect(Rect2(0, 0, self.size, self.size), self.color)
	
	# draw the border.
	self.draw_rect(Rect2(0, 0, self.size, self.size), Color.ALICE_BLUE, false, 2.0)
	

func _init(size:float = 50.0, color:Color = Color.RED) -> void:
	super._init()
	self.size = size
	
	self.color = color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	self.position += Vector2(size / 2.0, size / 2.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)
