extends Node2D

@onready var timer = get_parent().get_parent().get_node("talktimer")
@onready var speedt = get_parent().get_parent().get_node("talkspeed")
@onready var words = $words

@export var npcconv = ["","",""]
@export var pconv = ["","",""]

var pwords = null

var sent = 0
var talk = 0
var done = true
var npcdone = true
var pdone = true

func _ready() -> void:
	pwords = Global.pwords
	words.text = ""
	pwords.text = ""

func _process(delta: float) -> void:
	if get_parent().has_overlapping_bodies():
		if Global.inconv:
			$talk.visible = false
		else:
			$talk.visible = true
		Global.npcpos = get_parent().position
		if Input.is_action_just_pressed("Talk") and done == true and npcdone == true and pdone == true:
			Global.inconv = get_parent().name
			if sent < len(npcconv):
				ptalk()
			else:
				sent = 0
				words.visible = false
				if Global.inconv == get_parent().name:
					Global.inconv = ""
					pwords.visible = false
					wait()
	else:
		$talk.visible = false
		sent = 0
		words.visible = false
		if Global.inconv == get_parent().name:
			Global.inconv = ""
			pwords.visible = false

func ptalk():
	pdone = false
	talk = 0
	words.text = ""
	pwords.text = ""
	pwords.visible = true
	for item in len(pconv[sent]):
		if talk < (len(pconv[sent])):
			pwords.text += pconv[sent][talk]
		talk += 1
		speedt.start()
		await speedt.timeout
	pdone = true
	npctalk()

func npctalk():
	npcdone = false
	talk = 0
	words.visible = true
	for item in len(npcconv[sent]):
		if talk < (len(npcconv[sent])):
			words.text += npcconv[sent][talk]
		talk += 1
		speedt.start()
		await speedt.timeout
	sent += 1
	npcdone = true

func wait():
	done = false
	timer.start()
	await timer.timeout
	done = true
