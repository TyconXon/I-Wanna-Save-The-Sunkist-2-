///custom_window_border(width,height)
//you can draw a custom fullscreen window border in this script
//screen size is passed via the arguments
var width,height,indx;

width=argument0
height=argument1
indx=0

//example: draw a simple repeating texture

if(background_index[indx]){
    texture_set_repeat(2)
    draw_primitive_begin_texture(pr_trianglestrip,background_get_texture( background_index[indx] ))

    draw_vertex_texture_color(0,0,0,0, background_blend[indx], background_alpha[indx])
    draw_vertex_texture_color(width,0,1,0, background_blend[indx], background_alpha[indx])
    draw_vertex_texture_color(0,height,0,1, background_blend[indx], background_alpha[indx])
    draw_vertex_texture_color(width,height,1,1, background_blend[indx], background_alpha[indx])

    draw_primitive_end()
}else{
    texture_set_repeat(2)
    draw_primitive_begin(pr_trianglestrip)

    draw_vertex_color(0,0, background_color, 1)
    draw_vertex_color(width,0, background_color, 1)
    draw_vertex_color(0,height, background_color, 1)
    draw_vertex_color(width,height, background_color, 1)

    draw_primitive_end()
}
