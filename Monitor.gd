extends Sprite

export (NodePath) var screen_path
export (NodePath) var room_manager_path
export (NodePath) var monster_manager_path
onready var screen = get_node(screen_path)
onready var room_manager = get_node(room_manager_path)
onready var monster_manager = get_node(monster_manager_path)

const upYPos = -510
const downYPos = 525
const moveSpeed = 1800

var shouldBeDown = false
var current_room = "Kitchen"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (shouldBeDown && get_position().y < downYPos):
		set_position(Vector2(get_position().x, get_position().y + (moveSpeed * delta)))
	elif (!shouldBeDown && get_position().y > upYPos):
		set_position(Vector2(get_position().x, get_position().y - (moveSpeed * delta)))
	pass


func _on_Monitor_Button_pressed():
	shouldBeDown = !shouldBeDown
	

func _on_Channel_Button_pressed(room_name):
	_switch_channel(room_name)
	

func _switch_channel(room_name):
	#show_static()
	
	self.current_room = room_name
	var room = room_manager.get_room(room_name)
	screen.set_texture(room.texture)
	
	draw_monsters()
			
func show_static(duration=0.5):
	$Static.show(duration)
	
func draw_monsters():
	for monster in monster_manager.monsters:			
		monster.visible = (monster.location == self.current_room)	
