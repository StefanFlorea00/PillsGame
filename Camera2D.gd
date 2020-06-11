extends Camera2D
class_name MainCamera

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

var zoom_pos = Vector2()
var zoom_factor = 1.0

func _ready():
	make_current()

func _unhandled_input(event: InputEvent):

	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_W:
			position.y -= 20
		if event.pressed and event.scancode == KEY_S:
			position.y += 20
		if event.pressed and event.scancode == KEY_D:
			position.x += 20
		if event.pressed and event.scancode == KEY_A:
			position.x -= 20
	if event is InputEventMouseButton && event.button_index == BUTTON_RIGHT:
		get_tree().set_input_as_handled();
		if event.is_pressed():
			_previousPosition = event.position;
			_moveCamera = true;
		else:
			_moveCamera = false;
	elif event is InputEventMouseMotion && _moveCamera:
		get_tree().set_input_as_handled();
		position += (_previousPosition - event.position);
		_previousPosition = event.position;
	elif event is InputEventMouseButton:
		if event.is_pressed():
		# zoom in
			if event.button_index == BUTTON_WHEEL_UP:
				zoom_pos = get_global_mouse_position()
				zoom_factor += 0.1
			# call the zoom function
		# zoom out
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoom_pos = get_global_mouse_position()
				zoom_factor -= 0.1
			# call the zoom function
