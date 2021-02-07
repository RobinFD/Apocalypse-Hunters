extends KinematicBody2D

signal collect_item(this_item)

var item_name

func _ready():
	item_name = "Mallet"



func _on_Button_pressed():
	emit_signal("collect_item", self)
