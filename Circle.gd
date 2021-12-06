extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Circle_body_entered(body):
	var boides = get_overlapping_bodies()
	for body in boides :
		if body.name == "square":
			print("va cham")
			get_tree(). reload_current_scene()
