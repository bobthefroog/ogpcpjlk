extends Node2D

var zooming = false
var gen = 1.5
var talk = 2.5
var genzoom = Vector2(1.5, 1.5)
var talkzoom = Vector2(2.5, 2.5)
var speed = 3.5

func _process(delta: float) -> void:
	if Global.iconv:
		if Global.cn != "conv0":
			Global.npcpos = get_parent().get_node(Global.cn).position
			position = get_parent().get_node("Player").position.lerp(Global.npcpos, 0.5)
			$Camera2D.zoom = $Camera2D.zoom.lerp(talkzoom, speed*delta)
	else:
		speed = 3.5
		position = get_parent().get_node("Player").position
		$Camera2D.zoom = $Camera2D.zoom.lerp(genzoom, 5*delta)
