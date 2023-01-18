extends Sprite3D

onready var bar = $Viewport/HealthBar2D

func _update(value, full):
	bar.update_bar(value, full)

func _ready():
	texture = $Viewport.get_texture()
