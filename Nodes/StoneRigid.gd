extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var particle: CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready():
	particle = get_node("CPUParticles2D")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Refresh"):
		apply_impulse(Vector2.ZERO, Vector2.UP * 15000)
		weight = rand_range(400, 700)
		yield(get_tree().create_timer(.5), "timeout")
		particle.restart()

