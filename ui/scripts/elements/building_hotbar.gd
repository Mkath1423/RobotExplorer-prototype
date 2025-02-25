class_name BuildingHotBar
extends Control

@onready var rows_container: CenterContainer = %rows_container
@onready var tablist: HBoxContainer = %tablist

@export var layout : BuildingHotBarLayout
@export var row : PackedScene
@export var selected_building : ResourceReference


var rows = []
var tabs = []

func _ready() -> void:
	refresh_ui()

func hide_rows():
	for row in rows:
		row.hide()

func swap_visible_row(row):
	hide_rows()
	row.show()

func set_selected(building_type):
	if selected_building != null:
		selected_building.value = building_type

func refresh_ui():
	var i : int = 0
	for row_layout in layout.rows:
		i += 1
		var new_row = row.instantiate()
		new_row.name = "row" + str(i)
		
		for item_factory in row_layout.items:
			var new_item = item_factory.create() as BuildingHotBarItem
			new_item.selected.connect(set_selected)
			new_row.add_child(new_item)
		
		var new_tab = row_layout.tab.create() as BuildingHotBarTab
		new_tab.selected.connect(func show_row(): swap_visible_row(new_row))
		
		tablist.add_child(new_tab)
		tabs.append(new_tab)
		
		rows_container.add_child(new_row)
		rows.append(new_row)
		
