extends Node3D

@export var upgrade_menu: PackedScene
@export var spawns: Array[Spawn_info] = [] 
@onready var onplatform = %onPlatform
var mob_maximum = [3, 8, 13, 18, 21]
var wave = 0
var time = 0
var total_spawned = 0
var cooldown

func _on_timer_timeout():
	time += 1
	print(onplatform.mob_counter)
	if onplatform.mob_counter == 0 && total_spawned == 0:
		while total_spawned < mob_maximum[wave]:
			_spawn()
	elif onplatform.mob_counter == 0:
		on_wave_end()

func _spawn():
	var enemy_spawns = spawns
	for i in enemy_spawns:
		if time >= i.time_start:
			if i.spawn_delay_counter < i.spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = load(str(i.enemy.resource_path))
				var spawn_enemy = new_enemy.instantiate()
				spawn_enemy.position = Vector3(randf_range(-5,5), 0, randf_range(-3.5,3))
				spawn_enemy.mass *= pow(0.95,%Player.enemyHelium)
				add_child(spawn_enemy)
				total_spawned += 1

func on_wave_end():
	total_spawned = 0
	var upgrade = upgrade_menu.instantiate()
	wave += 1
	wave_start(wave)
	get_parent().add_child(upgrade)

func wave_start(wave: int):
	pass

func _create_maximum(wave):
	var new_maximum
	new_maximum = mob_maximum.back() * 1.25
	mob_maximum.append(new_maximum)
