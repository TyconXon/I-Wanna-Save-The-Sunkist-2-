#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//default jump refreshers respawn time - if set to zero, it only respawns when you land
refreshTime=100
active=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=true
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active and !other.dead) {
    other.djump=max(1,other.djump-1)
    active=0
    alarm[0]=refreshTime
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field refreshTime: number
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    image_alpha = 1
    draw_self()
}
else {
    image_alpha = (alarm[0] / refreshTime)
    draw_self_as(spr32x32)
}
