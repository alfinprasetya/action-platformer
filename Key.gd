extends Area2D


func _ready():
	$AnimationPlayer.play("float")


func _on_Key_body_entered(body):
	queue_free()
