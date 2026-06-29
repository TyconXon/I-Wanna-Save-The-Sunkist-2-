#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gSpeed = 20
addJump = true
image_speed = 0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if(Player.dead == true) exit
sound_play_auto("sndBoing")
Player.vspeed=-gSpeed*dt
if addJump {Player.djump=1}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field gSpeed : number
//field addJump : false

if(gSpeed < 0) image_number = 1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
