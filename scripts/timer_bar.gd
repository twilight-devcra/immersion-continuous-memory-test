extends Node2D

func start_timer(time: float, color:Color=Color.YELLOW) -> void:
	$ProgressBar.max_value = time
	$ProgressBar.get("theme_override_styles/fill").bg_color = color
	$Timer.start(time)
	self.visible = true

func _ready() -> void:
	self.visible = false

func _process(delta: float) -> void:
	if (self.visible):
		$ProgressBar.value = $Timer.time_left
	
	

func _on_timer_timeout() -> void:
	self.visible = false # Replace with function body.
