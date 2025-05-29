class_name AlertMessage extends Label


func _init(alert_level: AlertService.Level, alert_text: String) -> void:
	text = alert_text
	match alert_level:
		AlertService.Level.INFO:
			add_theme_color_override("font_color", Color.WHITE)
		AlertService.Level.WARNING:
			add_theme_color_override("font_color", Color.YELLOW)
		AlertService.Level.ERROR:
			add_theme_color_override("font_color", Color.RED)


func _ready() -> void:
	horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	self_modulate = Color.TRANSPARENT
	var tw = get_tree().create_tween()
	tw.tween_property(self, "self_modulate", Color.WHITE, 0.5)
