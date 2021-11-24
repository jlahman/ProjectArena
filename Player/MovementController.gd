extends Node2D


var kinbody : KinematicBody2D
var velocity : Vector2
var forward_vector : Vector2
var speed = 32*3

func _ready():
	velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = get_new_direction()*speed + velocity *(0.666)
	velocity = kinbody.move_and_slide(velocity) 
	forward_vector = velocity.normalized()

func _input(event):
	pass

func get_new_direction():
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var vertical = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	return Vector2(horizontal, vertical).normalized()
