extends Resource

class_name Waves

var mob_maximum = [3, 8, 13, 18, 21]

func _create_maximum(wave):
	var new_maximum
	new_maximum = mob_maximum.back() * 1.25
	mob_maximum.append(new_maximum)
