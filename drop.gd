extends Area2D

@export var value := 1

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player":
		print("Picked up drop! Value:", value)
		queue_free()
