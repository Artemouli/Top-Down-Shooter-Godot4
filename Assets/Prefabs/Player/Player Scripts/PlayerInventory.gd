extends Node2D
class_name PlayerInventory

@export var player_metal_amount: int


func increaseMetalCount(pickupAmount: int) -> void:
	player_metal_amount += pickupAmount
	print(player_metal_amount)
	
func decreaseMetalCount(decreaseAmount: int) -> void:
	player_metal_amount -= decreaseAmount
