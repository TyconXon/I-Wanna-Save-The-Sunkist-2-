#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
count=0
font=fntSignpost
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
This block is destroyed when the number of collected items exceeds or equals 'count'.
*/
//field count: number
//field sprite_index: sprite
//field font: font

if (savedata("itemcount")>=count) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_set2(fa_center,fa_middle)
draw_set_font(font)
draw_set_color(image_blend)
draw_text_transformed(x+sprite_width/2,y+sprite_height/2,count,image_xscale/2,image_yscale/2,image_angle)
draw_set_color($ffffff)
draw_set2(fa_left,fa_top)
