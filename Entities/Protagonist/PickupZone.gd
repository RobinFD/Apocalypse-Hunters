extends Area2D

signal item_collected(item)

func _ready():
	pass # Replace with function body.


var items_in_range = {}


func _on_PickupZone_body_entered(body):
	items_in_range[body] = body
	body.connect("collect_item", self, "item_collected")


func _on_PickupZone_body_exited(body):
	if items_in_range.has(body):
		body.disconnect("collect_item", self, "item_collected")
		items_in_range.erase(body)

func item_collected(item):
	emit_signal("item_collected", item)
