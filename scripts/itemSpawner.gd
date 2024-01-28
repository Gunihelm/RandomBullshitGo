extends Node3D
@export var items: Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if randf_range(0,1)>get_node("/root/Game/Player").itemSpawnChance:
		pass
	else:
		var item
		if %Spawner.wave == -1:
			item = items[0].instantiate()
		else:
			item = items[randi_range(1,items.size()-1)].instantiate()
		item.position = Vector3(randf_range(-4,4), 0, randf_range(-2.5,2.5))
		get_node("/root/Game").add_child(item)
