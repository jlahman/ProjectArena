extends MarginContainer


func _ready():
	$VBoxContainer/Label.modulate.a = 0
	$VBoxContainer/Label2.modulate.a = 0
	$AnimationPlayer.connect("animation_finished", self, "_on_anime_finished")
	$AnimationPlayer.play("FadeIn")
	

func _on_anime_finished(_anime):
	find_parent("Game").change_scene("res://GameScreens/MainMenuScreen/MainMenuScreen.tscn")
