extends "res://Bullets/EnemyBullet1.gd"


var target

func _on_detectRadius_body_entered(body):
	if body.name =="Player":
		target = body



func _process(delta):
	if target:
		var tar_dir = Vector2(1,0).angle_to(target.position-position)
		#var target_dir = (target.global_position-global_position).normalized()
		#var cur_dir = Vector2(1,0).rotated(global_rotation)
		
		if (tar_dir - rotation) < PI:
			rotation += .01
		if (tar_dir - rotation) > PI:
			rotation -= .01


func _on_EnemyBullet1_body_entered(body):
	explode()
	if body.has_method('take_damage'):
		body.take_damage(damage)