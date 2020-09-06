extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func setBossAngle():
	var current_dir = Vector2(1,0).angle_to($Player.position-$Boss.position)
	current_dir+=PI/2
	$Boss.set_rotation(current_dir)


# Called when the node enters the scene tree for the first time.
func _ready():
	$Boss.position.x=300
	$Boss.position.y=300
	#$Boss.connect('shoot', self, '_on_enemy_shoot')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	setBossAngle()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func patternSpread(pos, rot):
	var ball = preload("res://Bullets//EnemyBullet1.tscn").instance()
	ball.position = pos
	ball.rotation = rot
	get_parent().add_child(ball)

func ShotgunPattern(pos, rot):		#makes a spread of bullets randomly
	var ball = preload("res://Bullets//ShotgunBullet.tscn").instance()
	ball.position = pos
	ball.rotation = rot
	get_parent().add_child(ball)

func FlowerPattern(pos, rot):		#makes a circular spread of bullets around the player
	var ball = preload("res://Bullets//FlowerBullet.tscn").instance()
	ball.position = pos
	ball.rotation = rot
	get_parent().add_child(ball)

func SpiralPattern(pos, rot):		#makes a wide spiral pattern
	var ball = preload("res://Bullets//SpiralBullet.tscn").instance()
	ball.position = pos
	ball.rotation = rot
	get_parent().add_child(ball)

func SeekingBullet(pos, rot):		#not complete
	var ball = preload("res://Bullets//EnemyBullet1.tscn").instance()
	ball.position = pos
	ball.rotation = rot
	
	get_parent().add_child(ball)


func _on_Boss_shoot(pos, rot):
	var x = rand_range(0,3)
	if x<1:
		ShotgunPattern(pos, rot)
	elif x<2:
		FlowerPattern(pos, rot)
	elif x<3:
		SpiralPattern(pos, rot)
