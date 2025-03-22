extends Area2D

signal success

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		print("I've been hit")
		emit_signal("success")
