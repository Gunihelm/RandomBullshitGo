class_name weapon extends Node3D

@onready var player = get_node("/root/Game/Player")
var uses
var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	uses = player.itemUses


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees.y = player.getFaceDeg()
	$Sprite3D.flip_h = (player.getFaceDeg()>0)
	$Area3D.scale = Vector3(1,1,1)*pow(1.1,player.range)
	
	if uses <= 0:
		destroy()
	if Input.is_action_just_pressed("Action") and time <= 0:
		for enemy in $Area3D.get_overlapping_bodies():
			if enemy is Pushable:
				enemy._knockback((Vector3(player.getFaceVec())*player.itemPower)/enemy.mass)
			uses -= 1
			time = 60 * pow(0.9,player.itemCdr)
	time -=1
func destroy():
	queue_free()
