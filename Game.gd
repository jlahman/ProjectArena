extends Node

export var default_screen : PackedScene
export var rotate_screen  := false
var _scene_parent : Node
var current_scene : Node

var timer : Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	if(rotate_screen):
		$CanvasLayer.set_rotation(-PI/2)
		$CanvasLayer.set_offset(Vector2(0, 640))
		OS.set_window_size(Vector2(480,854))
		
	timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.wait_time = 1.0
	timer.connect("timeout", self, "_on_timer_timeout")
	_scene_parent = $CanvasLayer/ScreenHolder
	current_scene = default_screen.instance()
	_scene_parent.add_child(current_scene)
	timer.start()


func _on_timer_timeout():
	timer.disconnect("timeout", self, "_on_timer_timeout")
	timer.queue_free()
	print("asjdkf")
	current_scene.start()
	
func change_scene(scene_path):
	current_scene = find_node("ScreenHolder").get_child(0)
	$SceneChanger.change_scene(current_scene, scene_path, _scene_parent)
	current_scene = find_node("ScreenHolder").get_child(0)

