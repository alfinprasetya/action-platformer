extends KinematicBody2D

var velocity = Vector2.ZERO
export var speed = 200

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	
	move_and_slide(velocity)
	
	velocity.x = lerp(velocity.x, 0, 0.2)
