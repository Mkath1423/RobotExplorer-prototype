class_name GameObject
extends Node3D

@export var properties: Array = []

func add_property(prop: String) -> void:
    if properties.has(prop):
        print("Property already exists:", prop)
        return
    properties.append(prop)
    print("Property added:", prop)

func remove_property(prop: String) -> void:
    if properties.has(prop):
        properties.erase(prop)
        print("Property removed:", prop)
    else:
        print("Property not found:", prop)

func has_property(prop: String) -> bool:
    return properties.has(prop)

func debug_print() -> void:
    print("Properties:", properties)
