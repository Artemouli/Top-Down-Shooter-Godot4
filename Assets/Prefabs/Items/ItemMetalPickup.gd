extends AnimatableBody2D

@export var metalAmount: int
var player: CharacterBody2D = null

#because of the collsion layers this will only run if the player runs over it
func _on_collection_area_body_entered(body: CharacterBody2D) -> void:
	#gets the child Inventory node from the player, and accesses the increaseMetalCount script
	body.get_node("Inventory").increaseMetalCount(metalAmount)
	player = body

func _physics_process(_delta: float) -> void:
	if player != null:
		global_position = global_position.lerp(player.global_position, 0.07)


func _on_pickup_collision_body_entered(_body: CharacterBody2D) -> void:
	queue_free()
