extends Node2D

@export var score:int = 0

func init(score:int) -> void:
	self.score = score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Score.text = String.num_int64(self.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
