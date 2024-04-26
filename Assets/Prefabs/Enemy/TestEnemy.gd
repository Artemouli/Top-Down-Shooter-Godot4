extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("Player")[0]

const speed = 550

#@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(_delta: float) -> void:
	#print(player.global_position)
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()
	
	
func make_path() -> void:
	nav_agent.target_position = player.global_position

func _on_timer_timeout():
	make_path()
