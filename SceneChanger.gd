extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_scene(old_scene_root : Node, scene_path : String, parent_node : Node ):
		unload_scene(old_scene_root)
		var new_scene_root = load_scene(scene_path).instance()
		parent_node.add_child(new_scene_root)
		
		
func unload_scene(scene):
	scene.queue_free()
	
func load_scene(scene_path):
	return load(scene_path)

