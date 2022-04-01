extends KinematicBody2D

# set enemies at a constant speed
var speed = 3

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")
	
	motion += (Player.position - position)
	look_at(Player.position)
	
	motion = motion.normalized() * speed
	move_and_collide(motion)

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
