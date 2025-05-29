extends Control

@onready var typed_text: TypedText = $Panel/MarginContainer/VBoxContainer/TypedText
@onready var text_speed_slider: HSlider = $Panel/MarginContainer/VBoxContainer/TextSpeedSlider
@onready var plot: Plot = $PlotPanel/Plot


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_up"):
		AlertService.log_info.emit("Lorem ipsum dolor sit amet.")
	elif event.is_action_pressed("ui_right"):
		AlertService.log_warning.emit("Lorem ipsum dolor sit amet.")
	elif event.is_action_pressed("ui_down"):
		AlertService.log_error.emit("Lorem ipsum dolor sit amet.")


func _on_text_speed_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		typed_text.type_speed = text_speed_slider.value
	typed_text.type_text("Lorem ipsum dolor sit amet. Стрип клаб, ты знаешь, пупсик. Всю ночь ты кошка мур-мур.")


func _on_plot_timer_timeout() -> void:
	plot.update_clamp(Performance.get_monitor(Performance.TIME_PROCESS))
