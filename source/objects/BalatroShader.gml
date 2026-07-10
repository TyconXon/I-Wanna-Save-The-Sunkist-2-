#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//balatrothing uniforms
color[1] = $3a44de
color[2] = $b46b00
color[3] = $252316

resolution[0] = global.width
resolution[1] = global.height

//balatrothing uniforms
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field depth: number
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shader_pixel_reset()
//balatrothing uniforms
shader_pixel_set(unpack_shader(st_balatroshader))
shader_pixel_uniform_f("_iResolution",0.1)
shader_pixel_uniform_f("_iTime",savedatap("time"))

/*
shader_pixel_set(unpack_shader(ps2_balatroshader))
shader_pixel_uniform_color("_COLOUR_1",color[1],1)
shader_pixel_uniform_color("_COLOUR_2",color[2],1)
shader_pixel_uniform_color("_COLOUR_3",color[3],1)
shader_pixel_uniform_f("_resolution",0.1)
shader_pixel_uniform_f("_PIXEL_FILTER",20.0)

shader_pixel_uniform_ ("_time",savedatap("time"))
*/
