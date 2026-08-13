#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with(Portal) event_user(0)
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Collision_PortalOrb
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=901
applies_to=other
invert=0
arg0=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

if(image_xscale!=0 or image_yscale!=0) draw_sprite_9slice(sprFizzler9,0,x,y,sprite_width,sprite_height,1,1,image_angle,image_blend,image_alpha,32,32,64,64,1)
else draw_self()
