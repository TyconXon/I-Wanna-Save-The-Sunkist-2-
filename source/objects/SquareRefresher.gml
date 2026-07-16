#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//default jump refreshers respawn time - if set to zero, it only respawns when you land
refreshTime=100
active=1
preventRedundancy=false
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
    if(other.djump == max(1,other.djump-1)) exit
    other.djump=max(1,other.djump-1)
    active=0
    alarm[0]=refreshTime*dt
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field refreshTime: number
//field preventRedundancy: false
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
