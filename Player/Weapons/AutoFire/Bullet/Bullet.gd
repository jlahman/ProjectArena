extends Area2D

export var speed : float

var _look_dir : Vector2
var _lifetime : float

func _ready():
	speed = speed * 32
	_lifetime = 0.0
	_look_dir = Vector2.ZERO
	
	connect("area_entered", self, "_on_area_entered")

func _physics_process(delta):
	position.x = position.x + delta*speed*_look_dir.x
	position.y = position.y + delta*speed*_look_dir.y
	
	_lifetime += delta
	if(_lifetime > 3):
		queue_free()

func set_launch_direction(direction : Vector2):
	_look_dir = direction

func _on_area_entered(area):
	if(area.is_in_group("enemy") and area.is_in_group("hitbox")):
		queue_free()
