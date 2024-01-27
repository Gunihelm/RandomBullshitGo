extends Area3D

var mob_counter

func _process(delta):
	mob_counter = get_overlapping_bodies().size() - 3
