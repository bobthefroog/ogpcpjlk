extends Node2D

var talk = 0
var speak = 0
var conv0 = [""]
var conv1 = ["hi", "yup", "edwyzytwdt"]
var conv2 = ["1", "2", "3"]
var ospeak = -1
var done = false
@onready var timer = get_parent().get_parent().get_node("talktimer")
@onready var speedt = get_parent().get_parent().get_node("talkspeed")

func _ready() -> void:
	$Label.text = ""
	speak = 0

func _process(delta: float) -> void:
	if Global.iconv == 1:
		if Global.cn != "conv0":
			Global.npcpos = get_parent().get_parent().get_node(Global.cn).position
			if speak != ospeak:
				talk = 0
				$Label.text = ""
				if done == true and Global.pdone == true:
					done = false
					talking()
					ospeak = speak
			if Input.is_action_just_pressed("TalkNext") and Global.pdone == true:
				if speak < (len(Global.current)-1):
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
	for item in len(Global.current[speak]):
		if talk < (len(Global.current[speak])):
			$Label.text += Global.current[speak][talk]
		talk += 1
		speedt.start()
		await speedt.timeout
	done = true

func pdone():
	await Global.pldone
	speak += 1 

func _on_conv_1_body_entered(_body: Node2D) -> void:
	Global.iconv = 1
	Global.current = conv1
	Global.cn = "conv1"
func _on_conv_1_body_exited(_body: Node2D) -> void:
	Global.iconv = 0
	Global.current = conv0
	Global.cn = "conv0"


func _on_conv_2_body_entered(_body: Node2D) -> void:
	Global.iconv = 1
	Global.current = conv2
	Global.cn = "conv2"
func _on_conv_2_body_exited(_body: Node2D) -> void:
	Global.iconv = 0
	Global.current = conv0
	Global.cn = "conv0"
