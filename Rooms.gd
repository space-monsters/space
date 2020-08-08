extends Node

const room_list = ["Kitchen", "Bathroom", "Lounge", "Office"]

class Room:
	var name
	var connections = []
	var texture
	
	func _init(room_name):
		self.name = room_name
		if (room_name != "Office"):
			self.texture = load("res://assets/rooms/" + name + ".jpg")		
		
# dictionary connecting names of room to the respective room object
var rooms = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	_create_rooms()
	_create_connections()


func _create_rooms():
	for room in room_list:
		rooms[room] = Room.new(room)


func _create_connections():
	_make_connection("Kitchen", "Bathroom")	
	_make_connection("Bathroom", "Lounge")
	_make_connection("Lounge", "Office")	
	
func _make_connection(room1_name, room2_name):
	var room1 = get_room(room1_name)
	var room2 = get_room(room2_name)		
	room1.connections.append(room2)
	room2.connections.append(room1)

# returns the room object associated with the name
func get_room(name):
	return rooms[name]
