extends CharacterBody3D

const Pushable = preload("res://scripts/pushable.gd")
const SPEED = 3.0
const JUMP_VELOCITY = 4.5
@export var power = 5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	face()
	hit(0.2)
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Pushable:
			collision.get_collider().apply_central_impulse(-collision.get_normal()*SPEED/5)

func hit(height):
	if Input.is_action_just_pressed("Action"):
		for enemy in $Facing.get_overlapping_bodies():
			if enemy is Pushable:
				enemy._knockback(Vector3($Facing.get_Vec(height))*power+velocity)
	#for enemy in $PushBox.get_overlapping_bodies():
			#if enemy.isEnemy:
				#var direction = enemy.get_global_position()-get_global_position()
				#enemy._knockback(Vector3(direction.x,0,direction.z))

func face():
	$Facing.look_at(ScreenPointToRay(), Vector3.UP)
	$Facing.rotation.x = 0
	var facing = $Facing.get_rotation_degrees().y
	if -45 <= facing and facing < 45:
		$Sprite3D.frame_coords.x = 0
	if 45 <= facing and facing < 135:
		$Sprite3D.frame_coords.x = 2
		$Sprite3D.flip_h = false
	if 135 <= facing or facing < -135:
		$Sprite3D.frame_coords.x = 1
	if -135 <= facing and facing < -45:
		$Sprite3D.frame_coords.x = 2
		$Sprite3D.flip_h = true



func ScreenPointToRay():
	var spaceState = get_world_3d().direct_space_state
	
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera_3d()
	var rayOrigin = camera.project_ray_origin(mousePos)
	var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2000
	var rayArray = spaceState.intersect_ray(PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd, 0b00000000_00000000_00000000_00000100))
	if rayArray.has("position"):
		return rayArray["position"]
	return Vector3()


