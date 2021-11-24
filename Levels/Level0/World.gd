extends Node2D


var player : KinematicBody2D
var run_time : float

func _ready():
	player = $Entities/Player
	player.connect("player_died", self, "_on_player_died")
	run_time = 0.0
	$WaveController.entities_holder = $Entities

func _on_player_died():
	find_parent("Game").change_scene("res://GameScreens/MainMenuScreen/MainMenuScreen.tscn")

func _physics_process(delta):
	run_time += delta

	
	$Foreground/Foreground1/Light2D.modulate.b = abs(sin(run_time))
	$Foreground/Foreground1/Light2D2.modulate.b = abs(sin(run_time))
	$Foreground/Foreground1/Light2D3.modulate.b = abs(sin(run_time))
	$Foreground/Foreground1/Light2D4.modulate.b = abs(sin(run_time))
	$Foreground/Foreground1/Light2D.modulate.r = abs(cos(run_time))
	$Foreground/Foreground1/Light2D2.modulate.r = abs(cos(run_time))
	$Foreground/Foreground1/Light2D3.modulate.r = abs(cos(run_time))
	$Foreground/Foreground1/Light2D4.modulate.r = abs(cos(run_time))
#	$Background/Background3.modulate.r = abs(cos(run_time))
