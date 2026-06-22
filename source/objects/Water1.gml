#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=the player always single jumps
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=refreshes double jump
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=!instance_place(x,y-32,object_index)
image_speed=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
 draw_sprite_9slice(sprIWBTGWater9slice,0,x,y,sprite_width,sprite_height,1,1,image_angle,image_blend,image_alpha,32,32,64,64,1)
