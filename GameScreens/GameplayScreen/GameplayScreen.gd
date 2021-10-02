extends MarginContainer


func _ready():
	pass # Replace with function body.


func _process(delta):
	$VBoxContainer/HBoxContainer/TimeGUI/TimeLabel.text = String($World.run_time)
	$VBoxContainer/HBoxContainer/HealthGUI/HealthLabel.text = "health : " + String($World.get_node("Player").health)
