extends Control

@onready var platform = %onPlatform
@onready var bar = get_node("CenterContainer/TextureProgressBar")
@onready var bar2 = get_node("CenterContainer2/TextureProgressBar")
@onready var player = %Player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bar.value = bar.max_value - platform.mob_counter
	bar2.value = bar2.max_value - player.ulti
