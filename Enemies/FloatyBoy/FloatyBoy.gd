extends KinematicBody2D


func _ready():
	$MovementController.kinbody = self

