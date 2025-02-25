class_name BuildingHotBarTabFactory
extends Resource

@export var label_text: String
@export var icon_image: Texture2D 

@export var scene : PackedScene

func create() -> Node:
	var node = scene.instantiate()
	node.initialize(label_text, icon_image)
	return node
