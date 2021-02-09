extends Node2D
tool

var item_name = "Metal Chunk" setget set_item 
var item_quantity

func _ready():
	update_display()
	
func add_item_quantity(amount_to_add):
	item_quantity += amount_to_add
	$Label.text = String(item_quantity)
	
func decrease_item_quantity(amount_to_remove):
	item_quantity -= amount_to_remove
	$Label.text = String(item_quantity)

func update_display():
	var texture_path = "res://Assets/ItemSprites/" + item_name + ".png"
	$TextureRect.texture = load("res://Assets/ItemSprites/" + item_name + ".png")
	var stack_size = int(JsonData.item_data[item_name]["StackSize"])
	item_quantity = randi() % stack_size +1
	
	if stack_size == 1:
		$Label.visible = false
	else:
		$Label.text = String(item_quantity)

func set_item(value):
	item_name = value
	update_display()
