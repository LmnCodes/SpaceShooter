extends Label

func _process(delta):
	self.text = str("Score = " + str(Global.score))
