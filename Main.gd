extends Node

export (PackedScene) var Mob
var score



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() # Replace with function body.
	new_game()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	$ScoreTimer.stop() # Replace with function body.
	$MobTimer.stop()
	
func new_game():
	score=0
	$Player.start($StartPosition.position)	
	$StartTimer.start()


func _on_StartTimer_timeout():
	$MobTimer.start()# Replace with function body.
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score +=1 # Replace with function body.


func _on_MobTimer_timeout():
	$MobPath/MobSpawnLocation.offset = randi() # Replace with function body.
	var mob = Mob.instance()
	add_child(mob)
	
	var direction= $MobPath/MobSpawnLocation.rotation + PI/2
	mob.position=$MobPath/MobSpawnLocation.position
	direction+=rand_range(-PI/4, PI/4)
	mob.rotation=direction
	mob.linear_velocity=Vector2(rand_range(mob.min_speed,mob.max_speed),0)
	mob.linear_velocity=mob.linear_velocity.rotated(direction)
