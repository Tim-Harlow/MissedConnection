extends Spatial
var played = true
var played2 = true
var played3 = true
var played4 = true


func _on_Greeting2_body_entered(body):
	if played ==true:
		$Greeting.play()
		played = false



func _on_MainGreeting2_body_entered(body):
	if played2 ==true:
		$Greeting2.play()
		played2 = false


func _on_MainGreeting3_body_entered(body):
	if played3 ==true:
		$Greeting3.play()
		played3 = false


func _on_MainGreeting4_body_entered(body):
	if played4 ==true:
		$Greeting4.play()
		played4 = false
