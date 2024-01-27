extends Node3D

@export var spawns: Array[Spawn_info] = [] 

var time = 0

func _on_timer_timeout():
	time += 1
	var enemy_spawns = spawns
	for i in enemy_spawns:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = load(str(i.enemy.resource_path))
				var counter = 0
				while counter < i.enemy_max:
					var spawn_enemy = new_enemy.instantiate()
					spawn_enemy.position = Vector3(randf_range(-5,5), 0, randf_range(-3.5,3.5))
					add_child(spawn_enemy)
					counter += 1
