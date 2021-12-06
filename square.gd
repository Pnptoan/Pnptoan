extends KinematicBody2D


# Declare member variables here. Examples:
var speed: int = 200
var jumpForce: int = 600
var gravity: int = 800
var velocity: Vector2 = Vector2 () 
var grounded: bool = false
var current_animation = ""
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite
onready var audio_player = $AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
onready var point_control = get_node("/root/game/CanvasLayer/PointControl")
var score : int = 0
func _ready():
	 # Replace with function body.
	audio_player.stream.loop = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = 0
	# movement inputs
	if Input.is_action_pressed("move_left"):
		velocity.x = velocity.x - speed
		#$AnimatedSprite.flip_h = true
		sprite.flip_h = true
	if Input.is_action_pressed("move_right"):
		velocity.x = velocity.x + speed
		#$AnimatedSprite.flip_h = false
		sprite.flip_h = false
	# applying the velocity
	velocity = move_and_slide(velocity, Vector2.UP)

	# gravity
	velocity.y += gravity * delta
	
	# jump input
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpForce
		if not audio_player.playing:
			audio_player.play()

	# get new animation
	var new_animation = get_new_animation()
	if new_animation != current_animation:
		current_animation = new_animation
		#$AnimatedSprite.play(new_animation)
		animation_player.play(new_animation)
	#Kiem tra lot ho
	if kiemtralotho():
		get_tree(). reload_current_scene()

func kiemtralotho():
	var nhanvat_y = self.position.y
	if nhanvat_y >700:
		return true
	else:
		return false

func get_new_animation():
	var animation_new = ""
	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation_new = "move"
		else:
			animation_new = "stand"
	else:
		if velocity.y > 0:
			animation_new = "fall"
		else:
			animation_new = "jump"
	
	return animation_new
 
func collect_coin (value):
	score += value
	point_control.set_score_text(score)
