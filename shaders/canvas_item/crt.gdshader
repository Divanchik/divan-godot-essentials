shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest, repeat_disable;
uniform float distortion = 0.2;
const vec2 uv_start = vec2(0, 0);
const vec2 uv_end = vec2(1, 1);
void fragment() {
	vec2 uv = SCREEN_UV - vec2(0.5);
	float tmp = dot(uv, uv);
	uv = SCREEN_UV + vec2(tmp * tmp * distortion) * uv;
	vec2 a = step(uv_start, uv) * (uv_end - step(uv_end, uv));
	COLOR.rgb = vec3(a.x*a.y) * texture(SCREEN_TEXTURE, uv).rgb;
}
