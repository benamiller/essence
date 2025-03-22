extends CharacterBody2D

var speed = 80.0          # Horizontal speed
var float_speed = 50.0    # Vertical control speed
var gravity = 5.0         # Gentle downward drift

@onready var sprite = $Sprite2D

func _physics_process(delta):
	# Horizontal movement
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	
	# Vertical movement
	var vertical = Input.get_axis("ui_up", "ui_down")
	if vertical != 0:
		velocity.y = vertical * float_speed
	else:
		velocity.y += gravity * delta  # Drift down if no input
	
	# Move and slide
	move_and_slide()
	
	if direction != 0:
		sprite.flip_h = direction < 0
