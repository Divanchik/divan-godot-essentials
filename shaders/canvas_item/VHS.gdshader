shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear;
uniform vec2 screen_size = vec2(1920,1080);
uniform sampler2D noise;
uniform float strength = 0.0;
const float offset = 0.0005;

void fragment() {
	float row_offset = texture(noise, vec2(fract(TIME), SCREEN_UV.y)).r;
	vec2 uv = vec2(SCREEN_UV.x+row_offset*strength, SCREEN_UV.y);
	vec2 red_offset = vec2(offset);
	vec2 green_offset = vec2(-offset);
	
	float r = texture(SCREEN_TEXTURE, uv + red_offset).r;
	float g = texture(SCREEN_TEXTURE, uv + green_offset).g;
	float b = texture(SCREEN_TEXTURE, uv).b;
	COLOR.rgb = vec3(r, g, b);
}
