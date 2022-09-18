tool
extends Control
	
var maxRecDepth := 15

var node
var toggleCount := 0

onready var toggleButton = $VBox/ToggleButton

func _ready():
	toggleButton.connect("pressed", self, "_on_Button_pressed")
	
func _set_unique(parent, newValue, depth) -> void:
	toggleCount += 1
	parent.unique_name_in_owner = newValue	
	if parent.get_child_count() != 0 && depth + 1 <= maxRecDepth:
		for c in parent.get_children():
			_set_unique(c, newValue, depth + 1)
	

func _on_Button_pressed():
	maxRecDepth = $VBox/PanelContainer2/DepthValue.value
	toggleCount = 0
	var oldValue = node.unique_name_in_owner
	_set_unique(node, !oldValue, 0)
	print("Toggled access from %s to %s for %s objects" % [oldValue, !oldValue, toggleCount]) 
