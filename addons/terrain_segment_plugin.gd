@tool
extends EditorPlugin

func _enter_tree():
	add_inspector_plugin(TerrainInspectorPlugin.new())

class TerrainInspectorPlugin extends EditorInspectorPlugin:
	func _can_handle(object):
		return object is MeshInstance3D and object.has_method("generate_terrain")

	func _parse_begin(object):
		var button = Button.new()
		button.text = "Generate Terrain"
		button.pressed.connect(object.generate_terrain)
		add_custom_control(button)
