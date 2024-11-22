extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/AnimationPlayer.play("FadeIn")
	$AudioStreamPlayer2D.play()
	await $Sprite2D/AnimationPlayer.animation_finished
	$Sprite2D/AnimationPlayer.play("FadeOut")
	await $Sprite2D/AnimationPlayer.animation_finished
	$AudioStreamPlayer2D.stop()
	get_tree().change_scene_to_file("res://game_screen.tscn")  # Change to the next scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
