extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (int) var speed=5
export (int) var damage=1
export (int) var xvel
export (int) var yvel
#const velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Lifetime.set_wait_time(10)
	$Lifetime.connect("timeout", self, "_on_Lifetime_timeout")
	$Lifetime.start()

#func start():
#	speed

func explode():
	queue_free()

func _on_Lifetime_timeout():
	explode()

func _process(delta):
	xvel=cos((self.rotation-PI/2))*speed
	yvel=sin((self.rotation-PI/2))*speed
	self.position.x+=xvel
	self.position.y+=yvel

func _on_Bullet_body_entered(body):
	explode()
	if body.has_method('take_damage'):
		body.take_damage(damage)