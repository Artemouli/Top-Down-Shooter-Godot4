extends Marker2D

var smoothed_mouse_pos: Vector2

func _physics_process(_delta: float) -> void:
	smoothed_mouse_pos = lerp(smoothed_mouse_pos, get_global_mouse_position(), 0.3)
	$Weapon.look_at(smoothed_mouse_pos)
	#$Weapon.rotate(get_angle_to(get_viewport().get_mouse_position()))
	if get_local_mouse_position().x < 0:
		$Weapon.position.x = -85
		$Weapon.flip_v = true
	else:
		$Weapon.position.x = 85
		$Weapon.flip_v = false
