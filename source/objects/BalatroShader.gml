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
shader_pixel_uniform_color("_COLOUR_1",color[1],alpha)
shader_pixel_uniform_color("_COLOUR_2",color[2],alpha)
shader_pixel_uniform_color("_COLOUR_3",color[3],alpha)
shader_pixel_uniform_f("_resolution",resolution)
shader_pixel_uniform_f("_time",savedatap("time"))
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field depth: number

/*preview
    depth=Field("depth")
    shader_vertex_set_passthrough()
        //balatrothing uniforms
    color[1] = $3a44de
    color[2] = $b46b00
    color[3] = $252316

    resolution[0] = global.width
    resolution[1] = global.height

    shader_pixel_set(ShaderFromPack("ps2_balatroshader"))

    shader_pixel_uniform_color("_COLOUR_1",color[1],1)
    shader_pixel_uniform_color("_COLOUR_2",color[2],1)
    shader_pixel_uniform_color("_COLOUR_3",color[3],1)
    shader_pixel_uniform_f("_resolution",resolution)
    shader_pixel_uniform_f("_time",33)
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shader_rainbow()
