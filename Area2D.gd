extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var value = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
# rotate 90 degrees a second
	rotation_degrees += 90 * delta

func _on_coin_body_entered(body):
	var boides = get_overlapping_bodies()
	for body in boides :
		if body.name == "character":
				body.collect_coin (value)
				self.queue_free()# Quai vat chet
			
