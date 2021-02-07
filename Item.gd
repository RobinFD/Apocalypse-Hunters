extends Node2D


func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://Assets/Item Sprites/19.png")
	else:
		$TextureRect.texture = load("res://Assets/Item Sprites/3.png")
