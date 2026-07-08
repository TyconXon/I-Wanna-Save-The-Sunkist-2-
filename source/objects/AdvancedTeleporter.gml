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
if (warpCoord[0]==noone or warpCoord[1]==noone or other.dead or (other.hspeed==0 and other.vspeed == 0)) exit;
if ( preserve[1] and ((other.hspeed>0 and other.bbox_right > bbox_right) or (other.hspeed<0 and other.bbox_left < bbox_left)) ) exit
if ( preserve[0] and ((other.vspeed>0 and other.bbox_top > bbox_top) or (other.vspeed<0 and other.bbox_bottom < bbox_bottom)) ) exit

if(preserve[0]) move_player(Player.x,warpCoord[1],0)
else if(preserve[1]) move_player(warpCoord[0],Player.y,0)
else move_player(warpCoord[0],warpCoord[1],0)
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (warpCoord[0]==noone or warpCoord[1]==noone or other.dead) exit;
if(preserve[0]) other.y = warpCoord[1]
if(preserve[1]) other.x = warpCoord[0]
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
