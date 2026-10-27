extends CharacterBody2D

var speed = 3000
var current_dir = "_down"
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
	if abs(dir.x) < abs(dir.y):
		if dir.y > 0:
			current_dir = "_down"
			
		else:
			current_dir = "_up"
	else:
		#animated_sprite.flip_h = false
		if dir.x > 0:
			current_dir = "_right"
			#animated_sprite.flip_h = false
		else:
			current_dir = "_left"
			#animated_sprite.flip_h = true
	


func animation_update() -> void:
	if velocity.length() < 10:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk" + current_dir)
