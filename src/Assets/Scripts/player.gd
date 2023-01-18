extends KinematicBody

const MAXSPEED = 30
const ACCELARATION = 0.75
var inputVector = Vector3()
var velo = Vector3()
var KillParticles = load("res://src/Assets/Scenes/KillParticles.tscn")

onready var guns = [$Gun1, $Gun2]
onready var main = get_tree().current_scene
var Bullet = load("res://src/Assets/Scenes/Bullet.tscn")
var Sound = load("res://src/Assets/SpaceShooter/Arwing/Invader/blaster.mp3")
const COOLDOWN = 8
var cooldown = 0
var health = 100
var max_health = 100
var i = 0


onready var c = $AudioStreamPlayer3D
	
func _physics_process(delta):

	$Health._update(health, max_health)
	
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputVector = inputVector.normalized()
	velo.x = move_toward(velo.x, inputVector.x * MAXSPEED, ACCELARATION)
	velo.y = move_toward(velo.y, inputVector.y * MAXSPEED, ACCELARATION)
	rotation_degrees.z = velo.x * -2
	rotation_degrees.x = velo.y / 2
	rotation_degrees.y = -velo.x / 2
	move_and_slide(velo)
	
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	
	if Input.is_action_pressed("Fire") and cooldown <= 0:
		cooldown = COOLDOWN * delta
		for i in guns:
			var bullet = Bullet.instance()
			main.add_child(bullet)
			bullet.transform = i.global_transform
			bullet.velo = transform.basis.z * -400
			c.play()
			
	if cooldown > 0:
		cooldown -= delta

	if health <= 0:
		get_tree().change_scene("res://src/Assets/Scenes/EndScreen.tscn")
	
	i += 1


func _on_Area_body_entered(body):
	if body.is_in_group("EnemyBullet"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		health -= 10
		print("hello")

