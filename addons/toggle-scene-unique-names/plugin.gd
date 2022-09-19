tool
extends EditorPlugin

var plugin: EditorInspectorPlugin

func _enter_tree() -> void:
	plugin = preload("res://addons/toggle-scene-unique-names/unique_children_names.gd").new() 
	add_inspector_plugin(plugin)

func _exit_tree() -> void:
	remove_inspector_plugin(plugin)
