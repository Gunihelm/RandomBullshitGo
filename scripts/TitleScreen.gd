extends Control

var start_button = Button.new()
var time = 0.0
func _process(delta):
	$Titel.position = Vector2(0,10*sin(time))
	time += 0.05
	if time > 20*PI:
		time = 0
	$StartButton.position = Vector2(0,10*sin(time+2))

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
