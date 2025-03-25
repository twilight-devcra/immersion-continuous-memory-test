extends Node2D

var main_level_scene = preload("res://scenes/main_level.tscn")

func symbol_type(id:int) -> SymbolMeta.Types:
	match id:
		0:
			return SymbolMeta.Types.COLORED_SQUARES
		1:
			return SymbolMeta.Types.COLORED_SHAPES
		_:
			return SymbolMeta.Types.COLORED_SQUARES
			
func difficulty_curve(id:int) -> RoundManager.DifficultyCurve:
	match id:
		0:
			return RoundManager.DifficultyCurve.INCREMENTING
		1:
			return RoundManager.DifficultyCurve.AUTO
		2:
			return RoundManager.DifficultyCurve.AUTO_EARLY
		_:
			return RoundManager.DifficultyCurve.INCREMENTING

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ready_button_pressed() -> void:
	var main_level = main_level_scene.instantiate()
	main_level.init(
		self.symbol_type($SymbolTypeSelect.get_selected_id()),
		$RoundNum.value,
		$ProblemNum.value,
		self.difficulty_curve($DifficultyCurveSelect.get_selected_id()),
		$MaxLevel.value
	)
	
	self.get_tree().root.add_child(main_level)
	self.get_node('/root/StartupScreen').queue_free()
