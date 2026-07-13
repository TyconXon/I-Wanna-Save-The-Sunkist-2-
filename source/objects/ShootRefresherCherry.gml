#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=1/15
refreshTime=100
active=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=true
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (alarm[0]==-1) {
    sound_play_auto("item_use_fruit_v2_01")
    with (Player) djump=min(djump,maxjumps-1)
    alarm[0]=50*dt
    active=false
    with(other) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(alarm[0]!=-1) {
     d3d_set_fog(1,$000000,0,0)
     image_alpha = 1-(alarm[0] / refreshTime)
     image_speed = 0
     d3d_set_fog(0,0,0,0)
}else{image_speed=1/15}
draw_self()
