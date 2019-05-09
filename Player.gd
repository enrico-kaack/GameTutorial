extends KinematicBody2D


export var speed = 200 
var screen_size  # Size of the game window.

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	moveIfPossible()
	
func moveIfPossible():
	var movement = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
        movement.x += 1
	if Input.is_action_pressed("ui_left"):
        movement.x -= 1
	if Input.is_action_pressed("ui_down"):
        movement.y += 1
	if Input.is_action_pressed("ui_up"):
        movement.y -= 1
	if movement.length() > 0:
        movement = movement.normalized() * speed
        $AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	#move but dont move when it would collide the next step
	move_and_slide(movement)
