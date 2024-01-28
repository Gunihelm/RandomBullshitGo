extends CanvasLayer
@export var Cards = [load("res://scenes/Upgrades/Speed/speed.tscn")]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	$Deck.scale.x = 1.5
	$Deck.scale.y = 1.5
	
	$Deck.add_child(Cards[ randi() % Cards.size() ].instantiate())
	$Deck.add_child(Cards[ randi() % Cards.size() ].instantiate())
	$Deck.add_child(Cards[ randi() % Cards.size() ].instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
