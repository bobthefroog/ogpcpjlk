extends CharacterBody2D

var speed = 600
var maxspeed = 600

func _process(delta: float) -> void:
	var dir = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	
	if dir and velocity.x < maxspeed and velocity.x > (-1 * maxspeed) and velocity.y < maxspeed and velocity.y > (-1 * maxspeed):
		velocity += dir * speed / 100
	else:
		velocity /= 1.005
	
	move_and_slide()
	
