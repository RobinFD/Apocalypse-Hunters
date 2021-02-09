extends KinematicBody2D
tool

signal collect_item(this_item)

export(String) var item_id
var item setget set_item

func _ready():
	item = $ItemDisplay/Item
	item.item_name = item_id
	match item.item_rarity:
		"Basic":
			$RarityParticle.process_material = load("res://Assets/ParticleMaterials/BasicItemParticle.tres")
		"Rare":
			$RarityParticle.process_material = load("res://Assets/ParticleMaterials/RareItemParticle.tres")
		var unknown_rarity:
			$RarityParticle.process_material = load("res://Assets/ParticleMaterials/BasicItemParticle.tres")

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
