extends Marker2D

var smoothed_mouse_pos: Vector2

func _physics_process(_delta: float) -> void:
	smoothed_mouse_pos = lerp(smoothed_mouse_pos, get_global_mouse_position(), 0.3)
	$Weapon.look_at(smoothed_mouse_pos)
	#$Weapon.rotate(get_angle_to(get_viewport().get_mouse_position()))
	#when mouse is on the left side of the player
	if get_local_mouse_position().x < 0:
		$Weapon.position.x = -85
		#IMPORTANT: Set this scale to correctly flip the weapon when facing left
		#the y should be negative for it to be flipped vertically
		$Weapon.scale = Vector2(0.4, -0.4)
	else:
		$Weapon.position.x = 85
		#the y should be positive for it to be unflipped
		$Weapon.scale = Vector2(0.4, 0.4)

