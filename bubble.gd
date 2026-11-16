extends Sprite2D

func _process(delta: float) -> void:
	if Global.inconv:
		visible = true
	else:
		visible = false
