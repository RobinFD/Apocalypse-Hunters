extends Camera2D


export(NodePath) var target
var target_node

# Called when the node enters the scene tree for the first time.
func _ready():
	target_node = get_node(target)

func _process(delta):
	position = lerp(position, target_node.position, 10 * delta)
