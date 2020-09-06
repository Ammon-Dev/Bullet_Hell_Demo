extends "res://Bullets/EnemyBullet1.gd"

func _ready():
	for x in range(8):
		flower(x)

func flower(x):
	var ball = preload("res://Bullets//EnemyBullet1.tscn").instance()
	ball.position = position
	ball.rotation = x*PI/4 + rotation
	get_parent().add_child(ball)