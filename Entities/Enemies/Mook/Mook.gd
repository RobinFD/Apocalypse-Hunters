extends KinematicBody2D


var current_health
var max_health = 100

func _ready():
	current_health = max_health

func _on_hit(damage):
	current_health -= damage
	print(current_health)
	if current_health <= 0:
		_on_death()

func _on_death():
	print("Oh! I am slain!")
	queue_free()


