extends Node3D

@export var upgrade_menu: PackedScene
@export var spawns: Array[Spawn_info] = [] 
@onready var onplatform = %onPlatform
var mob_maximum = [3, 8, 13, 18, 21]
var wave = 0
var time = 0
var total_spawned = 0

func _on_timer_timeout():
	time += 1
	if onplatform.mob_counter == 0 && total_spawned < mob_maximum[wave]:
		_spawn()
	elif total_spawned >= mob_maximum[wave] && onplatform.mob_counter == 0:
		on_wave_end()

func _spawn():
	var enemy_spawns = spawns
	for i in enemy_spawns:
		var new_enemy = load(str(i.enemy.resource_path))
		var spawn_enemy = new_enemy.instantiate()
		spawn_enemy.position = Vector3(randf_range(-4,4), 0, randf_range(-2.5,2.5)-1)
		spawn_enemy.mass *= pow(1.02,wave)
		spawn_enemy.mass *= pow(0.95,%Player.enemyHelium)
		add_child(spawn_enemy)
		total_spawned += 1
		print(total_spawned)
		if onplatform.mob_counter >= wave or total_spawned > mob_maximum[wave]:
			break

func on_wave_end():
	total_spawned = 0
	var upgrade = upgrade_menu.instantiate()
	get_parent().add_child(upgrade)
	if(wave < 4):
		_create_maximum(wave)
	wave += 1

func _create_maximum(wave):
	var new_maximum
	new_maximum = round((mob_maximum.back() * 1.25))
	mob_maximum.append(new_maximum)
