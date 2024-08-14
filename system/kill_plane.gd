extends Node

func kill(body):
	if !body.is_in_group("player"): return
	Global.restart.emit()
