extends AnimatedSprite2D
var tween = null
var omove = false
var move = false
var moveing = false

func _ready() -> void:
	#note: 2*PI = 360° <----- i hate radians
	tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "rotation", 0.05, 2)
	tween.chain().tween_property(self, "rotation", -0.05, 2)
	tween.set_loops(-1)

func _process(delta: float) -> void:
	omove = move
	if Global.vel.length() < 80:
		move = false
	else:
		move = true
	
	if move != omove:
		moveing = true
	
	if moveing:
		if move:
			if tween:
				tween.kill()
			tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(self, "rotation", 0.05, 0.15)
			tween.parallel().tween_property(self, "scale", Vector2(1, 1.1), 0.2)
			tween.chain().tween_property(self, "rotation", -0.05, 0.15)
			tween.parallel().tween_property(self, "scale", Vector2(1, 1), 0.2)
			tween.set_loops(-1)
		else:
			if tween:
				tween.kill()
			tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
			tween.parallel().tween_property(self, "scale", Vector2(1, 1), 0.1)
			tween.tween_property(self, "rotation", 0.05, 2)
			tween.chain().tween_property(self, "rotation", -0.05, 2)
			tween.set_loops(-1)
		moveing = false
