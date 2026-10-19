extends Sprite2D

func _process(delta: float) -> void:
	if Global.iconv:
		visible = true
	else:
		visible = false
