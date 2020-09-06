extends "res://Bullets/EnemyBullet1.gd"

var canFire=true


func _ready():
	$Pause.set_wait_time(.2)
	$RealLifetime.set_wait_time(3)
	$RealLifetime.start()

func fireBullets():
	if canFire==true:
		$Pause.start()
		for x in range(16):
			flower(x)
		canFire=false

func flower(x):
	var ball = preload("res://Bullets//EnemyBullet1.tscn").instance()
	ball.position = position
	ball.rotation = x*PI/8 + rotation
	get_parent().add_child(ball)

func _on_Pause_timeout():
	canFire=true

func _process(delta):
	if canFire==true:
		rotation+=PI/16
		fireBullets()

func _on_RealLifetime_timeout():
	explode()
