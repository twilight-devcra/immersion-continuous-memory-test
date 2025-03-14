extends Node2D

func vanish() -> void:
	$Label.visible = false

func display(is_correct:bool) -> void:
	if is_correct:
		$Label.text = "정답"
	else:
		$Label.text = "오답"
	$Label.visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
