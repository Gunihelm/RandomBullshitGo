extends Pushable
@export var SPEED = 1.0
var destination = Vector3.ZERO


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	

	if destination == Vector3.ZERO or position.distance_to(destination) < 0.5:
		_destination_search()
	if linear_velocity.length() < SPEED and not stumbeled:
		set_constant_force((destination - position).normalized()*10)
	var direction = (destination - position).normalized()
	#linear_velocity = (linear_velocity + direction).normalized()
	constant_force *= 0.9
	if linear_velocity.length()<0.01:
		stumbeled = false
 


func _destination_search():
	destination = Vector3(randf_range(-4,4), 0, randf_range(-2.25,2.25))
	
