class_name BuildingHotBarItem
extends PanelContainer

@onready var icon: TextureRect = %icon

@export var _building_type : BuildingType 
@export var _icon_image: Texture2D 

signal selected(type: BuildingType)

func _gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.is_action_pressed("menu_select"):
			selected.emit(_building_type)

func _ready() -> void:
	refresh_ui()

func refresh_ui():
	icon.set_texture(_icon_image)

func initialize(building_type : BuildingType, icon_image: Texture2D):
	_building_type = building_type
	_icon_image = icon_image
