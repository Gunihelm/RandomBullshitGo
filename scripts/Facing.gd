extends Area3D

func get_Vec(height):
	return(Vector3($Point.get_global_position().x,$Point.get_global_position().y+height,$Point.get_global_position().z) - get_global_position()).normalized()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
