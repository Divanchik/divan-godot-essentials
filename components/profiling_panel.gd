extends Panel

@onready var info_timer: Timer = $InfoTimer
@onready var fps_counter: Label = $MarginContainer/GridContainer/FpsCounter
@onready var objects_counter: Label = $MarginContainer/GridContainer/ObjectsCounter
@onready var draw_calls_counter: Label = $MarginContainer/GridContainer/DrawCallsCounter
@onready var video_mem_counter: Label = $MarginContainer/GridContainer/VideoMemCounter
var video_mem: int


func _on_info_timer_timeout() -> void:
	if not visible:
		return
	fps_counter.set_text(str(Performance.get_monitor(Performance.TIME_FPS)))
	objects_counter.set_text(str(int(Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME))))
	draw_calls_counter.set_text(str(int(Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME))))
	video_mem = int(Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED)/(1024*1024))
	video_mem_counter.set_text("~%d MB" % video_mem)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("show_debug_info"):
		set_visible(not visible)
