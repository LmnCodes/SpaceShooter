extends KinematicBody

var velo = Vector3()
onready var c = $AudioStreamPlayer3D
onready var main = get_tree().current_scene
var KillParticles = load("res://src/Assets/Scenes/KillParticles.tscn")

func _physics_process(delta):
	move_and_slide(velo)


func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.queue_free()
		c.play()
		Global.score += 1

