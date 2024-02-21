extends Sprite2D

#the projectile
@export var projectile: PackedScene
#the spawn location for the projectiles
@onready var spawn_point: Marker2D = $"Projectile Spawn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_pressed("shoot"):
		shoot()

#handles shooting the projectile
func shoot() -> void:
	var inst: Player_Attack_Projectile = projectile.instantiate()
	get_tree().get_root().add_child(inst)
	inst.transform = spawn_point.global_transform 
