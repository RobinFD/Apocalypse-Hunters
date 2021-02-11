extends KinematicBody2D


var current_speed = 0 #How fast the protag is going
var top_speed = 500 #How fast we will allow the protag to go
var accel_speed = 2000 #How fast the protag gets up to speed from a standstill
var destination: Vector2 #Where our protag is going to
var moving = false #Whether or not our protag is moving
var current_health #Our protag's precious life juices
var max_health = 100 #Our protag's maximum capacity for precious life juices

var bolt = preload("res://Entities/Skills/Bolt.tscn")
var can_fire = true
var rate_of_fire = 0.4
var shooting = false



#This thing makes it so if I click a menu the protag won't get overzealous and dive to the spot underneath it
func _unhandled_input(event):
	if Input.is_action_pressed("left_click"):
		destination = get_global_mouse_position()

#Process runs every frame
func _process(delta):
	_movement(delta)
	_skill_loop()

#Makes us go by doing all the crunchy bits
func _movement(delta):
	if destination:
		var distance = (destination - position)
		if distance.length() < 10:
			moving = false
			current_speed = 0
			return
		moving = true
		current_speed += accel_speed*delta
		if current_speed > top_speed:
			current_speed = top_speed
		var heading = distance.normalized()
		move_and_slide(heading * current_speed)


func _skill_loop():
	if Input.is_action_pressed("shoot") and can_fire == true:
		can_fire = false
		shooting = true
		current_speed = 0
		get_node("TurnAxis").rotation = get_angle_to(get_global_mouse_position())
		var bolt_instance = bolt.instance()
		bolt_instance.position = get_node("TurnAxis/CastPoint").get_global_position()
		bolt_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(bolt_instance)
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(rate_of_fire), "timeout")
		can_fire = true
		shooting = false
		


func _on_PickupZone_item_collected(item_drop):
	var temp_item = item_drop.item
	item_drop.item = null
	if $CanvasLayer/Inventory.add_item(temp_item):
		item_drop.queue_free()
	else:
		item_drop.item = temp_item
	 # Add this function to the inventory when you come back.
	# Bren thinks we'll probably need to make the items able to generate via name rather than randomly
	# before we can get add item to work.
