extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var moveStep = 5
var isMoving = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if mode != RigidBody2D.MODE_RIGID:
		mode = RigidBody2D.MODE_RIGID
	move()
	pass

func move():
	var nextPos = NAN
	if Input.is_action_pressed("move_left"):
		nextPos = position.x - moveStep
		isMoving = true
	elif Input.is_action_pressed("move_right"):
		nextPos = position.x + moveStep
		isMoving = true
	else:
		isMoving = false

	if nextPos > 0 and nextPos < 400:
		mode = RigidBody2D.MODE_KINEMATIC
		position = Vector2(nextPos, position.y)
		print(nextPos)
	pass
