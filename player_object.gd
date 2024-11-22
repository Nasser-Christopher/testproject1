extends Node2D

var speed = 200  # Pixels per second

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):  # Map this to 'A'
		motion.x -= 1
	if Input.is_action_pressed("ui_right"):  # Map this to 'D'
		motion.x += 1
	if Input.is_action_pressed("ui_up"):  # Map this to 'W'
		motion.y -= 1
	if Input.is_action_pressed("ui_down"):  # Map this to 'S'
		motion.y += 1
	motion = motion.normalized() * speed * delta
	position += motion

	# Constrain to screen bounds
	# Constrain to screen bounds
	var viewport_size = get_viewport_rect().size
	var color_rect = $Sprite2D/ColorRect
	var color_rect_size = color_rect.size * color_rect.scale
	position.x = clamp(position.x, 0, viewport_size.x - color_rect_size.x)
	position.y = clamp(position.y, 0, viewport_size.y - color_rect_size.y)