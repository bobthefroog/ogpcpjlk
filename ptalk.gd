extends Node2D

var speak = 0
var conv1 = ["hello", "wassup", "dxgfhnz"]
var talk = 0
var ospeak = -1
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
			if speak < (len(conv1)-1):
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
		for i in len(conv1[speak]):
			if talk < (len(conv1[speak])):
				$Label.text += conv1[speak][talk]
			talk += 1
			speedt.start()
			await speedt.timeout
		Global.pdone = true
		Global.pldone.emit()
