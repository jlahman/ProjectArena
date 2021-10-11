extends Node2D


var player : KinematicBody2D
var run_time : float

func _ready():
	player = $Player
	player.connect("player_died", self, "_on_player_died")
	run_time = 0.0

func _on_player_died():
	find_parent("Game").change_scene("res://GameScreens/MainMenuScreen/MainMenuScreen.tscn")

func _physics_process(delta):
	#$Background/Background3.modulate.r = fmod($Background/Background3.modulate.r + 0.005, 1.0)
	run_time += delta
	run_time = stepify(run_time, 0.01)
	
	$Background/Background3.modulate.b = abs(sin(run_time))
	$Background/Background3.modulate.r = abs(cos(run_time))
