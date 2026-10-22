extends Node2D

var zooming = false
var gen = 1.5
var talk = 2.5
var genzoom = Vector2(1.5, 1.5)
var talkzoom = Vector2(2.5, 2.5)
var speed = 5.0

func _process(delta: float) -> void:
	if Global.iconv:
		position = get_parent().get_node("Player").position.lerp(Global.npcpos, 0.5)
		$Camera2D.zoom = $Camera2D.zoom.lerp(talkzoom, speed*delta)
	else:
		speed = 3
		position = get_parent().get_node("Player").position
		$Camera2D.zoom = genzoom

func zooom():
	print("e")
	zooming = true
	for i in range(10):
		$Camera2D.zoom = genzoom.lerp(talkzoom, speed)
		speed += 0.1
		
	zooming = false
