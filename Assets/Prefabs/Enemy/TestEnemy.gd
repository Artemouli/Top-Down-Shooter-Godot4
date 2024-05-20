extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var metal = preload("res://Assets/Prefabs/Items/Pickup Test 2.0.tscn")
@onready var health_script = $"Health Component"

const speed = 550
#this is for when the enemie turns
const friction: float = 0.1
#@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	#velocity = dir * speed
	velocity = lerp(velocity, dir * speed, friction)
	move_and_slide()
	
	
	
func make_path() -> void:
	nav_agent.target_position = player.global_position
	
func die() -> void:
	if(is_queued_for_deletion() != true):
		var instance = metal.instantiate()
		get_tree().get_root().add_child(instance)
		instance.transform = global_transform
	queue_free()

func _on_timer_timeout():
	make_path()


func _on_hitbox_area_entered(area):
	#print(health_script.current_health)
	if area.is_in_group("Player_Projectile"):
		if health_script.current_health > 0:
			health_script.decrease_health(area.damage)
		else:
			die()
