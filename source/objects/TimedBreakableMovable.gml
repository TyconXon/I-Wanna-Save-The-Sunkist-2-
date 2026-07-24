#define Create_0
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
shaketime=0
pulltile=true
pulledtile=noone
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(distance_to_object(Player)<2) {
    event_perform(ev_collision,Player)
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_Player
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
if(!alarm[0]) alarm[0]=shaketime/dt
#define Other_4
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
//field shaketime: number
//field sprite_index: sprite

if(pulltile) pulledtile = tile_find_anywhere(x,y)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(alarm[0]<=0) {draw_self(); exit}
var a,b;

if (alarm[0] mod 4 < 2) {
    a=xstart-1
    b=ystart-1
} else {
    a=xstart+1
    b=ystart+1
}
draw_sprite(sprite_index,image_index,a,b)
