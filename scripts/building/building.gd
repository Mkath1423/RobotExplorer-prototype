class_name Building
extends Node3D

var hub : Hub = null


func register_hub(new_hub: Hub) -> void:
	hub = new_hub

func deregister_hub() -> void:
	hub = null


func add_connection(building: Building, anchor: Vector3):
	if building or anchor:
		pass
	pass

func remove_connection(building: Building):
	if building:
		pass
