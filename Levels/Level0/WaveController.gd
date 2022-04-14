extends Node

var entities_holder : Node2D
var spawn_list : Array
var timer : Timer
var last_time = 0.0
var index = 0

var floaty_boy_scn 
var stalky_boy_scn
#class spawn

func _ready():
	floaty_boy_scn = load("res://Enemies/FloatyBoy/FloatyBoy.tscn")
	stalky_boy_scn = load("res://Enemies/StalkyBoy/StalkyBoy.tscn")
	load_spawns()
	timer = $Timer
	timer.one_shot = true
	timer.wait_time = spawn_list[0][0]
	timer.connect("timeout", self, "_on_spawn_timer_timeout")
	timer.start()

func _process(delta):
	pass

func load_spawns():
	spawn_list.append([2.0, ["FloatyBoi", Vector2(0.25, 0.25)]])
	spawn_list.append([4.0, ["FloatyBoi", Vector2(0.75, 0.25)],  ["FloatyBoi", Vector2(0.75, 0.75)]])
	spawn_list.append([8.0, ["FloatyBoi", Vector2(0.75, 0.75)]])
	spawn_list.append([15.0, ["StalkyBoi", Vector2(0.5, 0.75)]])

	# Wave 2
	spawn_list.append([25.0, ["FloatyBoi", Vector2(0.25, 0.25)], ["FloatyBoi", Vector2(0.75, 0.25)],  ["FloatyBoi", Vector2(0.75, 0.75)], ["FloatyBoi", Vector2(0.25, 0.75)]])
	spawn_list.append([27.0, ["FloatyBoi", Vector2(0.75, 0.50)],  ["FloatyBoi", Vector2(0.25, 0.50)]])
	spawn_list.append([29.0, ["FloatyBoi", Vector2(0.50, 0.25)], ["FloatyBoi", Vector2(0.50, 0.75)]])
	spawn_list.append([33.0, ["StalkyBoi", Vector2(0.50, 0.50)]])
	spawn_list.append([40.0, ["FloatyBoi", Vector2(0.25, 0.25)], ["FloatyBoi", Vector2(0.75, 0.25)],  ["FloatyBoi", Vector2(0.75, 0.75)], ["FloatyBoi", Vector2(0.25, 0.75)], ["FloatyBoi", Vector2(0.75, 0.50)],  ["FloatyBoi", Vector2(0.25, 0.50)], ["FloatyBoi", Vector2(0.50, 0.25)], ["FloatyBoi", Vector2(0.50, 0.75)]])

	# Wave 3 
	spawn_list.append([50.0, ["StalkyBoi", Vector2(0.2, 0.2)]])
	spawn_list.append([50.25, ["StalkyBoi", Vector2(0.3, 0.2)]])
	spawn_list.append([50.5, ["StalkyBoi", Vector2(0.4, 0.2)]])
	spawn_list.append([50.75, ["StalkyBoi", Vector2(0.5, 0.2)]])
	spawn_list.append([51.0, ["StalkyBoi", Vector2(0.6, 0.2)]])
	spawn_list.append([51.25, ["StalkyBoi", Vector2(0.7, 0.2)]])
	spawn_list.append([51.5, ["StalkyBoi", Vector2(0.8, 0.2)]])
	
	spawn_list.append([55.0, ["StalkyBoi", Vector2(0.8, 0.8)]])
	spawn_list.append([55.25, ["StalkyBoi", Vector2(0.7, 0.8)]])
	spawn_list.append([55.5, ["StalkyBoi", Vector2(0.6, 0.8)]])
	spawn_list.append([55.75, ["StalkyBoi", Vector2(0.5, 0.8)]])
	spawn_list.append([56.0, ["StalkyBoi", Vector2(0.4, 0.8)]])
	spawn_list.append([56.25, ["StalkyBoi", Vector2(0.3, 0.8)]])
	spawn_list.append([57.5, ["StalkyBoi", Vector2(0.2, 0.8)]])

func _on_spawn_timer_timeout():
	var entity_name
	var entity_position
	var e_index
	for i in range(1, spawn_list[index].size()):
		entity_name = spawn_list[index][i][0]
		entity_position = spawn_list[index][i][1]
		last_time = spawn_list[index][0]
		
		if(entity_name == "FloatyBoi"):
			var FloatyBoi = floaty_boy_scn.instance()
			FloatyBoi.position.x = entity_position.x * 640
			FloatyBoi.position.y = entity_position.y * 360
			entities_holder.add_child(FloatyBoi)
		elif(entity_name == "StalkyBoi"):
			var StalkyBoi = stalky_boy_scn.instance()
			StalkyBoi.position.x = entity_position.x * 640
			StalkyBoi.position.y = entity_position.y * 360
			entities_holder.add_child(StalkyBoi)
	
	index = (index + 1) % spawn_list.size()
	timer.one_shot = true
	timer.wait_time = abs(spawn_list[index][0] - last_time)
	#print(String(timer.wait_time))
	timer.start()
