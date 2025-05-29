extends ScrollContainer

@onready var message_container: VBoxContainer = $MessageContainer

func _ready() -> void:
	AlertService.log_info.connect(_on_log_info)
	AlertService.log_warning.connect(_on_log_warning)
	AlertService.log_error.connect(_on_log_error)

func _on_log_info(message: String):
	var alert = AlertMessage.new(AlertService.Level.INFO, message)
	message_container.add_child(alert)
	await get_tree().process_frame
	ensure_control_visible(alert)


func _on_log_warning(message: String):
	var alert = AlertMessage.new(AlertService.Level.WARNING, message)
	message_container.add_child(alert)
	await get_tree().process_frame
	ensure_control_visible(alert)


func _on_log_error(message: String):
	var alert = AlertMessage.new(AlertService.Level.ERROR, message)
	message_container.add_child(alert)
	await get_tree().process_frame
	ensure_control_visible(alert)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("show_debug_info"):
		if visible:
			hide()
		else:
			show()
