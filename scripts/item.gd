class_name item extends Node3D
@export var weapon: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for collider in $collect.get_overlapping_bodies():
			if collider is CharacterBody3D:
				for node in collider.get_children():
					if node.has_method("destroy"):
						node.destroy()
				collider.add_child(weapon.instantiate())
				queue_free()
