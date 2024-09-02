extends Node2D

const JUMP_STRENGTH: float = 2000.0
const GRAVITY: float = 2500.0
const MOVE_SPEED: float = 2000.0

var velocity: Vector2 = Vector2.ZERO
var game_started: bool = false


func start():
	game_started = true
	jump()


func _physics_process(delta):
	if game_started:
		# Gravity and movement
		velocity.y += GRAVITY * delta
		position += velocity * delta
		position.x = position.move_toward(get_global_mouse_position(), MOVE_SPEED * delta).x
		
		# Make player face in the movement direction
		if get_global_mouse_position().x > position.x:
			$Sprite.scale.x = 1
		elif get_global_mouse_position().x < position.x:
			$Sprite.scale.x = -1


func jump():
	velocity.y = -JUMP_STRENGTH


# Jump when touched platform
func _on_collision_detected(area):
	if area.is_in_group("platform_collision"):
		if velocity.y < 0:
			jump()
