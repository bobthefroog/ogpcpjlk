extends Node2D

var inconv = 0
var speak = 0
var conv1 = ["hello", "hi", "bye"]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = ""
	speak = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if inconv == 1:
		$Label.text = conv1[speak]
		if Input.is_action_just_pressed("TalkNext") :
			if speak < (len(conv1)-1):
				speak += 1
			else:
				$Label.text = ""
				speak = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	inconv = 1
