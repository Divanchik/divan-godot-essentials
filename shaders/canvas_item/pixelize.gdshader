shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_nearest;
uniform vec2 screen_resolution = vec2(1920, 1080);
uniform float strength: hint_range(0.0, 20.0, 1.0) = 20.0;

void fragment() {
	vec2 pxl = vec2(pow(2.0, float(strength))) * normalize(screen_resolution);
	COLOR.rgb = texture(SCREEN_TEXTURE, round(SCREEN_UV * pxl) / pxl).rgb;
}
