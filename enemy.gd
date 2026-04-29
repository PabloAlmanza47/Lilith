extends Area2D

@export var health := 3
@export var drop_scene: PackedScene

var player_touching := false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(delta):
	if player_touching and Input.is_action_just_pressed("ui_accept"):
		take_damage(1)

func take_damage(amount):
	health -= amount
	print(name, " health: ", health)

	if health <= 0:
		die()

func die():
	if drop_scene:
		var drop = drop_scene.instantiate()
		drop.global_position = global_position
		get_parent().add_child(drop)

	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		player_touching = true

func _on_body_exited(body):
	if body.name == "Player":
		player_touching = false
