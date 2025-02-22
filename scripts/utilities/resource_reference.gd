class_name ResourceReference
extends Resource

signal on_change

@export var value : Resource :
	get:
		return value
	
	set(new_value):
		value = new_value
		on_change.emit()
