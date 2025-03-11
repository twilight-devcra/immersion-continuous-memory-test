# An abstract class representing a set of symbols.
# Supports generating a distinct set of 'answer' symbols, and generating correct / incorrect symbols.
extends Resource
class_name SymbolSet

var correct: Array
var incorrect: Array

func make_answers() -> void:
	self.correct.shuffle()
	
func correct_symbol() -> void:
	pass
	
func incorrect_symbol() -> void:
	pass

func _init() -> void:
	pass
