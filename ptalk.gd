extends Node2D

var speak = 0
var conv0 = [""]
var conv1 = ["hello", "wassup", "dxgfhnz"]
var conv2 = ["4", "5", "6"]
var talk = 0
var ospeak = -1
var current = conv1
@onready var speedt = get_parent().get_parent().get_node("talkspeed")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = ""
	speak = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.iconv == 1:
		if speak != ospeak:
			talk = 0
			$Label.text = ""
			if Global.pdone == true:
				Global.pdone = false
				talking()
		ospeak = speak
		if Input.is_action_just_pressed("TalkNext") and Global.pdone == true:
			if speak < (len(current)-1):
				speak += 1
			else:
				$Label.text = ""
				speak = 0
				Global.iconv = 0
				ospeak = -1
	else:
		$Label.text = ""
		speak = 0
		ospeak = -1

func talking():
		for i in len(current[speak]):
			if talk < (len(current[speak])):
				$Label.text += current[speak][talk]
			talk += 1
			speedt.start()
			await speedt.timeout
		Global.pdone = true
		Global.pldone.emit()

#make a new func to make it so ex: global cn = conv1 then player current = conv1 and so on
