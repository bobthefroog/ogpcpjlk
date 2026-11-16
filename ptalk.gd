extends Node2D

@onready var speedt = get_parent().get_parent().get_node("talkspeed")

func _ready() -> void:
	Global.pwords = $Label

func _process(delta: float) -> void:
	pass
