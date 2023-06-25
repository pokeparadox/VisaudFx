shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec2 uv = SCREEN_UV;
	vec3 rgb = textureLod(screen_texture, uv, 0.0).rgb;
	rgb.x = 1.0 - rgb.x;
	rgb.y = 1.0 - rgb.y;
	rgb.z = 1.0 - rgb.z;
	COLOR.rgb = rgb;
}