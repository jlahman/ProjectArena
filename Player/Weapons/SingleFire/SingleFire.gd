extends Node2D

export var offset_r : float
var _look_dir := Vector2.UP

func _ready():
	$Sprite.position.y -= offset_r
	$BulletSpawn.position.y -= offset_r

func _process(delta):
	get_input()
	self.global_rotation = _look_dir.angle() + PI/2

func get_input():
	var horizontal = Input.get_action_strength("look_right") - Input.get_action_strength("look_left")
	var vertical = Input.get_action_strength("look_down") - Input.get_action_strength("look_up")
	if(horizontal != 0.0 or vertical != 0.0):
		_look_dir = Vector2(horizontal, vertical).normalized()

