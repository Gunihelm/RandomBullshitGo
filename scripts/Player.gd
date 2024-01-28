extends CharacterBody3D

const Pushable = preload("res://scripts/pushable.gd")
@export var speed = 3.0
@export var power = 5
@export var itemUses = 1
@export var itemCdr = 0
@export var size = 0
@export var range = 0
@export var kickHeight = 0.2
@export var enemyHelium = 0
@export var itemPower = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	scale = Vector3(pow(1.1,size),pow(1.1,size),pow(1.1,size))

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	face()
	hit(kickHeight)
	move_and_slide()
	position.y= 0.482
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is Pushable:
			collision.get_collider().apply_central_impulse(-collision.get_normal()*speed/5)
			collision.get_collider().stumbeled = true

func hit(height):
	if Input.is_action_just_pressed("Action"):
		for enemy in $Facing.get_overlapping_bodies():
			if enemy is Pushable:
				enemy._knockback((Vector3($Facing.get_Vec(height))*power+velocity/speed)/enemy.mass)
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
	if 135 <= facing or facing < -135:
		$Sprite3D.frame_coords.x = 1
	if -135 <= facing and facing < -45:
		$Sprite3D.frame_coords.x = 3
		
func getFaceDeg():
	return $Facing.get_rotation_degrees().y


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


