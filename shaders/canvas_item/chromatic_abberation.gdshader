shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest, repeat_enable;
uniform vec2 screen_size;
uniform vec2 red_offset;
uniform vec2 green_offset;
uniform vec2 blue_offset;

void fragment() {
	float dist = distance(SCREEN_UV, vec2(0.5, 0.5));
	vec2 uv_red = SCREEN_UV + red_offset / screen_size * dist;
	vec2 uv_green = SCREEN_UV + green_offset / screen_size * dist;
	vec2 uv_blue = SCREEN_UV + blue_offset / screen_size * dist;
	COLOR.rgb = vec3(
		texture(SCREEN_TEXTURE, uv_red).r,
		texture(SCREEN_TEXTURE, uv_green).g,
		texture(SCREEN_TEXTURE, uv_blue).b
	);
}
