extends Camera2D




# The size of the screen
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = self.get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var player_pos: Transform2D = get_node("../square").get_global_transform_with_canvas()
	var square_pos = player_pos.get_origin()	
	#var new_y = square_pos.y - screen_size.y / 1.2
	#var new_camera_pos = Vector2(0, new_y)
	
	var new_x =  square_pos.x - screen_size.x / 4
	var new_camera_pos = Vector2(new_x, 0)
	
	# Update position of the camera.
	position += new_camera_pos * get_zoom()
	update_viewport()
	
func update_viewport():
	var canvas_transform = self.get_viewport().get_canvas_transform()
	canvas_transform.origin = -self.global_position + screen_size / 2.0
	self.get_viewport().set_canvas_transform(canvas_transform)
