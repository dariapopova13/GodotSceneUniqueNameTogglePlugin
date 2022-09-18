extends EditorInspectorPlugin

var interface = preload("res://addons/ToggleSceneUniqueNames/ui/Control.tscn")

var node

func can_handle(object):
	return true

func parse_begin(object):
	node = object

func parse_end():
	var control_instance = interface.instance()
	control_instance.set("node", node)
	
	var ep = EditorProperty.new()
	ep.add_child(control_instance)
	ep.set_bottom_editor(control_instance)
	add_custom_control(ep)
	
