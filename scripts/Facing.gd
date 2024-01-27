extends Area3D

func get_Vec():
	return ($Point.get_global_position() - get_global_position()).normalize()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
