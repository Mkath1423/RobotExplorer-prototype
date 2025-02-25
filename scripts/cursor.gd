extends Node

@export var selected_building_type : ResourceReference 


var level_plane : Plane = Plane(Vector3.UP, 0)

	
func get_3d_cursor_location():
	var mouse_position = get_viewport().get_mouse_position()
	var ray_origin = get_viewport().get_camera_3d().project_ray_origin(mouse_position)
	var ray_direction = get_viewport().get_camera_3d().project_ray_normal(mouse_position)
	
	var intersection = level_plane.intersects_ray(ray_origin, ray_direction)
	
	if intersection != null:
		return intersection
		
	else:
		return $pick_point.global_position

	
func _process(delta):
	$pick_point.global_position = get_3d_cursor_location()

func enter_build_mode():
	if selected_building_type == null:
		return

	var building_type = selected_building_type.value as BuildingType
	
	if building_type != null:
		var ghost = building_type.ghost.instantiate()
		$pick_point.add_child(ghost)
	
