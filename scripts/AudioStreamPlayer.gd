extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	volume_db = -20



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	play()
