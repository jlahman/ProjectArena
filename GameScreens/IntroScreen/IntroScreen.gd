extends MarginContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Label.modulate.a = 0
	$VBoxContainer/Label2.modulate.a = 0
	$AnimationPlayer.connect("animation_finished", self, "_on_anime_finished")

func start():
	$AnimationPlayer.play("FadeIn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_anime_finished(_anime):
	find_parent("Game").change_scene("res://GameScreens/MainMenuScreen/MainMenuScreen.tscn")
