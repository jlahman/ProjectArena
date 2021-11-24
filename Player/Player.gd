extends KinematicBody2D


signal player_died
signal player_damaged

export var equipped_weapon_scn : PackedScene

var facing
var health_max = 3
var health = 3
var equipped_weapon : Node

func _ready():
	$MovementController.kinbody = self
	$Hitbox.connect("area_entered", self, "_on_area_entered_hitbox")
	equipped_weapon = equipped_weapon_scn.instance()
	$ActiveWeaponSlot.add_child(equipped_weapon)
	
func _process(delta):
	face_forward()

func face_forward():
	facing =  $MovementController.forward_vector.angle() + PI/2
	self.rotation = facing

func _on_area_entered_hitbox(area):
	if(area.is_in_group("enemy") and area.is_in_group("hurtbox")):
		health = health - 1
		health = max(0, health)
		print(health)
		if(health == 0):
			emit_signal("player_died")
		else:
			emit_signal("player_damaged")
