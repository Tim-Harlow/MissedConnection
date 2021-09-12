extends KinematicBody

# stats
var health : int = 5
var moveSpeed : float = 25.0
# attacking
var damage : int = 1
var attackRate : float = 1.0
var attackDist : float = 2.0
var moving = false

onready var player : Node = get_node("/root/MainScene/Player")
onready var timer : Timer = get_node("Timer")

func _ready():
	animate()
	move_and_attack()
	timer.set_wait_time(attackRate)
	timer.start()

func animate():
	var dist = translation.distance_to(player.translation)
	
	
	# calculate the direction to the player
	var dir = (player.translation - translation).normalized()
	dir.y = 0
	
	if translation.distance_to(player.translation) > attackDist and dist<=50:
		move_and_slide(dir * moveSpeed, Vector3.UP)


func _physics_process(delta):
	move_and_attack()
	
	
func move_and_attack():#distance to player
	var dist = translation.distance_to(player.translation)
	
	
	# calculate the direction to the player
	var dir = (player.translation - translation).normalized()
	dir.y = 0
	

	if translation.distance_to(player.translation) > attackDist and dist<=50:
		move_and_slide(dir * moveSpeed, Vector3.UP)
		moving = true
		
	if moving: 
		$AnimationPlayer.play("Walk")
		
# deals damage to the player
func attack ():
	
	player.take_damage(damage)

# called every 'attackRate' seconds
func _on_Timer_timeout():
	# if we're at the right distance, attack the player
	if translation.distance_to(player.translation) <= attackDist:
		attack()
	

		



