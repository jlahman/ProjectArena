extends KinematicBody2D


func _ready():
	$MovementController.kinbody = self
	$Hitbox.connect("area_entered", self, "_on_hitbox_area_entered")


func _on_hitbox_area_entered(area):
	if(area.is_in_group("player") and area.is_in_group("hurtbox")):
		queue_free()
