extends CharacterBody2D

var speed = 3000

func _physics_process(delta: float) -> void:
	var dir = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down")).normalized()
	
	velocity += dir * speed * delta
	velocity /= 1.15
	
	move_and_slide()
	
