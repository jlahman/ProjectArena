extends Node2D


var kinbody : KinematicBody2D
var velocity : Vector2
var sin_lookup_array : Array
var direction := Vector2.UP
var tracking_node : Node

func _ready():
	velocity = Vector2.ZERO
	for i in range(60):
		sin_lookup_array.append(sin(2*PI*i/60.0))
		

func _physics_process(delta):
	if(tracking_node):
		direction =  ((tracking_node.global_position - self.global_position)).normalized()
		velocity = direction * 210
	kinbody.move_and_slide(velocity)

