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
t = 0
direction = point_direction(x, y, Player.x, Player.y)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=1

if(t<=50*2){
if(t mod 10 != 0 )exit;
direction += clamp(point_direction(x, y, Player.x, Player.y)-direction, -25,25)
image_angle=direction}else{
    direction=270
    speed = 0
    gravity=8.9
    sprite_index = sprCherryGray
}
