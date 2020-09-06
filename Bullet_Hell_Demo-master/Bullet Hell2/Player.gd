extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var bullet=preload("res://Bullet.tscn").instance()

#var screenWidth = ProjectSettings.get_setting("display/window/size/width")

var mousepos		#mouse pos
var angle			#angle of player to mouse
var speed=500		#speed of the player
var dir
var canFire=true	#determines if the boss can fire
var alive = true
var max_health = 50
var health = 50
var veloX = 0
var veloY = 0

signal health_changed

#var bulletSpeed = 100
#onready var p=get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("health_changed", health * 100/max_health)
	$Guntimer.set_wait_time(.2)		#cooldown time of the gun
	$Guntimer.connect("timeout", self, "_on_Guntimer_timeout")	#connects the timeout of the gun to the func on guntimer timeout
	#makeBoss()
#void add_collision_exception_with( Node Bullet )



func _on_Guntimer_timeout():		#allows the player to fire again
	canFire=true		#the player can fire
	

func fireBullets():			#func the fires the bullets
	if canFire==true:		# if the gun can be fired
		$Guntimer.start()	#start the cooldown
		var ball = preload("res://Bullets//PlayerBullet.tscn").instance()		#makes an instance of the bullet
		ball.position.x = self.position.x		#these lines set the position and angle of the bullets relative to the player
		ball.position.y = self.position.y
		ball.set_rotation(angle+PI/2)
		get_parent().add_child(ball)
		canFire=false		# the gun can't be fired




func setPlayerAngle(): # sets the player's image rotation to that of the mouse
	mousepos=get_global_mouse_position()
	angle=(mousepos-self.get_global_position()).angle()
	self.set_rotation(angle+PI/2)

func take_damage(damage):
	health -= damage
	emit_signal("health_changed", health * 100/max_health)
	if health <= 0:
		explode()

func explode():
	queue_free()

func _process(delta):
	setPlayerAngle()
	
	if Input.is_key_pressed(KEY_A):
		dir = get_transform().x
		self.move_and_slide(-dir * speed)
		#self.position.x -= 10
		#veloX -= 1
	if Input.is_key_pressed(KEY_D):
		dir = get_transform().x
		self.move_and_slide(dir * speed)
		#self.position.x += 10
		#veloX += 1
	if Input.is_key_pressed(KEY_W):
		dir = get_transform().y
		self.move_and_slide(-dir * speed)
		#self.position.y -= 10
		#veloY -= 1
	if Input.is_key_pressed(KEY_S):
		dir = get_transform().y
		self.move_and_slide(dir * speed)
		#self.position.y += 10
		#veloY += 1
	#self.position.y += veloY
	#self.position.x += veloX
	
	
	if(Input.is_mouse_button_pressed(BUTTON_LEFT)):
		fireBullets()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
