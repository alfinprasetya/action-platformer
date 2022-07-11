extends KinematicBody2D

var velocity = Vector2.ZERO
var jump_counter = 0
export var SPEED = 200
export var GRAVITY = 30
export var JUMPFORCE = -1000

func _physics_process(delta):
	
	#Player Controller
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	
	#Jump Logic
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	
	#Double jump logic
	#if is_on_floor():
	#	jump_counter = 0
	#if Input.is_action_just_pressed("jump") and jump_counter < 2:
	#	velocity.y = JUMPFORCE
	#	jump_counter += 1
	
	#Gravity physics
	velocity.y = velocity.y + GRAVITY
	
	#Method to move player
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	print(jump_counter)
