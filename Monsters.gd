extends Node

export (NodePath) var timer_path
export (NodePath) var monitor_path
onready var timer = get_node(timer_path)
onready var monitor = get_node(monitor_path)


#class Monster:		
#	var location
#	var egg_texture
#	var adult_texture
#
#	func _init(room_name):
#		self.location = room_name
#		self.egg_texture = load("res://assets/egg3.png")	

var monsters = []



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#var alien = load("res://Alien.tscn")
	#var alien_instance = alien.instance()
		#scene_instance.set_name("scene")
	#monitor.add_child(alien_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_monsters_in_room(room_name):
	var monsters_in_room = []
	
	for monster in monsters:
		if (monster.location == room_name):
			monsters_in_room.append(monster);
	
	return monsters_in_room


func _on_Spawn_Timer_timeout():
	var alien = load("res://Alien.tscn")
	var alien_instance = alien.instance()
	#scene_instance.set_name("scene")
	monitor.add_child(alien_instance)
	
	self.monsters.append(alien_instance)
	
	if (alien_instance.location != monitor.current_room):
		alien_instance.visible = false
	#TODO replace above with draw_monsters()?
