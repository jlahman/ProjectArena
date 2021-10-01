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
	var move_direction = Vector2.ZERO
	if(Input.is_action_pressed("move_left")):
		move_direction += Vector2.LEFT
	if(Input.is_action_pressed("move_right")):
		move_direction += Vector2.RIGHT
	if(Input.is_action_pressed("move_up")):
		move_direction += Vector2.UP
	if(Input.is_action_pressed("move_down")):
		move_direction += Vector2.DOWN
	return move_direction.normalized()
