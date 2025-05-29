@icon("res://components/typed-text-icon.svg")
class_name TypedText extends RichTextLabel

@export_range(1, 1000) var type_speed: float = 100
var text_tween: Tween

## Анимированный текст
func type_text(t: String):
	if text_tween != null:
		text_tween.stop()
	text = t
	visible_ratio = 0
	text_tween = get_tree().create_tween()
	text_tween.tween_property(self, "visible_ratio", 1, len(t) / type_speed)
	
