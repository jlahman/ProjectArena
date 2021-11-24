extends KinematicBody2D

export var detect_radius := 150.0

func _ready():
	$DetectBox/CollisionShape2D.shape.set("radius", detect_radius)
	$MovementController.kinbody = self
	$DetectBox.connect("area_entered", self, "_on_detect_area_entered")
	$Hitbox.connect("area_entered", self, "_on_hitbox_area_entered")

func _on_detect_area_entered(area):
	if(area.is_in_group("player") and area.is_in_group("hitbox")):
		$MovementController.tracking_node = area
	pass	

func _on_hitbox_area_entered(area):
	if(area.is_in_group("player") and area.is_in_group("hurtbox")):
		queue_free()
