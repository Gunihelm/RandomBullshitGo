extends RigidBody3D
const isEnemy = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _knockback(input):
	linear_velocity = input
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
