extends CharacterBody2D

var speed = 3000
var current_dir = "none"
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	var dir = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down")).normalized()
	
	velocity += dir * speed * delta
	velocity /= 1.15
	
	move_and_slide()
	animation_update()
	direction_update(dir)

func direction_update(dir: Vector2) -> void:
	if dir == Vector2.ZERO:
		return
	if abs(dir.x) > abs(dir.y):
		animated_sprite.flip_h = false
		if dir.x > 0:
			current_dir = "_right"
			animated_sprite.flip_h = false
		else:
			current_dir = "_left"
			animated_sprite.flip_h = true
	else:
		
		if dir.y > 0:
			current_dir = "_up"
			
		else:
			current_dir = "_down"
			
	


func animation_update() -> void:
	if velocity.length() < 10:
		if current_dir == "none":
			animated_sprite.play("idle_down_1")
		else:
			animated_sprite.play("idle" + current_dir)
	else:
		animated_sprite.play("walk" + current_dir)
