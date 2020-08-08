extends Sprite

const move_order = ["Kitchen", "Bathroom", "Lounge", "Office"]	

var location = "Kitchen"
var egg_texture = load("res://assets/egg.png")	
var adult_texture = load("res://assets/alien.png")
var draw_location = Vector2(1180, 750)
var next_action = "Hatch"


# TODO send a signal to monitor when moving?


func _ready():
	_show_static_if_visible()
	pass # Replace with function body.

func _move():
	var destination = move_order[move_order.find(location) + 1]
	self.location = destination
	print("moved to " + location)
	
	_show_static_if_visible()
	
	if (location == "Office"):
		_reached_office()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	_show_static_if_visible()
	
	if (next_action == "Hatch"):
		_hatch()
		next_action = "Move"
	elif (next_action == "Move"):		
		if (location != "Office"): # TODO should probably disable the timer or something instead when _move()ing into office
			_move()

func _hatch():
	set_texture(adult_texture)
	#self.draw_location = Vector2(1480, 760)
	set_position(Vector2(175, 30))
	set_scale(Vector2(0.5, 0.5))
	
func _show_static_if_visible():
	
	# TODO send signal to monitor along with self.location argument
	
	var monitor = get_parent()
	
	if (monitor.current_room == self.location):
		monitor.show_static()
		
	monitor.draw_monsters()
	
func _reached_office():
	# TODO maybe delete this node and spawn a new one that isn't a child of monitor?
	# or change this node's parent?
	pass
