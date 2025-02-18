class_name ItemProperty

extends Resource

@export var id: String
@export var name: String
@export var description: String
@export var level : int

func _init(p_id: String, p_name: String, p_description: String, p_level: int):
	id = p_id
	name = p_name
	description = p_description
	level = p_level
