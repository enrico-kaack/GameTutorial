extends KinematicBody2D

var velocity = Vector2()
var speed = 200
var damage = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func start(position, dir, rotation):
	global_position = position
	velocity = dir.normalized() * speed
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		#velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit(damage)
			remove_and_skip()