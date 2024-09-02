extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if $Player.position.y <= $Camera2D.position.y:
		$Camera2D.position.y = $Player.position.y

func _on_PlayButton_pressed():
	$Player.start()
	$PlayButton.queue_free()


func _on_DeathArea_area_entered(area):
	if area.is_in_group("player_collision"):
		get_tree().reload_current_scene()
