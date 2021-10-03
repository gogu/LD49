extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_moving = false
var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		if modulate.a < .8:
			modulate.a += delta * speed
	else:
		if modulate.a > .08:
			modulate.a -= delta * speed
	pass
