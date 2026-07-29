#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=the player always double jumps
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=refreshes double jump
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=(1/50)*dt
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(image_blend == c_white) draw_sprite_9slice(sprRefreshingWater9slice,image_index,x,y,sprite_width,sprite_height,1,1,image_angle,image_blend,image_alpha,32,32,64,64,1)
else draw_sprite_9slice(sprRefreshingWaterWhite,image_index,x,y,sprite_width,sprite_height,1,1,image_angle,image_blend,image_alpha,32,32,64,64,1)
