extends Area2D

class_name Player_Attack_Projectile


var speed: float = 2000

#starts the despawn timer
func _ready() -> void:
	$"Despawn Timer".start()

func _physics_process(_delta: float) -> void:
	position += transform.x * speed * _delta

#despawns the bullet projectile once the timer ends
func _on_despawn_timer_timeout() -> void:
	queue_free()
