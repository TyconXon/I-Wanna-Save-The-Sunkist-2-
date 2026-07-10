#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index = spr1x1b
image_xscale *= 32
image_yscale *= 32
firsthand = false
nolink = noone
visible=true

//surf=surface_set("focuszones",global.width,global.height)
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
surface_forget("focuszones");
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible = !instance_place(x,y,Player)
firsthand = instance_place(x,y,Player)
#define Collision_FocusZone
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(other.firsthand and !other.visible and other != nolink) visible=false
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field nolink: instance
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*

surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    draw_rect(x,y,image_xscale,image_yscale,c_black)
surface_set_target(application_surface)

draw_surface_ext(surf, view_xview,view_yview, 1, 1, 0, c_black, 0.75);

*/
