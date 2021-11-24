extends Node2D

export var offset_r : float
export var firerate_rps : float
var _look_dir := Vector2.UP

var bullet_scn : PackedScene
var bullet_spawn_node : Node

var _timer : Timer

var _state : int

enum {
	CHARGING,
	READY
}

func _ready():
	bullet_scn = load("res://Player/Weapons/AutoFire/Bullet/Bullet.tscn")
	$Sprite.position.y -= offset_r
	$BulletSpawnPoint.position.y -= offset_r
	_state = READY
	_init_timer()
	
func _init_timer() -> void:
	_timer = $Timer
	_timer.wait_time = 1.0/firerate_rps
	_timer.one_shot = true
	_timer.connect("timeout", self, "_on_timer_timeout")

func _on_timer_timeout():
	_state = READY
	
func _reset_timer():
	_timer.wait_time = 1.0/firerate_rps
	_timer.one_shot = true
	
func _process(delta):
	_look_dir = get_input()
	if(Input.is_action_pressed("ability_shoot") and _state == READY):
		
		var bullet := bullet_scn.instance()
		find_parent("World").add_child(bullet)
		bullet.transform = $BulletSpawnPoint.global_transform
		bullet.scale.x = 2
		bullet.scale.y = 2
		bullet.set_launch_direction(_look_dir)
		
		bullet = bullet_scn.instance()
		find_parent("World").add_child(bullet)
		bullet.transform = $BulletSpawnPoint.global_transform
		bullet.scale.x = 2
		bullet.scale.y = 2
		bullet.set_launch_direction(Vector2(cos(_look_dir.angle() - PI/40.0), sin(_look_dir.angle() - PI/40.0)))
		
		bullet = bullet_scn.instance()
		find_parent("World").add_child(bullet)
		bullet.transform = $BulletSpawnPoint.global_transform
		bullet.scale.x = 2
		bullet.scale.y = 2
		bullet.set_launch_direction(Vector2(cos(_look_dir.angle() + PI/40.0), sin(_look_dir.angle() + PI/40.0)))
		
		_state = CHARGING
		_reset_timer()
		_timer.start()

		
		
	self.global_rotation = _look_dir.angle() + PI/2

func get_input():
	var horizontal = Input.get_action_strength("look_right") - Input.get_action_strength("look_left")
	var vertical = Input.get_action_strength("look_down") - Input.get_action_strength("look_up")
	if(horizontal != 0.0 or vertical != 0.0):
		return (Vector2(horizontal, vertical).normalized())
	else:
		return _look_dir

