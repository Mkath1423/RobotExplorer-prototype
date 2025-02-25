class_name BuildingHotBarItemFactory
extends Resource

@export var building_type : BuildingType 
@export var icon_image: Texture2D 

@export var scene : PackedScene

func create() -> Node:
	var node = scene.instantiate()
	node.initialize(building_type, icon_image)
	return node
