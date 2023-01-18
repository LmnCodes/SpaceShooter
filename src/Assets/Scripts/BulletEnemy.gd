extends KinematicBody

onready var player = load("res://src/Assets/Scenes/player.tscn")
var velo = Vector3()
onready var main = get_tree().current_scene
var KillParticles = load("res://src/Assets/Scenes/KillParticles.tscn")

func _physics_process(delta):
	move_and_slide(velo)
	if transform.origin.z > 10:
		queue_free()



