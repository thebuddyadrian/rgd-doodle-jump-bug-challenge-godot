extends Node2D

const PLATFORM = preload("res://Objects/Platform.tscn")

var spawn_position := Vector2.ZERO


func _ready():
	yield(get_tree(), "idle_frame")
	generate_platforms()


# Generate platforms for one screen
func generate_platforms():
	spawn_position = Vector2(0, 1920)
	while (spawn_position.y > 0):
		spawn_position.x = rand_range(0, 1080)
		var platform = PLATFORM.instance()
		platform.global_position = global_position + spawn_position
		platform.z_index = -1
		get_parent().add_child(platform)
		spawn_position.y -= rand_range(50, 400)
		

# When the player reaches halfway, generate more platforms
func _on_Area2D_area_entered(area):
	if area.is_in_group("player_collision"):
		position.y -= 1920
		generate_platforms()
