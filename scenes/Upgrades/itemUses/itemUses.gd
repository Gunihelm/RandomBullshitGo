extends BoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	get_node("/root/Game/Player").itemUses += 1
	
	
	get_tree().paused = false
	get_parent().queue_free()
	
