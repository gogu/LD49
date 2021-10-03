extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var particle: CPUParticles2D
var sfx: AudioStreamPlayer2D
const colors = [
		Color(1.0, 1.0, 1.0, 1.0),
		Color(0.695313, 0.214569, 0.214569, 1),
		Color(0.317647, 0.196078, 0.698039, 1),
		Color(0, 0.722656, 0.197601, 1),
		Color(0.368627, 0.12549, 0.152941)
	]
var prev_color = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	particle = get_node("CPUParticles2D")
	sfx = get_node("AudioStreamPlayer2D")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Refresh"):
		refresh()

func refresh():
	var color_idx = randi() % colors.size()
	while (prev_color == color_idx):
		color_idx = randi() % colors.size()
	modulate = colors[color_idx]
	prev_color = color_idx
	apply_impulse(Vector2.ZERO, Vector2.UP * 15000)
	weight = rand_range(400, 700)
	yield(get_tree().create_timer(.5), "timeout")
	particle.restart()
	sfx.play()
