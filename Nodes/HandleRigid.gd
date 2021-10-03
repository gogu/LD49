extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time_count = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if abs(rotation_degrees) < 5:
		time_count += delta
		if (time_count > 3):
			print("success")
			time_count = 0
			var stone = get_node("../StoneRigid")
			stone.refresh()
	else:
		time_count = 0
