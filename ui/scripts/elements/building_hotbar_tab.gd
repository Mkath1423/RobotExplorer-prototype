class_name BuildingHotBarTab
extends PanelContainer

@onready var icon: TextureRect = %icon
@onready var label: RichTextLabel = %label

@export var _label_text: String
@export var _icon_image: Texture2D 

signal selected


func _gui_input(event: InputEvent):
	if event is InputEventMouseButton and event.pressed:
		if event.is_action_pressed("menu_select"):
			selected.emit()


func _ready() -> void:
	refresh_ui()

func refresh_ui():
	icon.texture = _icon_image
	label.text = _label_text


func initialize(label_text : String, icon_image:  Texture2D):
	_label_text = label_text
	_icon_image = icon_image 
