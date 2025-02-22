class_name PlaceBuilding
extends Node

# Variable to store the reference to the target node
#var building_manager: BuildingManager = null
#
#@export var hub_scene_ref: PackedScene
#
#
## Set the reference to the target node
#func register_manager(manager: BuildingManager) -> void:
	#building_manager = manager
#
#func deregister_manager() -> void:
	#building_manager = null
#
#func place_building(building_scene_ref: PackedScene, position: Vector3) -> Hub:
	#if building_manager == null: 
		#return null
#
	#var building = building_scene_ref.instantiate()
	#building.global_transform.origin = position
	#
	#if building is Hub:
		#building_manager.add_child(building)
		#return building
#
	#if building is Building:
		#var new_hub : Hub = hub_scene_ref.instantiate()
		#new_hub.add_building(building)
		#building_manager.add_child(new_hub)
		#return new_hub
		#
	#print("Place Building; cannot place non building node")
	#return null
#
#
#func place_building_connected(building_scene_ref: PackedScene, position: Vector3, connected_to: Building, anchor: Vector3) -> void:
	#if building_manager == null: 
		#return
#
	#var building = building_scene_ref.instantiate()
	#building.global_transform.origin = position
#
	## when placing connected the building must be an actualy building not a hub (for now)
	#connected_to.hub.add_building(building)
	#connected_to.hub.connect_buildings(building, connected_to, anchor)
