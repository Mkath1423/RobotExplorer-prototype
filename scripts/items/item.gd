class_name Item 

extends Resource

@export var id: String
@export var name: String
@export var description: String
@export var properties: Array[ItemProperty] = []

func _init(p_id: String, p_name: String, p_description: String, p_propertes: Array[ItemProperty]):
	id = p_id
	name = p_name
	description = p_description
	properties = p_propertes
