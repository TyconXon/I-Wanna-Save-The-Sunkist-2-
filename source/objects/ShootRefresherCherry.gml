#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=1/15
refreshTime=100
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=-1
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (alarm[0]==-1) {
    sound_play_auto("item_use_fruit_v2_01")
    with (Player) djump=min(djump,maxjumps-1)
    alarm[0]=50
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(alarm[0]!=-1) {
     d3d_set_fog(1,$ffffff,0,0)
     image_alpha = (alarm[0] / refreshTime)
     d3d_set_fog(0,0,0,0)
}
draw_self()
