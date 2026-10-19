extends Node2D

var talk = 0
var speak = 0
var conv1 = ["hi", "yup", "edwyzytwdt"]
var ospeak = -1
var done = false
@onready var timer = get_parent().get_parent().get_node("talktimer")
@onready var speedt = get_parent().get_parent().get_node("talkspeed")

func _ready() -> void:
	$Label.text = ""
	speak = 0

func _process(delta: float) -> void:
	if Global.iconv == 1:
		Global.npcpos = get_parent().position
		if speak != ospeak:
			talk = 0
			$Label.text = ""
			if done == true and Global.pdone == true:
				done = false
				talking()
				ospeak = speak
		if Input.is_action_just_pressed("TalkNext") and Global.pdone == true:
			if speak < (len(conv1)-1):
				$Label.text = ""
				pdone()
			else:
				$Label.text = ""
				speak = 0
				Global.iconv = 0
				ospeak = -1
	else:
		$Label.text = ""
		speak = 0
		ospeak = -1
		done = true

func talking():
	talk = 0
	for item in len(conv1[speak]):
		if talk < (len(conv1[speak])):
			$Label.text += conv1[speak][talk]
		talk += 1
		speedt.start()
		await speedt.timeout
	done = true

func _on_conv_1_body_entered(body: Node2D) -> void:
	Global.iconv = 1
	
func _on_conv_1_body_exited(body: Node2D) -> void:
	Global.iconv = 0

func pdone():
	await Global.pldone
	speak += 1 
