extends CharacterBody2D

var speed = 50
var maxspeed = 300

func _process(delta: float) -> void:
	var dir = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down")).normalized()
	
	velocity += dir*speed
	velocity /= 1.1
	
	#var target = dir*maxspeed
	#velocity = velocity.move_toward(target, speed)
	
	move_and_slide()
	
