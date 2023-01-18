extends TextureProgress

var bar_red = preload("res://src/barHorizontal_red_mid 200.png")
var bar_green = preload("res://src/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://src/barHorizontal_yellow_mid 200.png")
var texture


func update_bar(amount, full):
	texture_progress = bar_green
	if value < 0.25 * full :
		texture_progress = bar_red
	elif amount < 0.75 * full:
		texture_progress = bar_yellow
	value = amount
