extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show(duration=0.5):
	if (get_parent().get_position().y < -410): # don't show static if monitor is offscreen
		return
		
	visible = true		
	$AudioStreamPlayer.play()
	
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(duration)
	timer.connect("timeout", self, "_timer_callback")
	add_child(timer) 
	timer.start()	
		
func _timer_callback():
	visible = false
