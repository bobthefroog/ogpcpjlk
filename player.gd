extends CharacterBody2D

var speed = 100

func _process(delta: float) -> void:
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if velocity.x > 0:
		velocity.x /= 1.25
		
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if velocity.y < 0:
		velocity.y /= 1.25
		
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if velocity.x < 0:
		velocity.x /= 1.25
		
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if velocity.y > 0:
		velocity.y /= 1.25
	move_and_slide()
