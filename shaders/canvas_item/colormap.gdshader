shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest, repeat_enable;
uniform sampler2D gradient;

void fragment() {
	vec3 clr = texture(SCREEN_TEXTURE, SCREEN_UV).rgb;
	float val = clamp(0.299 * clr.r + 0.587 * clr.g + 0.114 * clr.b, 0, 1);
	COLOR.rgb = texture(gradient, vec2(val)).rgb;
}
