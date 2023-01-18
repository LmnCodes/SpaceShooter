extends KinematicBody

var spd = rand_range(50,70)
onready var player = load("res://src/Assets/Scenes/player.tscn")
var Bullet = load("res://src/Assets/Scenes/BulletEnemy.tscn")
onready var main = get_tree().current_scene
func _physics_process(delta):
	move_and_slide(Vector3(0, 0, spd))
	if transform.origin.z > 10:
		queue_free()


func _on_Timer_timeout():
	var bullet = Bullet.instance()
	main.add_child(bullet)
	bullet.transform = self.global_transform
	bullet.velo = transform.basis.z * -100
	
func _process(delta):
	
	var Player = player.instance()
	look_at(Player.translation, Vector3.UP)
