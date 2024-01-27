extends Pushable

const SPEED = 5.0
var destination = Vector3.ZERO

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	

	if destination == Vector3.ZERO or position.distance_to(destination):
		_destination_search()
	_move_to(delta)
 


func _destination_search():
	destination = position + Vector3(randf_range(-10,10), 0, randf_range(-10,10))
	
func _move_to(delta):
	var direction = (destination - position).normalized()
	translate(direction * SPEED * delta)
