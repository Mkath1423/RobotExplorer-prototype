class_name BuildingManager
extends Node

func _enter_tree():
    place_building.register_manager(self)

func _exit_tree():
    place_building.deregister_manager()

