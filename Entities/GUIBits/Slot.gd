extends Panel

var default_texture = preload("res://Assets/UIbits/inventoryitem.png")
var empty_texture = preload("res://Assets/UIbits/equipmentitem.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var ItemClass = preload("res://Entities/Items/Item.tscn")
var item = null setget put_into_slot

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_texture
	empty_style.texture = empty_texture
	
	if randi() % 2 == 0:
		item = ItemClass.instance()
		add_child(item)
	_refresh_style()

func _refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)
	else:
		set('custom_styles/panel', default_style)

func pick_from_slot():
	remove_child(item)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(item)
	item = null
	_refresh_style()

func put_into_slot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(item)
	add_child(item)
	_refresh_style()
