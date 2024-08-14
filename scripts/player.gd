class_name CameraController extends Node2D

@export var move_speed: float = 200.0  # Speed at which the camera moves

func _process(delta: float) -> void:
	var direction = Vector2.ZERO  # Initialize a zero vector for direction
	
	# Handle input for movement
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	# Normalize direction to maintain constant speed, even when moving diagonally
	direction = direction.normalized()
	
	# Move the camera
	position += direction * move_speed * delta
