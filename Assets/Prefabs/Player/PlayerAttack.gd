extends Sprite2D

#the projectile
@export var projectile: PackedScene
#Amount of projectiles
@export var count: int = 12
#the spawn location for the projectiles
@onready var spawn_point: Marker2D = $"Projectile Spawn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"): #Input.is_action_pressed("shoot"):
		shoot()

#handles shooting the projectile
func shoot() -> void:
	for n in count:
		var inst: Player_Attack_Projectile = projectile.instantiate()
		get_tree().get_root().add_child(inst)
		spawn_point.rotation = deg_to_rad(randi_range(-5, 5)) 
		inst.transform = spawn_point.global_transform 

