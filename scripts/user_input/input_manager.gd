extends Node

signal input_mode_changed

enum InputMode {
	NONE, 
	DEFAULT,
	BUILD
}

var input_mode : InputMode = InputMode.DEFAULT :
	get:
		return input_mode
	
	set(mode):
		input_mode = mode
		input_mode_changed.emit()
	
