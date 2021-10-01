extends VBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var start_item 
var exit_item 


# Called when the node enters the scene tree for the first time.
func _ready():
	start_item = $StartMenuItem
	exit_item = $ExitMenuItem
	
	start_item.get_node("Button").connect("button_up", self, "_on_start_chosen")
	exit_item.get_node("Button").connect("button_up", self, "_on_exit_chosen")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_start_chosen():
	find_parent("Game").change_scene("res://GameScreens/GameplayScreen/GameplayScreen.tscn")

func _on_exit_chosen():
	get_tree().quit()
