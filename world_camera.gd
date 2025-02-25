extends Camera3D

@export var base_pan_speed: float  

func _process(delta):
	
	
	var direction = ( 
		  Input.get_axis("left", "right") * Vector3(-1, 0, 1) * cos(30)
		+ Input.get_axis("down", "up"   ) * Vector3( 1, 0, 1)).normalized()
	
	global_position += direction * base_pan_speed * delta
