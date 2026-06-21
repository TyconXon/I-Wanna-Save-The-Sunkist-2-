#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
warpCoord[0]=x+16
warpCoord[1]=y+16

preserve[0]=0
preserve[1]=0

image_speed=0
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpCoord[0]!=noone && warpCoord[1]!=noone && !other.dead) {
    if(preserve[0]) move_player(Player.x,warpCoord[1],0)
    else if(preserve[1]) move_player(warpCoord[0],Player.y,0)
    else move_player(warpCoord[0],warpCoord[1],0)

    with (other) sound_play_auto("sndTeleport")
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field marker: instance
//field preserve: xy

warpCoord[0]=marker.x
warpCoord[1]=marker.y
