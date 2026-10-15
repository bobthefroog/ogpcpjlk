extends Node2D

var speak = 0
var conv1 = ["hi", "yup", "edwyzytwdt"]

@onready var timer = get_parent().get_parent().get_node("talktimer")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = ""
	speak = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.iconv == 1:
		$Label.text = conv1[speak]
		if Input.is_action_just_pressed("TalkNext"):
			if speak < (len(conv1)-1):
				timer.start()
				#try to find out how to add timer timeout in this part
				if timer.is_stopped():
					speak += 1
			else:
				$Label.text = ""
				speak = 0
				Global.iconv = 0
	else:
		$Label.text = ""
		speak = 0

func _on_conv_1_body_entered(body: Node2D) -> void:
	Global.iconv = 1

func _on_conv_1_body_exited(body: Node2D) -> void:
	Global.iconv = 0


func _on_talktimer_timeout() -> void:
	print("rhdgiryudghruidhg")
