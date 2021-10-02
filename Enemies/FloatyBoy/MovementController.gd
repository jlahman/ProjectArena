extends Node2D


var kinbody : KinematicBody2D
var velocity : Vector2
var sin_lookup_array : Array
var lookup_index_y : int
var lookup_index_x : int
var direction := Vector2.UP

func _ready():
	velocity = Vector2.ZERO
	lookup_index_y = 0
	lookup_index_y = 15
	for i in range(60):
		sin_lookup_array.append(sin(2*PI*i/60.0))

func _physics_process(delta):
	velocity.y = get_next_velocity_y()*8 + direction.y*16
	velocity.x = get_next_velocity_x()*8 + direction.x*16
	kinbody.move_and_slide(velocity)

func get_next_velocity_y():
	lookup_index_y = (lookup_index_y + 1) % 60
	return sin_lookup_array[lookup_index_y]*10

func get_next_velocity_x():
	lookup_index_x = (lookup_index_x + 1) % 60
	return sin_lookup_array[lookup_index_x]*10


