extends KinematicBody2D

signal shoot
signal health_changed

var canFire=true
var health = 13
var max_health = 13


# Called when the node enters the scene tree for the first time.
func _ready():
	emit_signal("health_changed", health * 100/max_health)
	$Guntimer.set_wait_time(10)		#cooldown time of the gun
	$Guntimer.connect("timeout", self, "_on_Guntimer_timeout")	#connects the timeout of the gun to the func on guntimer timeout
	
#void add_collision_exception_with( Node Bullet )

func _on_Guntimer_timeout():
	canFire=true

func fireBullets():
	if canFire==true:
		$Guntimer.start()
		emit_signal('shoot', self.global_position, self.global_rotation)
		canFire=false

func take_damage(damage):
	health -= damage
	emit_signal("health_changed", health * 100/max_health)
	if health <= 0:
		explode()

func explode():
	queue_free()

func _process(delta):
	if canFire==true:
		fireBullets()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
