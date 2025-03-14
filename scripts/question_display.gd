extends Node2D

var cur_symbol: Symbol
var current_guess: bool
var is_activated: bool

func display(symbol: Symbol) -> void:
	self.display_labels()
	self.cur_symbol = symbol
	self.cur_symbol.anchor = Vector2(0,0)
	self.add_child(cur_symbol)
	
func vanish() -> void:
	$Label.visible = false
	$LabelNo.visible = false
	$LabelYes.visible = false
	self.current_guess = false
	self.is_activated = false
	self.remove_child(self.cur_symbol)
	
func display_labels() -> void:
	self.is_activated = true
	$Label.visible = true
	$LabelNo.visible = !self.current_guess
	$LabelYes.visible = self.current_guess

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.current_guess = false
	self.is_activated = false
	$Label.visible = false
	$LabelNo.visible = false
	$LabelYes.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_single_round_guess_updated(guess: bool) -> void:
	if(self.is_activated):
		self.current_guess = guess
		self.display_labels()
