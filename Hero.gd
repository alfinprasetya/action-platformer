extends KinematicBody2D

const SPEED = 200
const GRAVITY = 20
const JUMPFORCE = -550
const FALL_SPEED = 1000

var velocity = Vector2.ZERO
var jump_counter = 0


func _ready():
	$AnimationTree.active = true

func _physics_process(delta):
	
	$AnimationTree.set("parameters/ground/current", 0)
	
	#Player Controller
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimationTree.set("parameters/ground/current", 1)
		$Sprite.flip_h = false
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimationTree.set("parameters/ground/current", 1)
		$Sprite.flip_h =  true
	
	if $RayCast2D.is_colliding():
		$AnimationTree.set("parameters/state/current", 1)
	else:
		$AnimationTree.set("parameters/state/current", 0)
	
	#Jump Logic
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$AnimationTree.set("parameters/air/current", 0)
		velocity.y = JUMPFORCE
	
	if velocity.y > 0:
		$AnimationTree.set("parameters/air/current", 1)
	
	#Double jump logic
	#if is_on_floor():
	#	jump_counter = 0
	#if Input.is_action_just_pressed("jump") and jump_counter < 2:
	#	velocity.y = JUMPFORCE
	#	jump_counter += 1
	
	#Gravity physics
	if velocity.y < FALL_SPEED :
		velocity.y = velocity.y + GRAVITY
	
	#Method to move player
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)
	


func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://Main.tscn")
