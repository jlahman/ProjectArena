extends VBoxContainer


var start_item 
var exit_item 

func _ready():
	start_item = $StartMenuItem
	exit_item = $ExitMenuItem
	
	start_item.get_node("Button").connect("button_up", self, "_on_start_chosen")
	exit_item.get_node("Button").connect("button_up", self, "_on_exit_chosen")

func _on_start_chosen():
	find_parent("Game").change_scene("res://GameScreens/GameplayScreen/GameplayScreen.tscn")

func _on_exit_chosen():
	get_tree().quit()
