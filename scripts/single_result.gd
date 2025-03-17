extends Node2D
class_name SingleResult

var label_text: String
var label_color: Color

func init(is_correct:bool = true) -> void:
	self.label_text = "O" if is_correct else "X"
	self.label_color = Color.CORNFLOWER_BLUE if is_correct else Color.CRIMSON

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = self.label_text
	#$Label.font_color = self.label_color
	$Label.set("theme_override_colors/font_color", self.label_color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
