class_name Pushable extends RigidBody3D
var stumbeled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _integrate_forces(state):
	#angular_velocity = Vector3(0,0,0)
	#rotation = Vector3(0,0,0)
	

func _knockback(input):
	linear_velocity += input
	stumbeled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
