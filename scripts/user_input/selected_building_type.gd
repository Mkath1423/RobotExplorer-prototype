extends Node

signal on_change

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
		on_change.emit()
