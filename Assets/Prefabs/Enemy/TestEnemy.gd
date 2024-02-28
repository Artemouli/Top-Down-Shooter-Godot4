extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("Player")[0]

func _ready():
	pass 

func _physics_process(_delta: float) -> void:
	#print(player.global_position)
	pass
