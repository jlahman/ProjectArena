extends MarginContainer


func _ready():
	pass # Replace with function body.


func _process(delta):
	$VBoxContainer/HBoxContainer/TimeGUI/TimeLabel.text = String($World.run_time).pad_decimals(2)
	$VBoxContainer/HBoxContainer/HealthGUI/HealthLabel.text = "health : " + String($World.get_node("Player").health)
