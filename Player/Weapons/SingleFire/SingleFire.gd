extends Node2D

export var offset_r : float
var _look_dir := Vector2.UP

var bullet_scn : PackedScene
var bullet_spawn_node : Node

func _ready():
	bullet_scn = load("res://Player/Weapons/SingleFire/Bullet/Bullet.tscn")
	$Sprite.position.y -= offset_r
	$BulletSpawnPoint.position.y -= offset_r

func _process(delta):
	_look_dir = get_input()
	if(Input.is_action_just_pressed("ability_shoot")):
		var bullet := bullet_scn.instance()
		find_parent("World").add_child(bullet)
		bullet.transform = $BulletSpawnPoint.global_transform
		bullet.scale.x = 2
		bullet.scale.y = 2
		bullet.set_launch_direction(_look_dir)

		
		
	self.global_rotation = _look_dir.angle() + PI/2

func get_input():
	var horizontal = Input.get_action_strength("look_right") - Input.get_action_strength("look_left")
	var vertical = Input.get_action_strength("look_down") - Input.get_action_strength("look_up")
	if(horizontal != 0.0 or vertical != 0.0):
		return (Vector2(horizontal, vertical).normalized())
	else:
		return _look_dir

