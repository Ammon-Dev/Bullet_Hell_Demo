extends "res://Bullets//bullet.gd"


func _on_EnemyBullet1_body_entered(body):
	explode()
	if body.has_method('take_damage'):
		body.take_damage(damage)
