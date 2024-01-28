extends CanvasLayer

@onready var Deck = get_node("CenterContainer/Deck")
@export var Cards = [load("res://scenes/Upgrades/Speed/speed.tscn"),
load("res://scenes/Upgrades/enemyHelium/enemyHelium.tscn"),
load("res://scenes/Upgrades/itemCdr/itemCdr.tscn"),
load("res://scenes/Upgrades/itemPower/itemPower.tscn"),
load("res://scenes/Upgrades/itemUses/itemUses.tscn"),
load("res://scenes/Upgrades/itemCdr/itemCdr.tscn"),
load("res://scenes/Upgrades/itemSpawnChance/itemSpawnChance.tscn"),
load("res://scenes/Upgrades/size/size.tscn"),
load("res://scenes/Upgrades/range/range.tscn"),
load("res://scenes/Upgrades/kichHightAdd/kichHightAdd.tscn"),
load("res://scenes/Upgrades/kichHightSub/kichHightSub.tscn"),
load("res://scenes/Upgrades/enemyHelium/enemyHelium.tscn"),
load("res://scenes/Upgrades/itemPower/itemPower.tscn")]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	
	Deck.add_child(Cards[ randi() % Cards.size() ].instantiate())
	Deck.add_child(Cards[ randi() % Cards.size() ].instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
