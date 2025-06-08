shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
const float EMBOSS_WIDTH = 0.0005;
const float EMBOSS_HEIGHT = 0.0005;

vec4 sample_pixel(in vec2 uv, in float dx, in float dy) {
	return texture(SCREEN_TEXTURE, uv + vec2(dx, dy));
}

float convolve(in float[9] kernel, in vec4[9] color_matrix) {
	float res = 0.0;
	for (int i=0;i<9;i++) {
		res += kernel[i] * color_matrix[i].a;
	}
	return clamp(res+0.5, 0.0, 1.0);
}

void build_color_matrix(in vec2 uv, out vec4[9] color_matrix)
{
    float dxtex = EMBOSS_WIDTH;
    float dytex = EMBOSS_HEIGHT;

	color_matrix[0].rgb = sample_pixel(uv, -dxtex, -dytex).rgb;
	color_matrix[1].rgb = sample_pixel(uv, -dxtex, 0.0).rgb;
    color_matrix[2].rgb = sample_pixel(uv, -dxtex, dytex).rgb;
	color_matrix[3].rgb = sample_pixel(uv, 0.0, -dytex).rgb;
	color_matrix[4].rgb = sample_pixel(uv, 0.0, 0.0).rgb;
    color_matrix[5].rgb = sample_pixel(uv, 0.0, dytex).rgb;
	color_matrix[6].rgb = sample_pixel(uv, dxtex, -dytex).rgb;
	color_matrix[7].rgb = sample_pixel(uv, dxtex, 0.0).rgb;
    color_matrix[8].rgb = sample_pixel(uv, dxtex, dytex).rgb;
}

void build_mean_matrix(inout vec4[9] color_matrix)
{
   for (int i=0; i<9; i++)
   {
      color_matrix[i].a = (color_matrix[i].r + color_matrix[i].g + color_matrix[i].b) / 3.;
   }
}

void fragment() {
	float kerEmboss[9];
    kerEmboss[0] = 2.0;
    kerEmboss[1] = 0.0;
    kerEmboss[2] = 0.0;
    kerEmboss[3] = 0.0;
    kerEmboss[4] = -1.;
    kerEmboss[5] = 0.0;
    kerEmboss[6] = 0.0;
    kerEmboss[7] = 0.0;
    kerEmboss[8] = -1.;

	vec4[9] pixel_matrix;
	build_color_matrix(SCREEN_UV, pixel_matrix);
	build_mean_matrix(pixel_matrix);
	float convolved = convolve(kerEmboss, pixel_matrix)*2.0;
	COLOR.rgb = vec3(convolved)*texture(SCREEN_TEXTURE, SCREEN_UV).rgb;
}
