shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec2 uv = SCREEN_UV;
	vec3 rgb = textureLod(screen_texture, uv, 0.0).rgb;
	float grey = (rgb.x + rgb.y + rgb.x) / 3.0;
	rgb.x = grey;
	rgb.y = grey;
	rgb.z = grey;
	COLOR.rgb = rgb;
}