extends Node

const room_list = ["Kitchen", "Bathroom", "Lounge", "Office"]

const room_coords = {	"Kitchen": 	Vector2(0,0),
						"Bathroom": Vector2(0,1),
						"Lounge": 	Vector2(0,2),
						"Office": 	Vector2(0,3)}

# TODO maybe make a room class that stores name and coords instead of original room classs
# the AStar can take care of the connections

# TODO each monster has its own AStar? this way they can have different weights

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
	get_default_astar()

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

func get_default_astar():
	var astar = AStar2D.new()
	
	for i in range(0, len(room_list)):
		astar.add_point(i, room_coords[room_list[i]])
	
	astar.connect_points(0, 1)
	astar.connect_points(1, 2)
	astar.connect_points(2, 3)	

	for id in astar.get_id_path(1, 3):
		print(room_list[id])
	
	return astar
