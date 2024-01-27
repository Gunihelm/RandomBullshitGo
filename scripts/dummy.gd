extends Pushable
@export var SPEED = 1.0
var destination = Vector3.ZERO


func _physics_process(delta):
	if destination == Vector3.ZERO or position.distance_to(destination) < 1:
		_destination_search()
	if linear_velocity.length() < SPEED and not stumbeled:
		set_constant_force((destination - position).normalized()*10)
	var direction = (destination - position).normalized()
	#linear_velocity = (linear_velocity + direction).normalized()
	constant_force *= 0.9
	if linear_velocity.length()<0.01:
		stumbeled = false
	if global_position.y < 0 and not isVisible():
		queue_free()
	if facing() != -1:
		$Sprite3D.frame_coords.x=facing()

func isVisible():
	var spaceState = get_world_3d().direct_space_state
	var camera = get_tree().root.get_camera_3d()
	var rayEnd = camera.global_position
	var rayOrigin = global_position
	var rayArray = spaceState.intersect_ray(PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd, 0b00000000_00000000_00000000_00001000))
	if rayArray.has("position"):
		return false
	return true

func facing():
	if linear_velocity.length() < 0.5:
		return -1
	var dir = Vector3(linear_velocity.x,0,linear_velocity.z).normalized()
	if dir.z < -sqrt(1.0/2.0):
		return 0
	if dir.z > sqrt(1.0/2.0):
		return 1
	if dir.x < -sqrt(1.0/2.0):
		return 2
	if dir.x > sqrt(1.0/2.0):
		return 3
	return -1

func _destination_search():
	destination = Vector3(randf_range(-4,4), global_position.y, randf_range(-2.25,2.25))
	
