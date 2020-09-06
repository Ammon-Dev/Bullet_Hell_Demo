extends "res://Bullets/EnemyBullet1.gd"

var canFire = true
var rot


func _ready():
	$Pause.set_wait_time(.1)
	$RealLifetime.set_wait_time(.7)
	$RealLifetime.start()

func fireBullets():
	if canFire==true:
		$Pause.start()
		spread()
		canFire=false

func spread():
	var x = rand_range(1, 10)
	for i in range(x):
		var ball = preload("res://Bullets//EnemyBullet1.tscn").instance()
		var y = rand_range(-2, 2)
		ball.position = self.position
		ball.speed = 10
		rot = self.rotation + y*PI/20
		ball.rotation = rot
		get_parent().add_child(ball)

func _process(delta):
	if canFire==true:
		fireBullets()

func _on_Pause_timeout():
	canFire = true


func _on_RealLifetime_timeout():
	explode()