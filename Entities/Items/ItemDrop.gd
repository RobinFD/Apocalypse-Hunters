extends KinematicBody2D

signal collect_item(this_item)

var item setget set_item

func _ready():
	item = $ItemDisplay/Item


func _on_Button_pressed():
	emit_signal("collect_item", self)

func set_item(value):
	if item:
		$ItemDisplay.remove_child(item)
	if value:
		$ItemDisplay.add_child(value)
		item = value
	else:
		queue_free()
