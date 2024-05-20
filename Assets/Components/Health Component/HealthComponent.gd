extends Node2D

@export var max_health: int
@export var current_health: int = max_health

func decrease_health(damage: int):
	current_health = current_health - damage

